"""Mixture model for matrix completion"""
from typing import Tuple
import numpy as np
from scipy.special import logsumexp
from common import GaussianMixture
import pandas as pd
from sklearn import manifold
import matplotlib.pylab as plt
import seaborn as sns

def estep(X: np.ndarray, mixture: GaussianMixture, missing: int = 0) -> Tuple[np.ndarray, float]:
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
        indices = X[i] != missing
        d = sum(indices)
        log_post[i,:] = np.log(mixture.p + 1e-16) - np.sum((X[i,indices]-mixture.mu[:,indices])**2, axis=1)/(2*mixture.var) - (d/2)*(np.log(2) + np.log(np.pi) + np.log(mixture.var))
        #log_posts_max = np.max(log_post[i,:])
        LL = logsumexp(log_post[i,:]) #(log_posts_max + np.log(np.sum(np.exp(log_post[i,:] - log_posts_max))))
        log_post[i,:] -= LL
        log_likelihood += LL
		
    return np.exp(log_post), log_likelihood


def mstep(X: np.ndarray, post: np.ndarray, mixture: GaussianMixture,
	min_variance: float = .25, missing: int = 0) -> GaussianMixture:
	"""M-step: Updates the gaussian mixture by maximizing the log-likelihood
	of the weighted dataset

	Args:
		X: (n, d) array holding the data, with incomplete entries (set to 0)
		post: (n, K) array holding the soft counts
			for all components for all examples
		mixture: the current gaussian mixture
		min_variance: the minimum variance for each gaussian

	Returns:
		GaussianMixture: the new gaussian mixture
	"""
	n, d = X.shape
	_, K = post.shape

	n_hat = post.sum(axis=0)
	p = n_hat / n

	mu = mixture.mu
	#mu = np.zeros((K, d))
	var = np.zeros(K)

	for j in range(K):
		tot = np.sum(np.array([post[i,j]*(X[i] != missing) for i in range(n)]), axis=0)
		mut = np.sum(np.array([post[i,j]*(X[i] != missing)*X[i] for i in range(n)]), axis=0)
		for l in range(d):
		   if tot[l] > 1:
			   mu[j, l] = mut[l] / tot[l]  
		var[j] = np.sum([sum(post[i,j]*(X[i] != missing)*(X[i]-mu[j])**2) for i in range(n)]) / np.sum([post[i,j]*sum(X[i] != missing) for i in range(n)])
		var[j] = max(min_variance, var[j]) 
	
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
        mixture = mstep(X, post, mixture)
        print(log_likelihood)

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
    log_post = np.zeros((n, K))
    for i in range(n):
        indices = X[i] != 0
        d = sum(indices)
        log_post[i,:] = np.log(mixture.p + 1e-16) - np.sum((X[i,indices]-mixture.mu[:,indices])**2, axis=1)/(2*mixture.var) - (d/2)*(np.log(2) + np.log(np.pi) + np.log(mixture.var))
        LL = logsumexp(log_post[i,:])
        log_post[i,:] -= LL
    post = np.exp(log_post)
    #post, log_likelihood = estep(X, mixture)
    #print(post)
    #mixture = mstep(X, post, mixture)
    X_pred = post@mixture.mu
    for i in range(n):
        indices = X[i] != 0
        X_pred[i, indices] = X[i, indices]
    '''
    for i in range(n):
        mindices = X[i] == 0
        indices = X[i] != 0
        if sum(mindices) > 0:
           #prob = np.exp(-np.sum((X[i,indices]-mixture.mu[:,indices])**2)/(2*mixture.var))/(2*np.pi*mixture.var)**(len(indices)/2)
           #prob /= sum(prob)
           X_pred[i, mindices] = np.sum(np.array([post[i,j]*mixture.mu[j, mindices] for j in range(K)]), axis=0) #sum([mixture.p[j]*np.random.multivariate_normal(mixture.mu[j, indices], 
           #X_pred[i, mindices] = np.sum(np.array([prob[j]*mixture.mu[j, mindices] for j in range(K)]), axis=0) #sum([mixture.p[j]*np.random.multivariate_normal(mixture.mu[j, indices], 
           #X_pred[i, indices] = np.sum(np.array([mixture.p[j]*np.random.normal(mixture.mu[j, indices], np.sqrt(mixture.var[j]), 1) for j in range(K)]), axis=0) #sum([mixture.p[j]*np.random.multivariate_normal(mixture.mu[j, indices], 
           #X_pred[i, indices] = np.sum(np.array([mixture.p[j]*np.random.normal(mixture.mu[j, indices], np.sqrt(mixture.var[j]), 1) for j in range(K)]), axis=0) #sum([mixture.p[j]*np.random.multivariate_normal(mixture.mu[j, indices], mixture.var[j]*np.eye(sum(indices)), 1)[0,0] for j in range(K)])
	'''
    return X_pred
	
def plot_heatmap(X, iter):
	plt.figure(figsize=(10,15))
	ax = plt.axes()
	ax = sns.heatmap(X, annot=True, fmt=".3f")
	ax.set_title('Filled matrix (EM iter {})'.format(iter), size=25)
	plt.savefig('filled_matrix_{:02d}.png'.format(iter)) #, bbox_in='tight')
	plt.close()
		
def plot_ll(ll):
	plt.figure(figsize=(10,10))
	#plt.subplots_adjust(0.05,0.05,0.99,0.95,0.05,0.05)
	plt.plot(range(1, len(ll)+1), ll, 'r.-')
	plt.grid(), plt.xlabel('iteration', size=20), plt.ylabel('log-likelihood', size=20), plt.title('EM log-likelihood (iter={})'.format(len(ll)), size=25)
	plt.xticks(range(1, len(ll)+1))
	plt.margins(0,0)
	plt.savefig('ll_{:02d}.png'.format(len(ll)), bbox_in='tight', pad_in=0)
	plt.close()	

def plot_mds(X, mixture, post, iter):
	clf = manifold.MDS(n_components=2, n_init=1, max_iter=100)
	X_mds = clf.fit_transform(X)
	plt.figure(figsize=(10,10))
	#df = pd.DataFrame({'x':X_mds[:,0], 'y':X_mds[:,1]})
	#df['color'] = None
	#for i in range(X.shape[0]):
	#	df['color'].values[i] = int(100*post[i,0])*["#FF0000"] + int(100*post[i,1])*["#00FF00"] + int(100*post[i,2])*["#0000FF"] + int(100*post[i,3])*["#FFFFFF"]
	#print(df.head())
	for i in range(X.shape[0]):
		plt.scatter(X_mds[i,0], X_mds[i,1], color=post[i,0]*np.array([1,0,0])+post[i,1]*np.array([0,1,0])+post[i,2]*np.array([0,0,1]+post[i,3]*np.array([1,1,1])))#scatter_kws={'c':df['color']}) #sns.scatterplot
	mu_mds = clf.fit_transform(mixture.mu)
	cmaps = ['Reds', 'Greens', 'Blues', 'Greys']
	for i in range(len(mu_mds)):
		samples = np.random.multivariate_normal(mu_mds[i], mixture.var[i]*np.eye(2), 1000) #np.random.normal(mu_mds, mixture.sigma, (1000,2))
		sns.kdeplot(samples[:,0], samples[:,1], cmap=cmaps[i], shade=True, shade_lowest=False)
	plt.title("MDS embedding of rating matrix & GMM (EM iter {})".format(iter), size=25)
	plt.margins(0,0)
	plt.savefig('gauss_mds_{:02d}.png'.format(iter), bbox_in='tight', pad_in=0)
	plt.close()		

def plot_mds2(X, mixture, iter):
	clf = manifold.MDS(n_components=2, n_init=1, max_iter=100)
	X_mds = clf.fit_transform(X)
	plt.figure(figsize=(10,10))
	plt.scatter(X_mds[:,0], X_mds[:,1], c='r')
	mu_mds = clf.fit_transform(mixture.mu)
	for i in range(len(mu_mds)):
		samples = np.random.multivariate_normal(mu_mds[i], mixture.var[i]*np.eye(2), 1000) #np.random.normal(mu_mds, mixture.sigma, (1000,2))
		sns.kdeplot(samples[:,0], samples[:,1], cmap='Reds', shade=True, shade_lowest=False)
	plt.title("MDS embedding of rating matrix & GMM (EM iter {})".format(iter), size=25)
	plt.margins(0,0)
	plt.savefig('gauss_mds_{:02d}.png'.format(iter), bbox_in='tight', pad_in=0)
	plt.close()		
	
def show_image(X, iter):
	X = np.clip(X, 0, 1)
	#X = (255*X).astype(np.uint8)
	plt.gray()
	plt.imsave('im_{:03d}.png'.format(iter), X)
	
def fill_matrix2(X: np.ndarray, mixture: GaussianMixture, missing: int=0) -> np.ndarray:
	"""Fills an incomplete matrix according to a mixture model

	Args:
		X: (n, d) array of incomplete data (incomplete entries =0)
		mixture: a mixture of gaussians

	Returns
		np.ndarray: a (n, d) array with completed data
	"""
	prev_log_likelihood = None
	log_likelihood = None
	log_likelihoods = []
	
	iter = 1
	while (prev_log_likelihood is None or abs(log_likelihood - prev_log_likelihood) > 1e-6*np.abs(log_likelihood)):
		prev_log_likelihood = log_likelihood
		post, log_likelihood = estep(X, mixture, missing=missing)
		mixture = mstep(X, post, mixture, missing=missing)
		print(log_likelihood)
		X_pred = post@mixture.mu
		for i in range(X.shape[0]):
			indices = X[i] != missing
			X_pred[i, indices] = X[i, indices]
		if iter > 1:
			log_likelihoods.append(log_likelihood)
			#plot_heatmap(X_pred, iter)
			show_image(X_pred, iter)
			plot_ll(log_likelihoods)
			#plot_mds(X_pred, mixture, post, iter)
			plot_mds2(X_pred, mixture, iter)
		iter += 1
	return X_pred
