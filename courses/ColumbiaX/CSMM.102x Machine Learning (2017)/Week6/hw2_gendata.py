# -*- coding: utf-8 -*-
"""
Created on Wed Feb 08 17:02:45 2017

@author: Sandipan.Dey
"""

import numpy as np

def gendata():
    n = 1200
    d = 2
    K = 5 #10 #6 #10
    #X = np.random.uniform(0, 100, (n, d))
    X = np.random.multivariate_normal([0,0], [[1,0],[0,1]], int(n/K))
    X = np.vstack((X,np.random.multivariate_normal([5,2], [[2,1],[1,2]], int(n/K))))
    X = np.vstack((X,np.random.multivariate_normal([2,5], [[1,1],[1,2]], int(n/K))))
    X = np.vstack((X,np.random.multivariate_normal([0,2], [[2,-1],[-1,2]], int(n/K))))
    X = np.vstack((X,np.random.multivariate_normal([5,5], [[1,-1],[-1,2]], int(n/K))))
    #X = np.vstack((X,np.random.multivariate_normal([-5,-4], [[5,-3],[-3,2]], int(n/K))))
    #X = np.vstack((X,np.random.multivariate_normal([-5,-4], [[5,-3],[-3,2]], int(n/K))))
    #X = np.vstack((X,np.random.multivariate_normal([5,0], [[2,-3],[-3,2]], int(n/K))))
    #X = np.vstack((X,np.random.multivariate_normal([0,5], [[2,-2],[-2,2]], int(n/K))))
    #X = np.vstack((X,np.random.multivariate_normal([5,-4], [[5,-3],[-3,2]], int(n/K))))
    
    n_train = 700    
    y = np.zeros(int(n/K)) #np.random.choice(range(K), n)
    for i in range(1,K):
        y = np.hstack((y, i*np.ones(int(n/K))))
        
    randomize = np.arange(X.shape[0])
    np.random.shuffle(randomize)
    X = X[randomize,:]
    y = y[randomize]
    #n_test = 500
    X, y, X_test = X[:n_train,:], y[:n_train], X[n_train:,:]

    #X_test = np.random.rand(n_test, d) # d+1
    #X_test[:,d] = 1.
    np.savetxt("X_train1.csv", X, delimiter=",")
    np.savetxt("y_train1.csv", y.astype(int), fmt='%i')
    np.savetxt("X_test1.csv", X_test, delimiter=",")
    
gendata()