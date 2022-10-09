adj = np.matrix([[3/4., 1/4., 0], [3/8., 1/4., 3/8.], [0, 1/4., 3/4.]]).transpose()
adj = (1.0 * adj) / adj.sum(axis=0) # make column stochastic
ranks = np.matrix([1.0/3]*3).transpose()
niter = 1000
for i in range(niter):
	ranks = adj * ranks
print ranks
print adj * ranks

adj = np.matrix([[3/4., 1, 0], [3/8., 5/8., 1], [0, 1/4., 1]])
niter = 100000
count = 0
from random import random
for i in range(niter):
	state, tr = 0, 0
	while (1):
		r = random()
		next = state
		for s in range(3):
			if r < adj[state, s]:
				next = s
				break
		if next != state:
			tr += 1
		state = next
		if tr == 2:
			#print state
			if state == 2:
				count += 1
			break
print count, count / (niter * 1.0)	

niter = 100000
times = []
for i in range(niter):
	state, found0, found2, time = 1, False, False, 0
	while (1):
		r = random()
		next = state
		for s in range(3):
			if r < adj[state, s]:
				next = s
				break
		state = next
		time += 1
		if state == 0: found0 = True
		if state == 2: found2 = True
		if found0 and found2:
			times += [time]
			break
print sum(times) / (1.0*len(times))

niter = 100000
times = []
for i in range(niter):
	state, time = 0, 0
	while (1):
		r = random()
		next = state
		for s in range(3):
			if r < adj[state, s]:
				next = s
				break
		state = next
		time += 1
		if state == 2:
			times += [time]
			break
print sum(times) / (1.0*len(times))