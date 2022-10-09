# Homework
import numpy as np

# Q1
def MLE_Theta_i(data, i, a):
	return (1.0*sum(data[:,i] == a)) / data.shape[0]
	
def MLE_Theta_i_j(data, i, j, a, b):
	return (1.0*sum((data[:,i] == a) & (data[:,j] == b))) / sum(data[:,j] == b)
	
data = np.array([[1,1,1,0,0],[1,1,0,1,0],[1,1,1,1,1],[1,0,1,0,0],[1,1,1,0,0],[1,0,1,0,0],[0,0,0,0,0]])
table = {}
theta_0 = MLE_Theta_i(data, 0, 1) # 6/7.
table[0] = {1:theta_0, 0:1-theta_0}
'''
theta_1_0_1 = MLE_Theta_i_j(data, 1, 0, 1, 1) # 2/3.
theta_1_0_0 = MLE_Theta_i_j(data, 1, 0, 1, 0) 
table[(1,0)] = {(1,1):theta_1_0_1, (0,1):1-theta_1_0_1, (1,0):theta_1_0_0, (0,0):1-theta_1_0_0}
theta_2_0_1 = MLE_Theta_i_j(data, 2, 0, 1, 1)
theta_2_0_0 = MLE_Theta_i_j(data, 2, 0, 1, 0)
table[(2,0)] = {(1,1):theta_2_0_1, (0,1):1-theta_2_0_1, (1,0):theta_2_0_0, (0,0):1-theta_2_0_0}
theta_3_1_1 = MLE_Theta_i_j(data, 3, 1, 1, 1)
theta_3_1_0 = MLE_Theta_i_j(data, 3, 1, 1, 0)
table[(3,1)] = {(1,1):theta_3_1_1, (0,1):1-theta_3_1_1, (1,0):theta_3_1_0, (0,0):1-theta_3_1_0}
theta_4_1_1 = MLE_Theta_i_j(data, 4, 1, 1, 1)
theta_4_1_0 = MLE_Theta_i_j(data, 4, 1, 1, 0)
table[(4,1)] = {(1,1):theta_4_1_1, (0,1):1-theta_4_1_1, (1,0):theta_4_1_0, (0,0):1-theta_4_1_0}

theta_4_0_1 = MLE_Theta_i_j(data, 4, 0, 1, 1)
theta_4_0_0 = MLE_Theta_i_j(data, 4, 0, 1, 0)
table[(4,0)] = {(1,1):theta_4_0_1, (0,1):1-theta_4_0_1, (1,0):theta_4_0_0, (0,0):1-theta_4_0_0}
'''

parents = {1:0, 2:0, 3:1, 4:1}

for node in parents:
	theta_1 = MLE_Theta_i_j(data, node, parents[node], 1, 1)
	theta_0 = MLE_Theta_i_j(data, node, parents[node], 1, 0)
	table[(node,parents[node])] = {(1,1):theta_1, (0,1):1-theta_1, (1,0):theta_0, (0,0):1-theta_0}

for k in table:
	print k, table[k]

def compute_ll_contrib(data, table, i, j):
	ll = 0
	for k in range(data.shape[0]): # iterate on the data
		ll += np.log(table[i,j][data[k,i],data[k,j]])
	return ll
	
for k in table:
	print k, table[k]

node = 4
for par in range(node):
	# don't recompute
	#theta_1 = MLE_Theta_i_j(data, node, par, 1, 1)
	#theta_0 = MLE_Theta_i_j(data, node, par, 1, 0)
	#table[(node,par)] = {(1,1):theta_1, (0,1):1-theta_1, (1,0):theta_0, (0,0):1-theta_0}
	table[(node,par)] = table[(node, parents[node])]
	print par, compute_ll_contrib(data, table, node, par)

	
# chow_liu


# HW 
# 1
# leader
data = np.array([['n','n','n'],['n','n','y'],['n','y','y'],['y','y','y']])
# 'R' 0
# 'G' 1
# 'B' 2
table = {}
table[0] = {'y':0.5, 'n':0.5}
parents = {1:0, 2:0}
for node in parents:
	theta_y = MLE_Theta_i_j(data, node, parents[node], 'y', 'y')
	theta_n = MLE_Theta_i_j(data, node, parents[node], 'y', 'n')
	table[(node,parents[node])] = {('y','y'):theta_y, ('n','y'):1-theta_y, ('y','n'):theta_n, ('n','n'):1-theta_n}
for k in table:
	print k, table[k]

m_13 = 0.3	
alpha_ML = np.arctanh(m_13)
print alpha_ML
m_13 = 0.8	
alpha_ML = np.arctanh(m_13)
print alpha_ML

def g(m_13, n):
	#return np.arctanh(m_13)*(2*n)*(m_13) - n*np.log(8/(1-m_13**2)) # n*np.log(2 * (2 + np.exp(2*np.arctanh(m_13)) + np.exp(-2*np.arctanh(m_13))))#2 * n * np.log(2)
	return np.arctanh(m_13)*(2*n)*(m_13) - n*np.log(2 * (2 + np.exp(2*np.arctanh(m_13)) + np.exp(-2*np.arctanh(m_13))))#2 * n * np.log(2)
	
print g(0.2, 17)	
print g(0.9, 15)	