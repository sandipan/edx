hubs = ['A', 'B', 'C', 'D', 'E', 'F']
authorities = ['G', 'H', 'I', 'J']
graph = {'A':['G'], 'B':['G', 'H', 'I'], 'C': ['H', 'I', 'J'], 'D':['H'], 'E':['J'], 'F':['J']}
ranks = {}

# update authorities
for a in authorities: ranks[a] = 0
for h in hubs:
	for a in graph[h]:
		ranks[a] += ranks.get(h, 1)
print [(a, ranks[a]) for a in authorities]

# update hubs
for h in hubs: ranks[h] = 0
for h in hubs:
	for a in graph[h]:
		ranks[h] += ranks.get(a, 1)
print [(h, ranks[h]) for h in hubs]

# update authorities
for a in authorities: ranks[a] = 0
for h in hubs:
	for a in graph[h]:
		ranks[a] += ranks.get(h, 1)
print [(a, ranks[a]) for a in authorities]

# page rank

import numpy as np

graph = {'A':['B', 'C'], 'B':['D', 'E'], 'C': ['E', 'F'], 'D':['A'], 'E':['D'], 'F':['A']}
adj = np.matrix([[0, 1, 1, 0, 0, 0], [0, 0, 0, 1, 1, 0], [0, 0, 0, 0, 1, 1], [1, 0, 0, 0, 0, 0], [0, 0, 0, 1, 0, 0], [1, 0, 0, 0, 0, 0]]).transpose()
adj = (1.0 * adj) / adj.sum(axis=0) # make column stochastic
ranks = np.matrix([1.0/6]*6).transpose()
print ranks
ranks = adj * ranks
print ranks

adj = np.matrix([[0, 1, 1, 1, 0, 0, 0], [0, 0, 1, 0, 1, 0, 0], [0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 0, 1, 1], [1, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, 0, 0], [1, 0, 0, 0, 0, 0, 0]]).transpose()
adj = (1.0 * adj) / adj.sum(axis=0) # make column stochastic
print adj
ranks = np.matrix([1.0/7]*7).transpose()
print ranks
for i in range(1000):
	ranks = adj * ranks
	print ranks

