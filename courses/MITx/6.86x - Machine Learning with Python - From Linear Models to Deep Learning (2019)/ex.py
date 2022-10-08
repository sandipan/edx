import numpy as np
import re

def perceptron(X, y):
	T = 3
	n = len(y)
	theta = np.zeros(X.shape[1])
	theta_0 = 0
	for t in range(T):
		for i in range(n):
			if y[i]*(theta@X[i]+theta_0) <= 0:
				theta = theta + y[i]*X[i]
				#theta_0 = theta_0 + y[i]
				print(theta) #, theta_0) #X[i], theta@X[i], theta_0, y[i])
		#for i in range(n):
		#	print(y[i]*(theta@X[i]+theta_0))

#perceptron(np.array([[-1,-1], [1,0], [-1,1.5]]), np.array([1,-1,1]))
#perceptron(np.array([[1,0], [-1,1.5], [-1,-1]]), np.array([-1,1,1]))
#perceptron(np.array([[-1,-1], [1,0], [-1,10]]), np.array([1,-1,1]))
#perceptron(np.array([[1,0], [-1,10], [-1,-1]]), np.array([-1,1,1]))
#perceptron(np.array([[-4,2], [-2,1], [-1,-1], [2,2], [1,-2]]), np.array([1,1,-1,-1,-1]))
#perceptron(np.array([[0,0,0], [0,0,1], [0,1,0], [0,1,1], [1,0,0],[1,0,1],[1,1,0],[1,1,1]]), np.array([1,-1,-1,-1,-1,-1,-1,-1]))
#perceptron(np.array([[-1,0], [0,1]]), np.array([1,-1]))
#perceptron(np.array([[-1,0,0], [0,1,0], [0,0,-1]]), np.array([1,1,1]))

#from sympy import solve, symbols, pprint
#a,b,c,x = symbols('a,b,c,x')
#f = a*x**2 + b*x + c
#solution = solve(f, x)
#pprint(solution)

def sym_comp():
	from sympy import solve, symbols, pprint, sqrt
	k,R,c,a,g = symbols('k,R,c,a,g')
	f = R*sqrt(k) + c - a - k*g
	solution = solve(f, k)
	print(solution)
	pprint(solution)

def hinge_loss_single(feature_vector, y, theta, theta_0):
    return max(0, 1- (y - (theta@feature_vector + theta_0)))

def hinge_loss_full(feature_matrix, labels, theta, theta_0):
    loss = [0]*feature_matrix.shape[0]
    for i in range(feature_matrix.shape[0]):
        loss[i] = hinge_loss_single(feature_matrix[i,:], labels[i], theta, theta_0)
    return np.mean(loss)

def square_loss_single(feature_vector, y, theta, theta_0):
    return(y - (theta@feature_vector + theta_0))**2/2

def square_loss_full(feature_matrix, labels, theta, theta_0):
    loss = [0]*feature_matrix.shape[0]
    for i in range(feature_matrix.shape[0]):
        loss[i] = square_loss_single(feature_matrix[i,:], labels[i], theta, theta_0)
    return np.mean(loss)

#print(square_loss_full(np.array([[1,0,1],[1,1,1],[1,1,-1],[-1,1,1]]), np.array([2,2.7,-0.7,2]), np.array([0,1,2]), 0))

def compute_feature_dimension():
	from scipy.special import comb
	print(150 + comb(151,2) + comb(152,3))

def temp_variance():
	p = np.random.random(10)
	p /= sum(p)
	print(np.var(p), p)
	for t in range(1, 20):
		p1 = np.exp(p/t)
		p1 /= sum(p1)
		print(t, np.var(p1), p1)
#temp_variance()

#import matplotlib.pylab as plt
#from matplotlib.ticker import MaxNLocator
#import seaborn as sns
#print(sns.__version__)
def plot_col_filter(Y, X, objl, ul, vl, iter):
	print(range(1, iter+1), objl)
	fig, axes = plt.subplots(2, 2, figsize=(20,20))
	axes = axes.ravel()
	#plt.subplots_adjust(0,0,1,1,0.05,0.05)
	sns.set(font_scale=2.25) 
	sns.heatmap(Y, annot=True, fmt="d", cbar=False, ax=axes[0]), axes[0].set_title('Incompelete User-Movie Ratings', size=25)
	sns.heatmap(np.round(X, 3), annot=True, fmt="f", ax=axes[1]), axes[1].set_title('CF (Mat. Fact.) output (iter={})'.format(iter), size=25)
	axes[2].plot(range(1, iter+1), objl, 'r.-'), axes[2].set_title('Objective function', size=25), axes[2].set_yscale('log'), axes[2].set_xlabel('Iterations', size=20), axes[2].set_ylabel('(log) Loss', size=20), axes[2].xaxis.set_major_locator(MaxNLocator(integer=True))
	axes[3].plot(range(1, iter+1), ul, label='Diff ||U||^2'), axes[3].plot(range(1, iter+1), vl, label='Diff ||V||^2'), axes[3].set_title('Diff. successive iterations', size=25), axes[3].legend(), axes[3].set_yscale('log'), axes[3].set_xlabel('Iterations', size=20), axes[3].set_xlabel('(log) Norm Diff.', size=20), axes[3].xaxis.set_major_locator(MaxNLocator(integer=True))
	fig.savefig('test_{:02d}.png'.format(iter))
	plt.close()
	
def col_filter(Y, D, U, V, L, niter=100):
	n, m =  Y.shape
	k = 1
	epsilon = 1e-10
	#n, k = U.shape
	#indices = np.where(D == 1)
	#diff = (Y - U@V.T)[indices]	
	#V = ((Y - U@V.T)*D).T@U / L 
	#U = (Y - U@V.T)*D@V / L 
	print(D)
	X = U[:,None]@V[:,None].T
	print(X)
	print(np.sum(((Y-X)*D)**2)/2)
	print(L*np.sum(U**2)/2 + L*np.sum(V**2)/2)
	objl, ul, vl = [], [], []
	for iter in range(niter):
		obj = np.sum(((Y-X)*D)**2)/2 + L*np.sum(U**2)/2 + L*np.sum(V**2)/2
		objl.append(obj)
		U1, V1 = U.copy(), V.copy()
		for u in range(n):
			num, den = 0, 0
			for i in range(m):
				if D[u,i] != 0:
					num += Y[u,i]*V[i]
					den += V[i]**2
			U[u] = num / (L + den)
			#print(u, num, L + den)
		#print(U)
		for i in range(m):
			num, den = 0, 0
			for u in range(n):
				if D[u,i] != 0:
					num += Y[u,i]*U[u]
					den += U[u]**2
			V[i] = num / (L + den)
		#print(V)
		udiff, vdiff = np.sum((U-U1)**2), np.sum((V-V1)**2)
		#print(udiff, vdiff)
		ul.append(udiff)
		vl.append(vdiff)
		X = U[:,None]@V[:,None].T
		plot_col_filter(Y, X, objl, ul, vl, iter+1)
		if  udiff < epsilon and vdiff < epsilon:
			print('converged!', iter)
			break
	obj = np.sum(((Y-X)*D)**2)/2 + L*np.sum(U**2)/2 + L*np.sum(V**2)/2
	objl.append(obj)
	ul.append(udiff)
	vl.append(vdiff)
	plot_col_filter(Y, X, objl, ul, vl, iter+1)
	#print(X)
	
#col_filter(np.array([[5,0,7],[1,2,0]]),np.array([[1,0,1],[1,1,0]]), np.array([1,2])[:,None],np.array([2,7,8])[:,None], 1)
#col_filter(np.array([[5,0,7],[1,2,0]]),np.array([[1,0,1],[1,1,0]]), np.array([1,2]).astype(float),np.array([2,7,8]).astype(float), 1)
#col_filter(np.array([[1,8,0],[2,0,5]]),np.array([[1,1,0],[1,0,1]]), np.array([1,2]).astype(float),np.array([4,2,1]).astype(float), 1, 1)
#col_filter(np.array([[5,0,7],[0,2,0],[4,0,0],[0,3,6]]),np.array([[1,0,1],[0,1,0],[1,0,0],[0,1,1]]), np.array([6,0,3,6]).astype(float),np.array([4,2,1]).astype(float), 1)
#col_filter(np.array([[5,0,4],[0,1,0],[4,0,0],[0,3,5]]),np.array([[1,0,1],[0,1,0],[1,0,0],[0,1,1]]), np.array([6,0,3,6]).astype(float),np.array([4,2,1]).astype(float), 1)

def U(z):
	return 0 if z <= 0 else 1

def f(w, w_0, x, a):
	return a(x@w + w_0)

'''
w = np.array([-1, -1])
w_0 = 2	
for x_1 in [0,1]:
	for x_2 in [0,1]:
		x = np.array([x_1, x_2])
		print(x, f(w, w_0, x, U))
'''

import matplotlib.pylab as plt
def Lin(z):
	return z
def Lin1(z):
	return 2*z-3
def Lin2(z):
	return 5*z-2
def RELU(z):
	return np.maximum(0,z)
def Tanh(z):
	return np.tanh(z)
def Softmax(z):
	return np.exp(z) / np.sum(np.exp(z))
def Sigmoid(z):
	return 1 / (1 + np.exp(-z))

def NN_HW():
	x1 = 3 
	x2 = 14
	x = np.array([x1, x2])
	fz1 = f(np.array([1,0]), -1, x, RELU)
	fz2 = f(np.array([0,1]), -1, x, RELU)
	fz3 = f(np.array([-1,0]), -1, x, RELU)
	fz4 = f(np.array([0,-1]), -1, x, RELU)
	x = [fz1, fz2, fz3, fz4]
	print(x)
	o1 = f(np.array([1,1,1,1]), 0, x, RELU)
	o2 = f(np.array([-1,-1,-1,-1]), 2, x, RELU)
	print(o1, o2)
	o1, o2 = Softmax(np.array([o1, o2]))
	print(o1, o2)
#NN_HW()
	
def lin_sep():
	x = np.array([[-1,-1], [1,-1], [-1,1], [1,1]])
	y = np.array([+1, -1, -1, +1])
	cols = {+1:'red', -1:'blue'}
	#w_1, w_01, w_2, w_02 = np.array([0,0]), 0, np.array([0,0]), 0 
	#w_1, w_01, w_2, w_02 = np.array([2,2]), 1, np.array([-2,-2]), 1 
	#w_1, w_01, w_2, w_02 = np.array([-2,-2]), 1, np.array([2,2]), 1 
	w_1, w_01, w_2, w_02 = np.array([1,-1]), 1, np.array([-1,1]), 1 
	f_1, f_2 = f(w_1, w_01, x, Lin2), f(w_2, w_02, x, Lin)
	#print(RELU(np.array([-1,0,1,-2])))
	#f_1, f_2 = f(w_1, w_01, x, RELU), f(w_2, w_02, x, RELU)
	#f_1, f_2 = f(w_1, w_01, x, Tanh), f(w_2, w_02, x, Tanh)
	#map(lambda z: 2*z-3, li)
	plt.scatter(f_1, f_2, color=[cols[y[i]] for i in range(len(y))])
	plt.show()

#lin_sep()

def sigmoid(z):
	return 1/(1+np.exp(-z))

def rec_net():	
	W_fh = W_fx = W_ih = W_ch = W_oh = W_ix = W_cx = W_ox = c_t_1 = h_t_1 = 1
	x_t = 5
	f_t = sigmoid(W_fh*h_t_1+W_fx*x_t)
	i_t = sigmoid(W_ih*h_t_1+W_ix*x_t)
	o_t = sigmoid(W_oh*h_t_1+W_ox*x_t)
	c_t = f_t*c_t_1 + i_t*np.tanh(W_ch*h_t_1+W_cx*x_t)
	h_t = o_t*np.tanh(c_t)
	print(h_t)
	
def Markov_prob(s, tr):
	return np.prod([tr[s[i],s[i-1]] for i in range(1, len(s))])

def read_tr_tbl():
	with open('trtbl.txt') as f:
		rows = f.readlines()
		rows = [list(map(float, row.split(','))) for row in rows]
	row_head = ['<beg>', 'ML', 'course', 'is', 'UNK']
	col_head = ['ML', 'course', 'is', 'UNK', '<end>']
	tr = {}
	for i in range(len(row_head)):
		word1 = row_head[i]
		for j in range(len(col_head)):
			word2 = col_head[j]
			tr[word2, word1] = rows[i][j] 
	return tr

'''
tr = read_tr_tbl()
#print(tr)
ss = ['<beg> ML course UNK <end>', '<beg> course ML is UNK <end>', '<beg> <end>', 'course is ML <end>', '<beg> ML course <end>']
for s in ss:
	s = s.split(' ')
	print(s)
	print(Markov_prob(s, tr))
'''

def conv1d1(f, g, zero_padding=True):
	m, n = len(f), len(g)
	start = -(n-1) if zero_padding else 0
	end = m-1
	h = [0]*(m+n-1 if zero_padding else m-1)
	#print(start, end, len(h))
	k = 0
	j = start
	while True:
		for i in range(len(h)):
			h[k] += (f[i] if i < m else 0)*(g[k-i] if k-i >= 0 and k-i < n else 0)
		#print(k, h[k])
		k += 1
		if (zero_padding and j >= end) or (not zero_padding and j >= end-1):
			break
		j += 1
	return h
	
def zero_pad(x, n):
	return [0]*n + x + [0]*n
	
def conv1d(f, g, zero_padding=True, np=None):
	n = len(g)
	if not np: np = n-1
	if zero_padding:
		f = zero_pad(f, np)
	m = len(f)
	h = [0]*(m-n+1)
	#print(len(h))
	for k in range(m-n+1):
		for i in range(k, k+n):
			h[k] += f[i]*g[i-k]
	return h

'''
print(conv1d([1,2,3], [2,1][::-1], True))	
print(conv1d([1,2,3], [2,1][::-1], False))
print(conv1d([1,3,-1,1,-3], [1,0,-1], True))	 # already rransposed kernel
print(conv1d([1,3,-1,1,-3], [1,0,-1], True, 1))	
print(conv1d([1,3,-1,1,-3], [1,0,-1], False)) 
'''

def LSTM(x_t, h_t_1, c_t_1):	
	W_fh = W_fx = 0
	b_f = -100
	W_ch = -100
	W_ih = 0
	W_ix = 100
	b_i = 100
	W_cx = 50
	W_oh = 0
	W_ox = 100 
	b_o = b_c = 0
	f_t = sigmoid(W_fh*h_t_1+W_fx*x_t+b_f)
	i_t = sigmoid(W_ih*h_t_1+W_ix*x_t+b_i)
	o_t = sigmoid(W_oh*h_t_1+W_ox*x_t+b_o)
	c_t = f_t*c_t_1 + i_t*np.tanh(W_ch*h_t_1+W_cx*x_t+b_c)
	h_t = o_t*np.tanh(c_t)
	return(h_t, c_t)

'''
h, c = 0, 0
for x in [0,0,1,1,1,0]: #[1,1,0,1,1]: 
	h, c = LSTM(x, h, c)
	print(h, round(h))
	h = round(h)
'''

def simple_net():
	t = 1
	x = 3
	w1 = 0.01
	w2 = -5
	b = -1
	z1 = w1*x
	a1 = RELU(z1)
	#print(z1, a1)
	z2 = w2*a1 + b
	y = Sigmoid(z2)
	C = (y-t)**2 / 2
	print(C)
	print((y-t)*Sigmoid(z2)*(1-Sigmoid(z2))*w2*1*x)
	print((y-t)*Sigmoid(z2)*(1-Sigmoid(z2))*a1)
	print((y-t)*Sigmoid(z2)*(1-Sigmoid(z2))*1)
	
#simple_net()

def cost_clust(Cs, zs):
	k = len(zs)
	C = 0
	for i in range(k):
		C1 = sum([(x[0] - zs[i][0])**2+(x[1] - zs[i][1])**2 for x in Cs[i]])
		print(C1)
		C += C1
	print(C)

#cost_clust([[(-1,2),(-2,1),(-1,0)],[(2,1),(3,2)]], [(-1,1),(2,2)])	

import matplotlib.pylab as plt
params = {'legend.fontsize': 'x-large',
          'figure.figsize': (15, 5),
         'axes.labelsize': 'x-large',
         'axes.titlesize':'x-large',
         'xtick.labelsize':'x-large',
         'ytick.labelsize':'x-large'}
plt.rcParams.update(params)

def plot_clusters(X, C, Z, title, fname):
	plt.figure(figsize=(10,10))
	plt.subplots_adjust(0.05,0.05,0.99,0.95,0.05,0.05)
	plt.scatter(X[:,0], X[:,1], s=50, c=C, edgecolor='k', cmap='jet', alpha=0.75)
	plt.scatter(Z[:,0], Z[:,1], s=300, c='k', edgecolor='k', marker='*', lw=2), plt.title(title, size=25)
	plt.margins(0,0)
	plt.savefig(fname, bbox_in='tight', pad_in=0)
	plt.close()
	
def plot_costs(costs, title, fname):
	plt.figure(figsize=(10,10))
	#plt.subplots_adjust(0.05,0.05,0.99,0.95,0.05,0.05)
	plt.plot(range(1, len(costs)+1), costs, 'r.-')
	plt.grid(), plt.xlabel('iteration', size=20), plt.ylabel('cost', size=20), plt.title(title, size=25)
	plt.xticks(range(1, len(costs)+1))
	plt.margins(0,0)
	plt.savefig(fname, bbox_in='tight', pad_in=0)
	plt.close()	
	
def L1(x, z):
	return np.sum(np.abs(x-z))

def L2(x, z):
	return np.sqrt(np.sum((x-z)**2))

def cosine(x, z):
	return np.dot(x,z)/np.sqrt(np.dot(x,x)*np.dot(z,z))

def cost(X, Z, C, dist):
	return np.sum([dist(X[i], X[Z[C[i]]]) for i in range(len(X))])
	
def assign(x, X, Z, dist):
	return np.argmin(np.array([dist(x, X[Z[i]]) for i in range(len(Z))]))
	
def compute(X, C, k, dist):
	Z = np.zeros(k).astype(np.int)
	for j in range(k):
		indices = np.where(C == j)[0]
		if len(indices) == 0: continue
		d, c = np.inf, -1
		for i in indices:
			d1 = np.sum([dist(X[i], X[l]) for l in indices])
			if d1 < d:
				d, c = d1, i
		Z[j] = c
		#if np.sum(np.abs(np.mean(X[indices], axis=0) - X[Z[j]])) > 2:
		#	print(j, np.mean(X[indices], axis=0), X[Z[j]], X[c], d, c, indices)
		#	print(X[np.where(C == j)])
	#print(X[Z])
	return Z 
	
# http://cs.joensuu.fi/sipu/datasets/s1.txt

def kmedoids(X, Z, dist):
	k, n = len(Z), len(X)
	C = np.zeros(n).astype(np.uint8)
	c = np.inf
	epsilon = 1e-3
	max_iter = 10 
	iter = 0
	costs = []
	fname = re.match("<function\s+(\w+)\s+at.*", str(dist)).group(1)
	plot_clusters(X, C, X[Z], 'kmedoids ({}) K={} (iter={})'.format(fname, k, iter), 'kmedoids_{}_{:02d}.png'.format(fname, iter))
	iter += 1
	#print(fname)
	while True:
		for i in range(n):
			C[i] = assign(X[i], X, Z, dist)
		Z = compute(X, C, k, dist)
		cc = cost(X, Z, C, dist)
		print(cc)
		costs.append(cc)
		plot_clusters(X, C, X[Z], 'kmedoids ({}) K={} (iter={})'.format(fname, k, iter), 'kmedoids_{}_{:02d}.png'.format(fname, iter))
		plot_costs(costs, 'kmedoids ({}) K={} (cost @ iter={})'.format(fname, k, iter), 'kmedoids_cost_{}_{:02d}.png'.format(fname, iter))
		if np.abs(cc - c) < epsilon or iter > max_iter:
			break
		c = cc
		iter += 1
	#print([X[C==i] for i in range(k)])
	#print([X[Z[i]] for i in range(k)])
	#print(c)

'''
X = np.loadtxt("s1.txt")
X /= 10**6
#X[X[:,0].argsort()] 
print(X.shape)
K = 15
Z = np.random.choice(X.shape[0], K)
kmedoids(X, Z, L2)
kmedoids(X, Z, L1)
'''

def cost1(X, Z, C, dist):
	return np.sum([dist(X[i], Z[C[i]]) for i in range(len(X))])
	
def assign1(x, Z, dist):
	return np.argmin(np.array([dist(x, Z[i]) for i in range(len(Z))]))

def compute1(X, C, k, dist):
	Z = np.zeros((k,X.shape[1]))
	for j in range(k):
		Z[j] = np.mean(X[C == j], axis=0)
		#print(X[C == j], Z[j])
	return Z 
	
def kmeans(X, Z, dist):
	fname = re.match("<function\s+(\w+)\s+at.*", str(dist)).group(1)
	k, n = len(Z), len(X)
	C = np.zeros(n).astype(np.uint8)
	c = np.inf
	epsilon = 1e-3
	max_iter = 10 
	iter = 0
	costs = []
	plot_clusters(X, C, Z, 'kmeans ({}) K={} (iter={})'.format(fname, k, iter), 'kmeans_{}_{:02d}.png'.format(fname, iter))
	iter += 1
	while True:
		for i in range(n):
			C[i] = assign1(X[i], Z, dist)
		Z = compute1(X, C, k, dist)
		cc = cost1(X, Z, C, dist)
		costs.append(cc)
		print(cc)
		plot_clusters(X, C, Z, 'kmeans ({}) K={} (iter={})'.format(fname, k, iter), 'kmeans_{}_{:02d}.png'.format(fname, iter))
		plot_costs(costs, 'kmeans ({}) K={} (cost @ iter={})'.format(fname, k, iter), 'kmeans_cost_{}_{:02d}.png'.format(fname, iter))
		if np.abs(cc - c) < epsilon or iter > max_iter:
			break
		c = cc
		iter += 1
	#print([X[C==i] for i in range(k)])
	#print([Z[i] for i in range(k)])
	#print(c)

'''
X = np.loadtxt("s1.txt")
X /= 10**6
print(X.shape)
K = 15
Z = X[np.random.choice(X.shape[0], K)]
#kmeans(X, Z, cosine)
kmeans(X, Z, L2)
kmeans(X, Z, L1)
'''

'''
for i in range(1,8):
	plt.figure(figsize=(40,20))
	plt.subplots_adjust(0,0,1,0.95,0.01,0.01)
	j = 1
	for fname in ['L1', 'L2']:
		plt.subplot(2,4,j), plt.imshow(plt.imread('kmeans_{}_{:02d}.png'.format(fname, i))), plt.axis('off')
		plt.subplot(2,4,j+1), plt.imshow(plt.imread('kmeans_cost_{}_{:02d}.png'.format(fname, i))), plt.axis('off')
		plt.subplot(2,4,j+2), plt.imshow(plt.imread('kmedoids_{}_{:02d}.png'.format(fname, i))), plt.axis('off')
		plt.subplot(2,4,j+3), plt.imshow(plt.imread('kmedoids_cost_{}_{:02d}.png'.format(fname, i))), plt.axis('off')
		j += 4
	plt.suptitle('kmeans clustering with L1 (manhattan) and L2 (Euclidean) distance', size=20)
	plt.savefig('kmeans_{:02d}.png'.format(i))
	plt.close()
'''

'''
X = np.array([[0,-6],[4,4],[0,0],[-5,2]])
Z = np.array([3, 0])
#X = np.concatenate((np.random.normal(loc = 0, scale =2, size=(100, 2)), np.random.normal(loc = 5, scale = 2, size=(100, 2)), np.random.normal(loc = 8, scale = 3, size=(100, 2))))
#Z = np.random.choice(X.shape[0], 3)
np.savetxt('X.txt', X)
kmedoids(X, Z, L2)
#Z = np.array([[-5,2], [0,-6]])
#kmeans(X, Z)
'''

from collections import Counter, defaultdict
def MLE(seq):
	dict = Counter(seq)
	return {alph: dict[alph] / sum(dict.values()) for alph in dict}

def prob(seq, probs):
	return np.prod([probs[alph] for alph in seq])
	
#seq = 'ABABBCABAABCAC'
#probs = MLE(seq)
#for alph in probs: #set(list(seq)):
#	print(alph, probs[alph])

#print(prob('ABC', probs))	
#print(prob('BBB', probs))	
#print(prob('ABB', probs))	
#print(prob('AAC', probs))	

import itertools
def MLE2(seq):
	probs = defaultdict(str)
	alphs = set(sorted(list(seq)))
	bigrams = list(map(''.join, itertools.product(alphs, repeat=2)))
	#print(bigrams)
	for alph in alphs:
		probs[alph] = 1/len(alphs)
	for bigram in bigrams:
		probs[bigram] = 0
	for i in range(len(seq)-1):
		probs[seq[i:i+2]] += 1
	for alph in alphs:
		bigrams = [alph + alph1 for alph1 in alphs]
		Z = sum([probs[bigram1] for bigram1 in bigrams])
		for bigram in bigrams:
			probs[bigram] /= Z
	return probs	

def prob2(seq, probs):
	return probs[seq[0]]*np.prod([probs[seq[i:i+2]] for i in range(len(seq)-1)])

'''
seq = 'ABABBCABAABCAC'	
probs = MLE2(seq)
print(probs)
print(prob2('AABCBAB', probs))
'''

def delta(j, i, C):
	return C[i] == j

def n_hat(j, C):
	return sum([delta(j, i, C) for i in range(len(C))])
	
def p_hat(j, C):
	return n_hat(j, C) / len(C)
	
def mu_hat(j, C, X):
	return sum([delta(j, i, C)*X[i] for i in range(len(C))]) / n_hat(j, C)

def sigma_hat(j, C, X, mu_hat):
	return sum([delta(j, i, C)*(X[i] - mu_hat[j])**2 for i in range(len(C))]) / n_hat(j, C)

'''	
K = 2
X = np.array([[-1.2,-0.8],[-1, -1.2],[-0.8,-0.8], [1.2,0.8],[1,1.2],[0.8,0.8]])
C = [0]*3 + [1]*3

for j in range(K):
	print(mu_hat(j, C, X))
'''

def PostProb(theta, X):
	p_hat, mu_hat, sigma2_hat = theta['p_hat'], theta['mu_hat'], theta['sigma2_hat']
	n, d = X.shape
	K = len(p_hat)
	P = np.zeros((n, K))
	for i in range(n):
		Z = 0
		for j in range(K):
			P[i,j] = p_hat[j] * np.exp(-np.sum((X[i]-mu_hat[j])**2)/(2*sigma2_hat[j])) / (2*np.pi*sigma2_hat[j])**(d/2)
			Z += P[i,j]
		P[i,:] /= Z
	return P
		
def n_hat(PP):
	n, K = PP.shape
	n_h = np.zeros(K)
	for j in range(K):
		n_h[j] = np.sum(PP[:,j])
	return n_h
	
def p_hat(PP):
	n, _ = PP.shape
	return n_hat(PP) / n
	
def mu_hat(PP, X, n_hat):
	n, K = PP.shape
	mu = np.zeros(K)
	for j in range(K):
		mu[j] = np.sum(np.array([PP[i,j]*X[i] for i in range(n)]), axis=0) / n_hat[j]
	return mu

def sigma2_hat(PP, X, mu_hat, n_hat):
	n, K = PP.shape
	n, d = X.shape
	sigma = np.zeros(K)
	for j in range(K):
		sigma[j] = np.sum(np.array([PP[i,j]*(X[i]-mu_hat[j])**2 for i in range(n)]), axis=0) / (n_hat[j]*d)
	return sigma

def LL(theta, X):
	p_hat, mu_hat, sigma2_hat = theta['p_hat'], theta['mu_hat'], theta['sigma2_hat']
	n, d = X.shape
	K = len(p_hat)
	LL = 0
	for i in range(n):
		p_X_theta = 0
		for j in range(K):
			p_X_theta += p_hat[j] * np.exp(-np.sum((X[i]-mu_hat[j])**2)/(2*sigma2_hat[j])) / (2*np.pi*sigma2_hat[j])**(d/2)
		LL += np.log(p_X_theta) 
	return LL

def EStep(theta, X):
	return PostProb(theta, X)
	
def MStep(PP, X):
	n = n_hat(PP)
	p = p_hat(PP)
	mu = mu_hat(PP, X, n)
	sigma2 = sigma2_hat(PP, X, mu, n)
	theta = {}
	theta['p_hat'], theta['mu_hat'], theta['sigma2_hat'] = p, mu, sigma2
	return theta

'''	
K = 2
X = np.array([[0.2], [-0.9], [-1], [1.2], [1.8]])
p = np.array([[0.5], [0.5]])
mu = np.array([[-3], [2]])
sigma2 = np.array([[4], [4]])

theta = {}
theta['p_hat'] = p
theta['mu_hat'] = mu
theta['sigma2_hat'] = sigma2
PP = PostProb(theta, X)
print(PP)
n = n_hat(PP)
print(p_hat(PP))
mu = mu_hat(PP, X, n)
print(mu)
print(sigma2_hat(PP, X, mu, n))
'''

'''
K = 2
X = np.array([[-1], [0], [4], [5], [6]])
p = np.array([[0.5], [0.5]])
mu = np.array([[6], [7]])
sigma2 = np.array([[1], [4]])

theta = {}
theta['p_hat'] = p
theta['mu_hat'] = mu
theta['sigma2_hat'] = sigma2
#print(LL(theta, X))

niter = 10
for iter in range(niter):
	PP = EStep(theta, X)
	#print(PP)
	theta = MStep(PP, X)
	print(theta['mu_hat'])
	print(theta['sigma2_hat'])
'''

def value_iteration(T, R, A, S, gamma):
	V = {s:0 for s in S}
	n = len(S)
	#print(list(V.values())[:-1])
	print(list(V.values()))
	epsilon = 0.0001
	iter, max_iter = 1, 100
	while True:
		Vnew = V.copy()
		for s in S:
			Vnew[s] = np.max([np.sum([T.get((s,a,s1),0)*(R.get((s,a,s1),0)+gamma*V[s1]) for s1 in S]) for a in A])
		diff = np.sum(np.abs(np.array(list(Vnew.values()))-np.array(list(V.values()))))
		#print(iter, list(Vnew.values())[:-1], diff)
		print(iter, list(Vnew.values()), diff)
		if diff < epsilon or iter >= max_iter:
			break
		V = Vnew
		iter += 1
		#for a in A:
		#	T['s_'+str(n-1), a, 's_'+str(n-1)] = 0
	return V

#def compute_optimal_policy(T, R, A, S, gamma, V):

def Q_value_iteration(T, R, A, S, gamma):
	Q = {(s, a):0 for s in S for a in A}
	n = len(S)
	for s in S:
		for a in A:
			print(Q[s,a])
	epsilon = 0.01
	iter, max_iter = 1, 5 #100
	while True:
		Qnew = Q.copy()
		for s in S:
			for a in A:
				Qnew[s, a] = np.sum([T.get((s,a,s1),0)*(R.get((s,a,s1),0)+gamma*np.max([Q[s1, a] for a in A])) for s1 in S])
		diff = np.sum(np.abs(np.array(list(Qnew.values()))-np.array(list(Q.values()))))
		print(iter, diff)
		for s in S:
			for a in A:
				print(s, a, Qnew[s,a])
		if diff < epsilon or iter >= max_iter:
			break
		Q = Qnew
		iter += 1
		#for a in A:
		#	T['s_'+str(n-1), a, 's_'+str(n-1)] = 0
	return Q
	
def Q_learning(S, A, R, T, gamma, alpha):
	Q = {(s, a):0 for s in S for a in A[s]}
	n = len(S)
	for s in S:
		for a in A[s]:
			print(Q[s,a])
	epsilon = 0.001
	iter, max_iter = 1, 100
	while True:
		Qnew = Q.copy()
		for s in S:
			if len(A[s]) > 0:
				for a in A[s]:
					s1 = T[s,a]
					#print(s, a, s1)
					vals = [Q[s1,a1] for a1 in A[s1]]
					max_val = 0 if len(vals) == 0 else np.max(vals)
					Qnew[s,a] = Q[s,a] + alpha*((R.get((s,a,s1), 0) - 0.04) + gamma*max_val - Q[s,a])
		diff = np.sum(np.abs(np.array(list(Qnew.values()))-np.array(list(Q.values()))))
		print(iter, diff)
		for s in S:
			for a in A[s]:
				print(s, a, Qnew[s,a])
		if diff < epsilon or iter >= max_iter:
			break
		Q = Qnew
		iter += 1
		#for a in A:
		#	T['s_'+str(n-1), a, 's_'+str(n-1)] = 0
	return Q
	
	
'''
n = 11
S = list(range(n)) #set()	
A = {0:['L','U'], 1:['L','U','R'], 2:['L','R'], 3:['U','R'], 4:['U','D'], 5:['R','D'], 6:['L','R'], 7:['L','R','D'], 8:['U','R','D'], 9:[], 10:[]}
R = {(7,'R',9):1, (8,'R',10):-1, (0,'U',10):-1}
T = {(0,'L'):1,(0,'U'):10,(1,'L'):2,(1,'U'):8,(1,'R'):0,(2,'L'):3,(2,'R'):2,(3,'U'):4,(3,'R'):2,(4,'U'):5,(4,'D'):3,(5,'R'):6,(5,'D'):4,(6,'L'):5,(6,'R'):7,(7,'L'):6,(7,'R'):9,(7,'D'):8,(8,'U'):7,(8,'D'):1, (8,'R'):10}

gamma = 1
alpha = 1
print(S, A, R)
V = Q_learning(S, A, R, T, gamma, alpha)
print(V)
'''

re_mv = -0.01
re_goal = +1
gamma = 0.5
reward = (4/16)*(re_goal + 2*(re_mv + gamma*re_goal) + (re_mv + gamma*re_mv + gamma**2*re_goal))
print(reward)	

'''
n = 5+1
S = ['s_'+str(i) for i in range(n)] #set()	
A = ['->']
T, R = {}, {}
for i in range(n-1):
	T['s_'+str(i), A[0], 's_'+str(i+1)] = 1
	R['s_'+str(i), A[0], 's_'+str(i+1)] = 0
R['s_'+str(i), A[0], 's_'+str(i+1)] = 1
gamma = 0.5
print(S, A, T, R)
value_iteration(T, R, A, S, gamma)
'''	

'''
n = 4
S = ['s_'+str(i) for i in range(n)] #set()	
A = ['UP', 'DOWN']
T, R = {}, {}
for i in range(n-1):
	T['s_'+str(i), A[0], 's_'+str(i+1)] = 1
	T['s_'+str(i+1), A[1], 's_'+str(i)] = 1
	R['s_'+str(i), A[0], 's_'+str(i+1)] = 1
	R['s_'+str(i+1), A[1], 's_'+str(i)] = 1
R['s_'+str(2), A[0], 's_'+str(3)] = 10
R['s_'+str(3), A[1], 's_'+str(2)] = 10

gamma = 0.75 #0.5
print(S, A, T, R)
V = value_iteration(T, R, A, S, gamma)
print(V)
'''

'''
n = 6
S = ['s_'+str(i) for i in range(n)] #set()	
A = ['M', 'C']
T, R = {}, {}
for i in range(1,4):
	T['s_'+str(i), A[0], 's_'+str(i-1)] = 1
	T['s_'+str(i), A[1], 's_'+str(i+2)] = 0.7
	T['s_'+str(i), A[1], 's_'+str(i)] = 0.3
i = 0 
T['s_'+str(i), A[0], 's_'+str(i)] = 1	
T['s_'+str(i), A[1], 's_'+str(i)] = 1	
for i in range(4,6):
	T['s_'+str(i), A[0], 's_'+str(i-1)] = 1
	T['s_'+str(i), A[1], 's_'+str(i)] = 1

for i in range(n):
	for j in range(n):
		for a in A:			
			R['s_'+str(i), a, 's_'+str(j)] = np.abs((i - j)**(1/3)) if i != j else (i+4)**(-1/2)

gamma = 0.6 #0.75 #0.5
print(S, A, T, R)
Q = Q_value_iteration(T, R, A, S, gamma)
print(Q)
'''

	
def retrieve_name(func):
	print(str(func))
	return re.match("<function\s+(\w+)\s+at.*", str(func)).group(1)
	
def foo(x):
	return x**2

#print(retrieve_name(foo))

#import numpy as np
#print(retrieve_name(np.round))


#https://www.desmos.com/calculator