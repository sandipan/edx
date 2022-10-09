import comp_prob_inference
import numpy as np
import math

p_X = {i: 1./6 for i in range(1, 7)}
num_samples = 10000
print(np.mean([comp_prob_inference.sample_from_finite_probability_space(p_X) for n in range(num_samples)]))

def expectation(x, p):
	return sum([p[i]*x[i] for i in range(len(x))])
	
def var(x, p):
	return expectation([(e - expectation(x, p))**2 for e in x],p)	
	
def std(x, p):
	return math.sqrt(var(x, p))
	
L1 = [-1, -1+1000]
p1 = [.999999,.000001]

L2 = [-1, -1+1000000]
p2 = [.999999,.000001]

L3 = [-1, -1+10]
p3 = [.9,.1]

print var(L1, p1), std(L1, p1)
print var(L2, p2), std(L2, p2)
print var(L3, p3), std(L3, p3)

p_X = [0.999, 0.001]
p_Y_X = [[0.01, 0.99], [0.99, 0.01]]

math.log(128/127.)

def H(p):
	return sum([-p[i]*(math.log(p[i],2) if p[i] > 0 else 0) for i in range(len(p))]) 

print("%.10f" % H(p1)) 
print("%.10f" % H(p2)) 
print H(p3)

import matplotlib.pyplot as plt
probs = map(lambda x: x*0.01, range(101))
entropies = [H([p,1-p]) for p in probs]
plt.plot(probs, entropies)
#plt.show()

import numpy as np
joint_prob_XY = np.array([[0.10, 0.09, 0.11], [0.08, 0.07, 0.07], [0.18, 0.13, 0.17]])

prob_X = joint_prob_XY.sum(axis=1)
prob_Y = joint_prob_XY.sum(axis=0)

joint_prob_XY_indep = np.outer(prob_X, prob_Y)

print joint_prob_XY_indep

Ixy = 0
for x in range(3):
	for y in range(3):
		Ixy += joint_prob_XY[x,y]*math.log(joint_prob_XY[x,y]/joint_prob_XY_indep[x,y],2) #(prob_X[x]*prob_Y[y]))
print Ixy

from math import factorial as fact
q = .7 #.5 #.2
d = 3 #2 #1
E_C_D = sum([s*fact(s)*q**d*(1-q)**(s-d)/(fact(d)*fact(s-d)) for s in range(d,5)]) / sum([fact(s)*q**d*(1-q)**(s-d)/(fact(d)*fact(s-d)) for s in range(d,5)])
print E_C_D

