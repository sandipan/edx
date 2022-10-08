import numpy as np
import re

def Q_value_iteration(T, R, A, S, gamma):
	Q = {(s, a):0 for s in S for a in A}
	n = len(S)
	for s in S:
		for a in A:
			print(Q[s,a])
	epsilon = 0.0001
	iter, max_iter = 1, 100 #2 #100
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
for a in A:
	R['s_0', a, 's_0'] = 0
gamma = 0.6 #0.75 #0.5
print(S, A)
print([(k, T[k]) for k in sorted(T)]) 
print([(k, R[k]) for k in sorted(R)])
Q = Q_value_iteration(T, R, A, S, gamma)
#print(Q)
'''

'''
n = 4
S = list(range(n))
A = ['WALK', 'RUN']
T, R = {}, {}
for i in range(n-1):
	T[i, A[0], i+1] = 1
	T[i, A[1], i+1] = 0.5
	R[i, A[0], i+1] = 0
	R[i, A[1], i+1] = -1
T[2, A[1], 3] = 1
T[0, A[1], 2] = T[1, A[1], 3] = 0.5
R[0, A[1], 2] = -1 
R[2, A[0], 3] = 10
R[1, A[1], 3] = R[2, A[1], 3] = 9

gamma = 0.5 #1/3+0.00001 #0.75 #0.5
#print(S, A, T, R)
for a in A:
	for s in S:
		for s1 in S:
			if T.get((s, a, s1), None):
				print(s, a, s1, T[s, a, s1], R[s, a, s1])
Q = Q_value_iteration(T, R, A, S, gamma)
#print(Q)
'''

def RNN(x, Wss, Wsx, s):
	n = len(x)
	for i in range(n):
		s = np.maximum(0, Wss@s + Wsx@x[i])
	return s
	
s = np.ones(2) #np.ones(2) #np.zeros(2)
Wss = np.eye(2) #np.eye(2) #np.array([[-1,0],[0,1]])	
Wsx = -np.eye(2) #-np.eye(2) #np.array([[1,0],[0,1]])	
x = np.array([[1,0],[1,0]]) # AA
print(RNN(x, Wss, Wsx, s))
x = np.array([[1,0],[0,1],[0,1]]) # ABB
print(RNN(x, Wss, Wsx, s))
x = np.array([[0,1],[1,0],[1,0]]) # BAA
print(RNN(x, Wss, Wsx, s))


import matplotlib.pylab as plt

def sim_reg():
	m = 2
	p = np.array([0.5, 0.5])
	cp = np.cumsum(p)
	#p = np.random.multinomial(m, [1/m]*m, size=1)
	mu = np.array([2, -2])
	sigma = np.array([1, 1])
	w = [1, -1]
	N = 10000#00
	X = np.zeros(N)
	Y = np.zeros(N)
	Yhat = np.zeros(N)
	Yhat1 = np.zeros(N)
	classes = np.zeros(N)
	for i in range(N):
		rp = np.random.uniform()
		ind = 0
		for j in range(m):
			if rp > cp[j]:
				ind += 1
			else:
				break
		classes[i] = ind
		X[i] = np.random.normal(mu[ind], sigma[ind], 1)
		Y[i] = w[ind]*X[i] + np.random.normal(0, 1, 1)
		Yhat[i] = np.sum([(p[j]/sigma[j])*np.exp(-(X[i]-mu[j])**2/sigma[j]**2)*(w[j]*X[i]) for j in range(m)]) / np.sum([(p[j]/sigma[j])*np.exp(-(X[i]-mu[j])**2/sigma[j]**2) for j in range(m)])
		Yhat1[i] = np.sum([(p[j]/sigma[j])*np.exp(-(X[i]-mu[j])**2/sigma[j]**2)*(w[j]*X[i] + np.random.normal(0, 1, 1)) for j in range(m)]) / np.sum([(p[j]/sigma[j])*np.exp(-(X[i]-mu[j])**2/sigma[j]**2) for j in range(m)])
	for j in range(m):
		print(sum(classes == j))
	print(np.mean(Y-Yhat))
	print(np.mean(Y-Yhat1))
	print(np.mean(X), np.mean(Y), np.mean(X*Y))
	plt.scatter(X, Y, s=50, c=classes)
	plt.show()	
#sim_reg()


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
p = np.array([[0.01], [0.99]]) #np.array([[0], [1]]) 
mu = np.array([[1], [1]])
#mu = np.array([[2], [-2]])
sigma2 = np.array([[0.5], [0.5]])

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
print(LL(theta, X))
'''

'''
x = np.array([[0,2],[2,4],[4,2],[6,2],[6,0]])
theta, theta_0 = np.array([1,-1]), 0
theta1, theta_01 = np.array([3,-4]), 4

for i in range(len(x)):
	print(theta@x[i]+theta_0 >= theta1@x[i]+theta_01)
	
print(np.sum(theta**2), np.sum(theta1**2))
'''

'''
import numpy as np
import matplotlib.pyplot as plt
from sklearn import datasets, svm

iris = datasets.load_iris()
X = iris.data
y = iris.target

X = X[y != 0, :2]
y = y[y != 0]

n_sample = len(X)

np.random.seed(0)
order = np.random.permutation(n_sample)
X = X[order]
y = y[order].astype(np.float)

X_train = X[:int(.9 * n_sample)]
y_train = y[:int(.9 * n_sample)]
X_test = X[int(.9 * n_sample):]
y_test = y[int(.9 * n_sample):]

# fit the model
for kernel in ('linear', 'rbf', 'poly'):
    clf = svm.SVC(C=0.1,kernel=kernel, gamma=10)
    clf.fit(X_train, y_train)

    plt.figure()
    plt.clf()
    plt.scatter(X[:, 0], X[:, 1], c=y, zorder=10, cmap=plt.cm.Paired,
                edgecolor='k', s=20)

    # Circle out the test data
    plt.scatter(X_test[:, 0], X_test[:, 1], s=80, facecolors='none',
                zorder=10, edgecolor='k')

    plt.axis('tight')
    x_min = X[:, 0].min()
    x_max = X[:, 0].max()
    y_min = X[:, 1].min()
    y_max = X[:, 1].max()

    XX, YY = np.mgrid[x_min:x_max:200j, y_min:y_max:200j]
    Z = clf.decision_function(np.c_[XX.ravel(), YY.ravel()])

    # Put the result into a color plot
    Z = Z.reshape(XX.shape)
    plt.pcolormesh(XX, YY, Z > 0, cmap=plt.cm.Paired)
    plt.contour(XX, YY, Z, colors=['k', 'k', 'k'],
                linestyles=['--', '-', '--'], levels=[-.5, 0, .5])

    plt.title(kernel)
plt.show()
'''