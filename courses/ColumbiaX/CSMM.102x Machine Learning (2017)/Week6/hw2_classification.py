# -*- coding: utf-8 -*-
"""
Created on Wed Feb 08 16:39:08 2017

@author: Sandipan.Dey
"""

import sys
import numpy as np
from numpy import transpose, matmul, exp
from numpy.linalg import inv, det

#from sklearn.linear_model import Ridge

# python hw1_regression.py lambda sigma2 X_train.csv y_train.csv X_test.csv

# compute w_RR
def train(X_train_file, y_train_file, K):
    
    Xtrain = np.genfromtxt(X_train_file,delimiter=',')
    ytrain = np.genfromtxt(y_train_file,delimiter=',')
    n = ytrain.shape[0]
    
    pi_y, mu_y, Sigma_y = {}, {}, {}
    for y in range(K): 
      # prior  
      pi_y[y] = (1.0*sum(ytrain == y)) / n
      # class-conditional distribution
      Xtrain_y = Xtrain[np.where(ytrain==y)]
      n_y = Xtrain_y.shape[0]
      mu_y[y] = np.mean(Xtrain_y, axis=0)
      Sigma_y[y] = matmul(transpose(Xtrain_y-mu_y[y]), Xtrain_y-mu_y[y]) / n_y # np.cov(transpose(Xtrain_y))
   
    return (pi_y, mu_y, Sigma_y)    
    
# active learning
def predict(X_test_file, params, K):
    
    pi_y, mu_y, Sigma_y = params
    Xtest = np.genfromtxt(X_test_file,delimiter=',')
    f = open("probs_test.csv","w")
    for i in range(Xtest.shape[0]):    
        probs = []
        for y in range(K):
            prob_y = pi_y[y]*(det(Sigma_y[y]))**(-0.5)*exp(-0.5*matmul(matmul(transpose(Xtest[i,:]-mu_y[y]), inv(Sigma_y[y])), Xtest[i,:]-mu_y[y]))
            probs.append(prob_y)
        probs = [prob / sum(probs) for prob in probs] # normalize    
        f.write(','.join(map(str, probs)) + '\n')

if len(sys.argv) >= 4:

    X_train_file, y_train_file, X_test_file = sys.argv[1:4] 
    K = 6 #10
    params = train(X_train_file, y_train_file, K)
    print params
    predict(X_test_file, params, K)

else:

    None
    
