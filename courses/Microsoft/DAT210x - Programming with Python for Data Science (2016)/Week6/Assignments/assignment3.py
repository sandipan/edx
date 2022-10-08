# -*- coding: utf-8 -*-
"""
Created on Fri Jul 22 17:02:26 2016

@author: Sandipan.Dey
"""

import pandas as pd
import numpy as np

# cd 'C:/courses/Edx/Current/Microsoft DAT210x Programming with Python for Data Science/Week6/Assignments/Datasets/'

for k in range(4, 15):
    
    X = pd.read_csv('parkinsons.data')
    X.head()
    X = X.drop(labels=['name'], axis=1)
    X.head()
    
    y = X['status'].copy()
    X.drop(labels=['status'], inplace=True, axis=1)
    X.head()
    
    from sklearn import preprocessing
    X = preprocessing.StandardScaler().fit_transform(X)
    #X = preprocessing.MinMaxScaler().fit_transform(X)
    #X = preprocessing.MaxAbsScaler().fit_transform(X)
    #X = preprocessing.Normalizer().fit_transform(X)
    #X = preprocessing.normalize(X)
    #X = preprocessing.scale(X)
    #X = X # No Change
    
    from sklearn import manifold
    iso = manifold.Isomap(n_neighbors=4, n_components=k)
    iso.fit(X)
    manifold.Isomap(eigen_solver='auto', max_iter=None, n_components=k, n_neighbors=k,
        neighbors_algorithm='auto', path_method='auto', tol=0)
    X = iso.transform(X)
    
    
    from sklearn.cross_validation import train_test_split
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=7)
    
    from sklearn.svm import SVC
    svc = SVC()
    svc.fit(X_train, y_train)
    svc.score(X_test, y_test)
    
    kernel = 'rbf'
    svc = SVC(kernel=kernel)
    Cs = np.linspace(0.05,2,40).tolist()
    gammas = np.linspace(0.001,0.1,100).tolist()
    
    best_score = 0 
    best_C, best_gamma = 0, 0
    for C in Cs:
        for gamma in gammas:
            svc = SVC(C=C, gamma=gamma, kernel=kernel)
            svc.fit(X_train, y_train)
            sc = svc.score(X_test, y_test)
            if sc > best_score:
                best_score, best_C, best_gamma = sc, C, gamma
                #print best_score
    print k, best_score, best_C, best_gamma

    from sklearn.grid_search import GridSearchCV
    params = {"C":Cs, "gamma": gammas}
    grid_search = GridSearchCV(svc, params)
    grid_search.fit(X_train, y_train)
    print grid_search.score(X_test, y_test), grid_search.best_params_
    
