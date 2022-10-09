cond_prob_table = {('P','H'):0.01,('P','I'):0.99,('N','H'):0.99,('N','I'):0.01}
p_H = 0.999
p_I = 1 - p_H
#p_HP 
print cond_prob_table[(('P','H'))]*p_H
#p_HN 
print cond_prob_table[(('N','H'))]*p_H
#p_IP 
print cond_prob_table[(('P','I'))]*p_I
#p_IN 
print cond_prob_table[(('N','I'))]*p_I

#p_H|P
print cond_prob_table[('P','H')]*p_H / (cond_prob_table[('P','H')]*p_H + cond_prob_table[('P','I')]*p_I)
#p_H|N
print cond_prob_table[('N','H')]*p_H / (cond_prob_table[('N','H')]*p_H + cond_prob_table[('N','I')]*p_I)

print (0.6)**4 * (0.4)**6
print 10*9*8*7 / (1*2*3*4) #nchoosek(10, 4)
print (0.6)**4 * (0.4)**6 * 10*9*8*7 / (1*2*3*4) 

print("%.10f" % ((2./7)**14))
print("%.10f" % ((2./5)**14))
print("%.10f" % ((2./3)**14))

print("%.10f" % (1-((26./27)**100)))
print("%.10f" % (1-((26./27)**99)))
#1 - (26/27)^(100-n)

import matplotlib.pyplot as plt
import numpy as np
n = np.array(range(1, 101))
plt.plot(n, 1 - (26./27)**(100-n))
#plt.show()

prob_W_I = np.array([[1./2, 0], [0, 1./6], [0, 1./3]])
prob_W = prob_W_I.sum(axis=1)
prob_I = prob_W_I.sum(axis=0)
print prob_W, prob_I
print(np.outer(prob_W, prob_I))

prob_X_Y = np.array([[1./4, 1./4], [1./12, 1./12], [1./6, 1./6]])
prob_X = prob_X_Y.sum(axis=1)
prob_Y = prob_X_Y.sum(axis=0)
print prob_X, prob_Y
print(np.outer(prob_X, prob_Y))

prob_X = np.array([1./2, 1./2])
prob_Y = np.array([1./2, 1./2])
print prob_X, prob_Y
print(np.outer(prob_X, prob_Y))
prob_Z = np.array([1./2, 1./2])

print 'Homework Problem: Ice Cream Sales in Inferenceville'

prob_S_C = np.array([[.4, .1], [.25, .25]])
prob_S = prob_S_C.sum(axis=1)
prob_C = prob_S_C.sum(axis=0)
print 'Unconditonal Joint: \n', prob_S_C
print 'Unconditonal Marginal: ', prob_S, prob_C
print 'Unconditonal Marginal Product: \n', np.outer(prob_S, prob_C)

prob_S_C_T0 = np.array([[.72, .08], [.18, .02]])
prob_S_T0 = prob_S_C.sum(axis=1)
prob_C_T0 = prob_S_C.sum(axis=0)
print 'Conditonal Joint (T=0): \n', prob_S_C_T0
print 'Conditonal Marginal (T=0): ', prob_S_T0, prob_C_T0
print 'Conditonal Marginal Product (T=0): \n', np.outer(prob_S_T0, prob_C_T0)

prob_S_C_T1 = np.array([[.08, .12], [.32, .48]])
prob_S_T1 = prob_S_C.sum(axis=1)
prob_C_T1 = prob_S_C.sum(axis=0)
print 'Conditonal Joint (T=1): \n', prob_S_C_T1
print 'Conditonal Marginal (T=1): ', prob_S_T1, prob_C_T1
print 'Conditonal Marginal Product (T=1): \n', np.outer(prob_S_T1, prob_C_T1)

