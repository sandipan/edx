"""Mixture model for matrix completion"""
from typing import Tuple
import numpy as np
from scipy.special import logsumexp
from common import GaussianMixture

def estep(X: np.ndarray, mixture: GaussianMixture) -> Tuple[np.ndarray, float]:
    """E-step: Softly assigns each datapoint to a gaussian component

    Args:
        X: (n, d) array holding the data, with incomplete entries (set to 0)
        mixture: the current gaussian mixture

    Returns:
        np.ndarray: (n, K) array holding the soft counts
            for all components for all examples
        float: log-likelihood of the assignment

    """
    n, _ = X.shape
    K, d = mixture.mu.shape
    log_post = np.zeros((n, K))
	
    log_likelihood = 0
    for i in range(n):
        indices = X[i] != 0
        d = sum(indices)
        log_post[i,:] = np.log(mixture.p + 1e-16) - np.sum((X[i,indices]-mixture.mu[:,indices])**2, axis=1)/(2*mixture.var) - (d/2)*(np.log(2) + np.log(np.pi) + np.log(mixture.var))
        #log_posts_max = np.max(log_post[i,:])
        LL = logsumexp(log_post[i,:]) #(log_posts_max + np.log(np.sum(np.exp(log_post[i,:] - log_posts_max))))
        log_post[i,:] -= LL
        log_likelihood += LL
		
    return np.exp(log_post), log_likelihood

'''
def estep(X: np.ndarray, mixture: GaussianMixture) -> Tuple[np.ndarray, float]:
    """E-step: Softly assigns each datapoint to a gaussian component

    Args:
        X: (n, d) array holding the data, with incomplete entries (set to 0)
        mixture: the current gaussian mixture

    Returns:
        np.ndarray: (n, K) array holding the soft counts
            for all components for all examples
        float: log-likelihood of the assignment

    """
    n, _ = X.shape
    K, d = mixture.mu.shape
    log_post = np.zeros((n, K))

    #log_likelihood = 0
    #for i in range(n):
    #    p_X_theta = 0
    #    indices = X[i] != 0
    #    d = sum(indices)
    #    for j in range(K):
    #        p_X_theta += mixture.p[j] * np.exp(-np.sum((X[i,indices]-mixture.mu[j,indices])**2)/(2*mixture.var[j])) / (2*np.pi*mixture.var[j])**(d/2)
    #    log_likelihood += np.log(p_X_theta) 

    log_likelihood = 0
    for i in range(n):
        #Z = 0
        indices = X[i] != 0
        d = sum(indices)
        log_posts = np.zeros(K) 
        for j in range(K):
            log_post[i,j] = np.log(mixture.p[j]) - np.sum((X[i,indices]-mixture.mu[j,indices])**2)/(2*mixture.var[j]) - (d/2)*(np.log(2) + np.log(np.pi) + np.log(mixture.var[j]))
            log_posts[j] = log_post[i,j] 
            #Z += np.exp(log_post[i,j])
        log_posts_max = np.max(log_posts)
        LL = (log_posts_max + np.log(np.sum(np.exp(log_posts - log_posts_max))))
        log_post[i,:] -= LL
        log_likelihood += LL 

    return np.exp(log_post), log_likelihood
'''

def mstep(X: np.ndarray, post: np.ndarray, mixture: GaussianMixture,
          min_variance: float = .25) -> GaussianMixture:
    """M-step: Updates the gaussian mixture by maximizing the log-likelihood
    of the weighted dataset

    Args:
        X: (n, d) array holding the data, with incomplete entries (set to 0)
        post: (n, K) array holding the soft counts
            for all components for all examples
        min_variance: the minimum variance for each gaussian

    Returns:
        GaussianMixture: the new gaussian mixture
    """
    n, d = X.shape
    _, K = post.shape

    n_hat = post.sum(axis=0)
    p = n_hat / n

    mu = np.zeros((K, d))
    var = np.zeros(K)
    indices = np.array([(X[i] != 0) for i in range(n)])
    for j in range(K):
        #tot = np.sum(np.array([post[i,j]*indices[i] for i in range(n)]), axis=0)
        #mut = np.sum(np.array([post[i,j]*indices[i]*X[i] for i in range(n)]), axis=0)
        tot = np.sum(post[:,j][:,None]*indices, axis=0)
        mut = np.sum(post[:,j][:,None]*indices*X, axis=0)
        for l in range(d):
           if tot[l] >= 1:
               mu[j, l] = mut[l] / tot[l]  
        #var[j] = np.sum([sum(post[i,j]*indices[i]*(X[i]-mu[j])**2) for i in range(n)]) / np.sum([post[i,j]*sum(indices[i]) for i in range(n)])
        var[j] = np.sum(np.sum(post[:,j][:,None]*indices*(X-mixture.mu[j])**2, axis=0)) / np.sum(post[:,j]*np.sum(indices, axis=1))
        var[j] = max(min_variance, var[j]) 
        
    return GaussianMixture(mu, var, p)

'''
def mstep(X: np.ndarray, post: np.ndarray,
	min_variance: float = .25) -> GaussianMixture:
	"""M-step: Updates the gaussian mixture by maximizing the log-likelihood
	of the weighted dataset

	Args:
		X: (n, d) array holding the data, with incomplete entries (set to 0)
		post: (n, K) array holding the soft counts
			for all components for all examples
		min_variance: the minimum variance for each gaussian

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
		tot = np.sum(np.array([post[i,j]*(X[i] != 0) for i in range(n)]), axis=0)
		mut = np.sum(np.array([post[i,j]*(X[i] != 0)*X[i] for i in range(n)]), axis=0)
		for l in range(d):
		   if tot[l] > 1:
			   mu[j, l] = mut[l] / tot[l]  
		var[j] = np.sum([sum(post[i,j]*(X[i] != 0)*(X[i]-mu[j])**2) for i in range(n)]) / np.sum([post[i,j]*sum(X[i] != 0) for i in range(n)])
		var[j] = max(min_variance, var[j]) 
	
	return GaussianMixture(mu, var, p)  
'''

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

def fill_matrix(X: np.ndarray, mixture: GaussianMixture) -> np.ndarray:
    """Fills an incomplete matrix according to a mixture model

    Args:
        X: (n, d) array of incomplete data (incomplete entries =0)
        mixture: a mixture of gaussians

    Returns
        np.ndarray: a (n, d) array with completed data
    """
    n, _ = X.shape
    K, _ = mixture.mu.shape
    X_pred = X.copy()
    for i in range(n):
        indices = X[i] == 0
        if sum(indices) > 0:
           X_pred[i, indices] = np.sum(np.array([mixture.p[j]*np.random.normal(mixture.mu[j, indices], np.sqrt(mixture.var[j]), 1) for j in range(K)]), axis=0) #sum([mixture.p[j]*np.random.multivariate_normal(mixture.mu[j, indices], 
           #X_pred[i, indices] = np.sum(np.array([mixture.p[j]*np.random.normal(mixture.mu[j, indices], np.sqrt(mixture.var[j]), 1) for j in range(K)]), axis=0) #sum([mixture.p[j]*np.random.multivariate_normal(mixture.mu[j, indices], mixture.var[j]*np.eye(sum(indices)), 1)[0,0] for j in range(K)])
    return X_pred
