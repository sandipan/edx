"""Mixture model using EM"""
from typing import Tuple
import numpy as np
from common import GaussianMixture



def estep(X: np.ndarray, mixture: GaussianMixture) -> Tuple[np.ndarray, float]:
    """E-step: Softly assigns each datapoint to a gaussian component

    Args:
        X: (n, d) array holding the data
        mixture: the current gaussian mixture

    Returns:
        np.ndarray: (n, K) array holding the soft counts
            for all components for all examples
        float: log-likelihood of the assignment
    """
    n, _ = X.shape
    K, d = mixture.mu.shape
    post = np.zeros((n, K))
	
    log_likelihood = 0
    for i in range(n):
        p_X_theta = 0
        for j in range(K):
	        p_X_theta += mixture.p[j] * np.exp(-np.sum((X[i]-mixture.mu[j])**2)/(2*mixture.var[j])) / (2*np.pi*mixture.var[j])**(d/2)
        log_likelihood += np.log(p_X_theta) 

    for i in range(n):
	    Z = 0
	    for j in range(K):
		    post[i,j] = mixture.p[j] * np.exp(-np.sum((X[i]-mixture.mu[j])**2)/(2*mixture.var[j])) / (2*np.pi*mixture.var[j])**(d/2)
		    Z += post[i,j]
	    post[i,:] /= Z
		
    return post, log_likelihood


def mstep(X: np.ndarray, post: np.ndarray) -> GaussianMixture:
    """M-step: Updates the gaussian mixture by maximizing the log-likelihood
    of the weighted dataset

    Args:
        X: (n, d) array holding the data
        post: (n, K) array holding the soft counts
            for all components for all examples

    Returns:
        GaussianMixture: the new gaussian mixture
    """
    n, d = X.shape
    _, K = post.shape

    n_hat = post.sum(axis=0)
    p = n_hat / n

    mu = np.zeros((K, d))
    var = np.zeros(K)

    for j in range(K):
        mu[j] = np.sum(np.array([post[i,j]*X[i] for i in range(n)]), axis=0) / n_hat[j]
        var[j] = np.sum([post[i,j]*(X[i]-mu[j])**2 for i in range(n)]) / (n_hat[j]*d)		
        
    return GaussianMixture(mu, var, p)
	

def run(X: np.ndarray, mixture: GaussianMixture,
        post: np.ndarray) -> Tuple[GaussianMixture, np.ndarray, float]:
    """Runs the mixture model

    Args:
        X: (n, d) array holding the data
        post: (n, K) array holding the soft counts
            for all components for all examples

    Returns:
        GaussianMixture: the new gaussian mixture
        np.ndarray: (n, K) array holding the soft counts
            for all components for all examples
        float: log-likelihood of the current assignment
    """
    prev_log_likelihood = None
    log_likelihood = None
    while (prev_log_likelihood is None or log_likelihood - prev_log_likelihood > 1e-6*np.abs(log_likelihood)):
        prev_log_likelihood = log_likelihood
        post, log_likelihood = estep(X, mixture)
        mixture = mstep(X, post)
        #print(log_likelihood)

    return mixture, post, log_likelihood

