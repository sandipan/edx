# -*- coding: utf-8 -*-
"""
Created on Wed Feb 08 17:02:45 2017

@author: Sandipan.Dey
"""

import numpy as np

def gendata():
    n = 1000
    d = 2 #3
    sigma2 = 3
    X = np.random.uniform(0, 100, (n, d)) # d+1
    #X[:,d] = 1.
    w = [2., 3.] #, 4.]
    y = np.matmul(X,w)
    y += np.random.randn(n) * np.sqrt(sigma2) # y = X.W + e
    n_test = 100
    X_test = np.random.rand(n_test, d) # d+1
    #X_test[:,d] = 1.
    np.savetxt("X_train.csv", X, delimiter=",")
    np.savetxt("y_train.csv", y)
    np.savetxt("X_test.csv", X_test, delimiter=",")
    
def gendata1():
    n = 1000
    d = 2
    sigma2 = 3
    X = np.random.rand(n, d+1)
    X[:,d] = 1.
    w = [2., 3., 4.]
    y = np.matmul(X,w)
    y += np.random.randn(n) * np.sqrt(sigma2)
    n_test = 100
    X_test = np.random.rand(n_test, d+1)
    X_test[:,d] = 1.
    np.savetxt("X_train.csv", X, delimiter=",")
    np.savetxt("y_train.csv", y)
    np.savetxt("X_test.csv", X_test, delimiter=",")
        
gendata1()