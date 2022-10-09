p = {(1,1):0.6, (1,2):0.1, (1,3):0.3, (2,1):0.2, (2,2):0.7, (2,3):0.1, (3,1):0.3, (3,2):0.3, (3,3):0.4}
r = {}
N = 3

for i in range(1, N+1):
	for j in range(1, N+1):
		r[i,j,0] = 1 if i == j else 0

for i in range(1, N+1):
	for j in range(1, N+1):
		r[i,j,1] = p[i,j]

for n in range(2,N+1):
	for i in range(1, N+1):
		for j in range(1, N+1):
			r[i,j,n] = sum([r[i, k, n-1]*p[k,j] for k in range(1,N+1)])
print r[1,1,0]
print r[1,1,1]
print r[1,1,2]
print r[1,1,3]

import numpy as np
#from sympy import Matrix

adj = np.matrix([[0.5, 0.5], [0.2, 0.8]]).transpose()
A = np.identity(2) - adj
A = np.vstack([A, [1, 1]])
print A
print np.linalg.lstsq(A,[0,0,1])[0]
#A = Matrix(A)
#print A.nullspace()

adj = np.matrix([[0.5, 0.5], [0.2, 0.8]]).transpose()
adj = (1.0 * adj) / adj.sum(axis=0) # make column stochastic
ranks = np.matrix([1.0/2]*2).transpose()
print ranks
niter = 1000
for i in range(niter):
	ranks = adj * ranks
print ranks


adj = np.matrix([[0.4, 0.6, 0, 0, 0, 0, 0], [0.2, 0, 0.8, 0, 0, 0, 0], [0, 0.4, 0.6, 0, 0, 0, 0], [0, 0, 0.4, 0, 0.3, 0.3, 0], [0, 0, 0, 0, 0, 1, 0], [0, 0, 0, 0.2, 0, 0, 0.8], [0, 0, 0, 0, 1, 0, 0]]).transpose()
n = adj.shape[0]
A = np.identity(n) - adj
A = np.vstack([A, [1]*n])
#print A
print np.linalg.lstsq(A,[0]*n+[1])[0]
#A = Matrix(A)
#print A.nullspace()

adj = (1.0 * adj) / adj.sum(axis=0) # make column stochastic
ranks = np.matrix([1.0/n]*n).transpose()
#print ranks
niter = 1000
for i in range(niter):
	ranks = adj * ranks
print ranks

adj = np.matrix([[8/15., 7/15.], [5/9., 4/9.]]).transpose()
A = np.identity(2) - adj
A = np.vstack([A, [1, 1]])
#print A
print np.linalg.lstsq(A,[0,0,1])[0]
#A = Matrix(A)
#print A.nullspace()

adj = np.matrix([[8/15., 7/15.], [5/9., 4/9.]]).transpose()
adj = (1.0 * adj) / adj.sum(axis=0) # make column stochastic
ranks = np.matrix([1.0/2]*2).transpose()
#print ranks
niter = 1000
for i in range(niter):
	ranks = adj * ranks
print ranks

print np.matrix([7/15., 4/9.]) * ranks

adj = np.matrix([[0.4, 0.6, 0], [0.3, 0.5, 0.2], [0, 0.2, 0.8]]).transpose()
A = np.identity(3) - adj
A = np.vstack([A, [1, 1, 1]])
#print A
print np.linalg.lstsq(A,[0,0,0,1])[0]
#A = Matrix(A)
#print A.nullspace()

adj = np.matrix([[0.4, 0.6, 0], [0.3, 0.5, 0.2], [0, 0.2, 0.8]]).transpose()
adj = (1.0 * adj) / adj.sum(axis=0) # make column stochastic
ranks = np.matrix([1.0/3]*3).transpose()
#print ranks
niter = 1000
for i in range(niter):
	ranks = adj * ranks
print ranks

pi1 = 1. / (1 + 0.6/0.3 + 0.6*0.2 / (0.3*0.2))
pi2 = pi1 * 0.6 / 0.3
pi3 = pi2 * 0.2 / 0.2
print pi1, pi2, pi3

adj = np.matrix([[3/4., 1/4.], [2/3., 1/3.]]).transpose()
A = np.identity(2) - adj
A = np.vstack([A, [1, 1]])
print A
print np.linalg.lstsq(A,[0,0,1])[0]
#A = Matrix(A)
#print A.nullspace()

import math
lambda1 = 30.
mu = 1 / 3.
for B in range(80, 110):
	Z = sum([(lambda1/mu)**i / math.factorial(i) for i in range(B + 1)])
	pi_B = ((lambda1/mu)**B / math.factorial(B)) / Z
	print B, pi_B
	
adj = np.matrix([[3/4., 1/4., 0, 0, 0, 0], [1/4., 1/2., 1/4., 0, 0, 0], [0, 1/4., 1/2., 1/4., 0, 0], [0, 0, 1/4., 1/2., 1/4., 0], [0, 0, 0, 1/4., 1/2., 1/4.], [0, 0, 0, 0, 1/4., 3/4.]]).transpose()
adj = (1.0 * adj) / adj.sum(axis=0) # make column stochastic
ranks = np.matrix([1.0/6]*6).transpose()
#print ranks
niter = 1000
for i in range(niter):
	ranks = adj * ranks
print ranks

adj = np.matrix([[0.6, 0.4, 0], [0.2, 0.5, 0.3], [0, 0.1, 0.9]]).transpose()
adj = (1.0 * adj) / adj.sum(axis=0) # make column stochastic
ranks = np.matrix([1.0/3]*3).transpose()
#print ranks
niter = 1000
for i in range(niter):
	ranks = adj * ranks
print ranks

adj = np.matrix([[1/2., 1/2., 0, 0, 0, 0, 0], [0, 0, 1, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0], [0, 1/2., 0, 0, 1/2., 0, 0], [0, 0, 0, 0, 0, 1, 0], [0, 0, 0, 0, 0, 1/2., 1/2.], [0, 0, 0, 0, 1, 0, 0]]).transpose()
adj = (1.0 * adj) / adj.sum(axis=0) # make column stochastic
ranks = np.matrix([1.0/7]*7).transpose()
niter = 1000
for i in range(niter):
	ranks = adj * ranks
print ranks
print adj * ranks

adj = np.matrix([[1/2., 1/2., 0, 0, 0, 0, 0], [0, 0, 1, 1, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 0, 1, 0], [0, 0, 0, 0, 0, 0, 1], [0, 0, 0, 0, 1, 0, 0]]).transpose()
adj = (1.0 * adj) / adj.sum(axis=0) # make column stochastic
ranks = np.matrix([1.0/7]*7).transpose()
niter = 1000
for i in range(niter):
	ranks = adj * ranks
print ranks
print adj * ranks

adj = np.matrix([[0, 1, 0, 0], [1/2., 0, 1/2., 0], [0, 0, 0, 1], [0, 1, 0, 0]]).transpose()
adj = (1.0 * adj) / adj.sum(axis=0) # make column stochastic
ranks = np.matrix([1.0/4]*4).transpose()
niter = 1000
for i in range(niter):
	ranks = adj * ranks
print ranks
print adj * ranks
