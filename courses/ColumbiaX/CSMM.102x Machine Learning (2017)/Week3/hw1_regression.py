# -*- coding: utf-8 -*-
"""
Created on Wed Feb 08 16:39:08 2017

@author: Sandipan.Dey
"""

import sys
import numpy as np
from numpy import transpose, eye, matmul, dot
from numpy.linalg import inv

#from sklearn.linear_model import Ridge

# python hw1_regression.py lambda sigma2 X_train.csv y_train.csv X_test.csv

# compute w_RR
def part1(X_train_file, y_train_file, lambda1):
    
    Xtrain = np.genfromtxt(X_train_file,delimiter=',')
    ytrain = np.genfromtxt(y_train_file,delimiter=',')
    d = Xtrain.shape[1]
    I = eye(d)
    I[d-1,d-1] = 0
    wRR = matmul(inv(lambda1*I + matmul(transpose(Xtrain), Xtrain)), dot(transpose(Xtrain), ytrain))
    #wRR = matmul(inv(lambda1*eye(d-1) + matmul(transpose(Xtrain[:,:-1]), Xtrain[:,:-1])), dot(transpose(Xtrain[:,:-1]), ytrain))
    #wRR_bias = (1./(matmul(transpose(Xtrain[:,-1]), Xtrain[:,-1])))*(dot(transpose(Xtrain[:,-1]), ytrain))
    #wRR = wRR.tolist()
    #wRR.append(wRR_bias)
    #print map(lambda(x): round(x, 6), wRR)
    np.savetxt("wRR_" + str(lambda1) + ".csv", map(lambda(x): round(x, 6), wRR))
    #clf = Ridge(alpha=lambda1, fit_intercept  = False)
    #clf.fit(Xtrain, ytrain)
    #print(clf.coef_)
    #print(clf.intercept_)

# active learning
def part2(X_train_file, X_test_file, lambda1, sigma2):
    
    Xtrain = np.genfromtxt(X_train_file,delimiter=',')
    Xtest = np.genfromtxt(X_test_file,delimiter=',')
    d = Xtrain.shape[1]
    n = 10 
    I = eye(d)
    I[d-1,d-1] = 0
    indices = []
    Sigma = inv(lambda1*I + matmul(transpose(Xtrain), Xtrain)/sigma2)    
    #print Sigma 
    for iter in range(n):
        value, index = max([(sigma2 + matmul(dot(Xtest[i,:], Sigma), Xtest[i,:]), i) for i in range(Xtest.shape[0]) if not i+1 in indices])
        #print value, index + 1       
        Sigma = inv(inv(Sigma) + matmul(Xtest[index,:],transpose(Xtest[index,:])/sigma2))
        #Sigma = inv(lambda1*I + \
        #        (matmul(Xtest[index,:],transpose(Xtest[index,:])) + \
        #        sum([matmul(Xtrain[i,:],transpose(Xtrain[i,:])) for i in range(Xtrain.shape[0])]))/sigma2)
        #print Sigma
        #Xtest = np.delete(Xtest, (index), axis=0)
        indices.append(index+1)
    #print ','.join(map(str, indices)) 
    with open("active_" + str(lambda1) + '_' + str(sigma2) + ".csv","w") as f:
        f.write(','.join(map(str, indices)))

if len(sys.argv) >= 6:

    lambda1, sigma2 = int(sys.argv[1]), int(sys.argv[2])
    X_train_file, y_train_file, X_test_file = sys.argv[3:6] 

    part1(X_train_file, y_train_file, lambda1)
    part2(X_train_file, X_test_file, lambda1, sigma2)
    
else:

    None
    
