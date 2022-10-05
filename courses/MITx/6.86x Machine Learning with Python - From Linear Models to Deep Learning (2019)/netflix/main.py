import numpy as np
import kmeans
import common
import naive_em
import em

'''
X = np.loadtxt("toy_data.txt")
print(X.shape)
'''

'''
costs = {k:np.Inf for k in range(1,5)}
for K in range(1,5):
	for seed in range(5):
		mixture, post = common.init(X, K, seed)
		mixture, post, cost = kmeans.run(X, mixture, post)
		costs[K] = min(costs[K], cost)
for K in costs:
	print(K, costs[K])
'''

'''
#log_likelihoods = {k:-np.Inf for k in range(1,5)}
bics = {k:-np.Inf for k in range(1,5)}
for K in range(1,5):
	for seed in range(5):
		mixture, post = common.init(X, K, seed)
		mixture, post, log_likelihood = naive_em.run(X, mixture, post)
		#log_likelihoods[K] = max(log_likelihoods[K], log_likelihood)
		bics[K] = max(bics[K], common.bic(X, mixture, log_likelihood))
#for K in log_likelihoods:
#	print(K, log_likelihoods[K])
for K in bics:
	print(K, bics[K])
'''

'''
import matplotlib.pylab as plt
K = 2
#plt.figure(figsize=(20,10))
mixture, post = common.init(X, K)
mixture, post, cost = kmeans.run(X, mixture, post)
print(mixture.p, mixture.mu, mixture.var)
plt.subplot(121), plt.scatter(X[:,0], X[:,1], s=50, c=np.argmax(post, axis=1), cmap='jet'), plt.title('kmeans K={}'.format(K))
mixture, post = common.init(X, K)
mixture, post, log_likelihood = naive_em.run(X, mixture, post)
print(mixture.p, mixture.mu, mixture.var)
plt.subplot(122), plt.scatter(X[:,0], X[:,1], s=50, c=np.argmax(post, axis=1), cmap='jet'), plt.title('EM K={}'.format(K))
plt.show()
'''

'''
X = np.array([[0.85794562, 0.84725174],
 [0.6235637,  0.38438171],
 [0.29753461, 0.05671298],
 [0.27265629, 0.47766512],
 [0.81216873, 0.47997717],
 [0.3927848,  0.83607876],
 [0.33739616, 0.64817187],
 [0.36824154, 0.95715516],
 [0.14035078, 0.87008726],
 [0.47360805, 0.80091075],
 [0.52047748, 0.67887953],
 [0.72063265, 0.58201979],
 [0.53737323, 0.75861562],
 [0.10590761, 0.47360042],
 [0.18633234, 0.73691818]])
p = [0.1680912,  0.15835331, 0.21384187, 0.14223565, 0.14295074, 0.17452722]
mu = np.array([[0.6235637,  0.38438171],
 [0.3927848,  0.83607876],
 [0.81216873, 0.47997717],
 [0.14035078, 0.87008726],
 [0.36824154, 0.95715516],
 [0.10590761, 0.47360042]])
var = [0.10038354, 0.07227467, 0.13240693, 0.12411825, 0.10497521, 0.12220856]
ll = -1934.245753
print(common.bic(X, common.GaussianMixture(mu, var, p), ll))
'''

import matplotlib.pylab as plt
#X = np.loadtxt("netflix_incomplete.txt")
#X = np.loadtxt("test_incomplete.txt") 

missing = -1
X = np.mean(plt.imread('lena.png'), axis=2)
#X_mask = np.mean(plt.imread('lena_mask.png'), axis=2)
X_mask = np.random.normal(size=X.shape)
#X = X.astype(np.int)
#X_mask = X_mask.astype(np.int)
#X = X / 255
th = 0.01 #0.5
X[X_mask < th] = 0
plt.gray()
plt.imshow(X)
plt.show()
X[X_mask < th] = missing
print(X.shape, X.dtype)

'''
K = 10 #15
mixture, post = common.init(X, K)
#print(mixture.mu)
#print(mixture.var)
#print(mixture.p)
#print(post)
#X[X_mask < th] = missing
X_pred = em.fill_matrix2(X, mixture, missing)
#print(X_pred)
print(common.rmse(X, X_pred))
'''

#em.show_image(X, 0)

#import matplotlib.pylab as plt
#import seaborn as sns
#em.plot_heatmap(X, 0)
for i in range(1,25):
	plt.figure(figsize=(20,20))
	plt.subplots_adjust(0,0,1,0.95,0,0)
	ax1 = plt.subplot2grid((2, 2), (0, 0), rowspan=2)
	ax2 = plt.subplot2grid((2, 2), (0, 1), colspan=1)
	ax3 = plt.subplot2grid((2, 2), (1, 1), colspan=1)
	ax1.imshow(plt.imread('im_{:03d}.png'.format(i))), ax1.axis('off'), ax1.set_title('Inpainted image', size=25)
	ax2.imshow(plt.imread('ll_{:02d}.png'.format(i))), ax2.axis('off')
	ax3.imshow(plt.imread('gauss_mds_{:02d}.png'.format(i))), ax3.axis('off')
	plt.suptitle('Image inpainting with GMM-EM (K=15)', size=20)
	plt.savefig('gmm_em_{:03d}.png'.format(i))
	plt.close()

'''
K = 4
mixture, post = common.init(X, K)
#post, log_likelihood = em.estep(X, mixture)
#print(post)
#print(log_likelihood)
#mixture = em.mstep(X, post, mixture)
#print(mixture.mu)
#print(mixture.var)
#print(mixture.p)
mixture, post, log_likelihood = em.run(X, mixture, post)
print(mixture.mu)
print(mixture.var)
print(mixture.p)
print(post)
print(log_likelihood)
X_pred = em.fill_matrix(X, mixture)
print(X_pred)
print(common.rmse(X, X_pred))
'''
'''
K = 12
seed = 2
mixture, post = common.init(X, K, seed)
mixture, post, log_likelihood = em.run(X, mixture, post)
X_pred = em.fill_matrix(X, mixture)
X_gold = np.loadtxt('netflix_complete.txt')
print(common.rmse(X_gold, X_pred))
'''

'''
X_gold = np.loadtxt('netflix_complete.txt')
log_likelihoods = {k:-np.Inf for k in [1, 12]}
for K in [12]: #1,
	for seed in range(5):
		mixture, post = common.init(X, K, seed)
		mixture, post, log_likelihood = em.run(X, mixture, post)
		X_pred = em.fill_matrix(X, mixture)
		log_likelihoods[K] = max(log_likelihoods[K], log_likelihood)
		print(K, seed, log_likelihood, common.rmse(X_gold, X_pred))
for K in log_likelihoods:
	print(K, log_likelihoods[K])
'''


'''
X = np.array([[0.85794562,0.84725174],
[0.6235637,0.38438171],
[0.29753461,0.05671298],
[0.,0.47766512],
[0.,0.],
[0.3927848,0.],
[0.,0.64817187],
[0.36824154,0.],
[0.,0.87008726],
[0.47360805,0.],
[0.,0.],
[0.,0.],
[0.53737323,0.75861562],
[0.10590761,0.],
[0.18633234,0.]])
K = 6
Mu = np.array([[0.6235637,0.38438171],[0.3927848,0.],[0.,0.],[0.,0.87008726],[0.36824154,0.],[0.10590761,0.]])
Var = np.array([0.16865269,0.14023295,0.1637321,0.3077471,0.13718238,0.14220473])
P = np.array([0.1680912,0.15835331,0.21384187,0.14223565,0.14295074,0.17452722])
mixture = common.GaussianMixture(Mu, Var, P)
#post, log_likelihood = em.estep(X, mixture)
#print(post)
#print(log_likelihood)
post = np.array([[0.15765074,0.20544344,0.17314824,0.15652173,0.12169798,0.18553787],
[0.1094766,0.22310587,0.24109142,0.0959303,0.19807563,0.13232018],
[0.22679645,0.36955206,0.02836173,0.03478709,0.00807236,0.33243031],
[0.16670188,0.18637975,0.20964608,0.17120102,0.09886116,0.16721011],
[0.04250305,0.22996176,0.05151538,0.33947585,0.18753121,0.14901275],
[0.09799086,0.28677458,0.16895715,0.21054678,0.0069597,0.22877093],
[0.16764519,0.16897033,0.25848053,0.18674186,0.09846462,0.11969746],
[0.28655211,0.02473762,0.27387452,0.27546459,0.08641467,0.05295649],
[0.11353057,0.13090863,0.20522811,0.15786368,0.35574052,0.03672849],
[0.10510461,0.08116927,0.3286373,0.12745369,0.23464272,0.12299241],
[0.09757735,0.06774952,0.40286261,0.08481828,0.1206645,0.22632773],
[0.24899344,0.02944918,0.25413459,0.02914503,0.29614373,0.14213403],
[0.35350682,0.21890411,0.26755234,0.01418274,0.10235276,0.04350123],
[0.15555757,0.06236572,0.16703133,0.21760554,0.03369562,0.36374421],
[0.1917808,0.08982788,0.17710673,0.03179658,0.19494387,0.31454414]])
mixture = em.mstep(X, post, mixture)
print(mixture.mu)
print(mixture.var)
print(mixture.p)
'''
