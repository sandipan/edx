# page rank

import numpy as np

graph = {'A':['B', 'C'], 'B':['C', 'D'], 'C': ['E'], 'D':['A'], 'E':['A']}
adj = np.matrix([[0, 1, 1, 0, 0], [0, 0, 1, 1, 0], [0, 0, 0, 0, 1], [1, 0, 0, 0, 0], [1, 0, 0, 0, 0]]).transpose()
adj = (1.0 * adj) / adj.sum(axis=0) # make column stochastic
ranks = np.matrix([1.0/5]*5).transpose()
print ranks
niter = 1000
for i in range(niter):
	ranks = adj * ranks
print ranks

graph = {'A':['B', 'C'], 'B':['C', 'D'], 'C': ['E'], 'D':['A'], 'E':['A', 'D']}
adj = np.matrix([[0, 1, 1, 0, 0], [0, 0, 1, 1, 0], [0, 0, 0, 0, 1], [1, 0, 0, 0, 0], [1, 0, 0, 1, 0]]).transpose()
adj = (1.0 * adj) / adj.sum(axis=0) # make column stochastic
ranks = np.matrix([1.0/5]*5).transpose()
print ranks
niter = 1000
for i in range(niter):
	ranks = adj * ranks
print ranks
