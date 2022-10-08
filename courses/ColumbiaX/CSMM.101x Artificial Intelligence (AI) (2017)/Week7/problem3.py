# -*- coding: utf-8 -*-
"""
Created on Thu Mar 02 18:35:54 2017

@author: Sandipan.Dey
"""

import sys
import numpy as np
#import matplotlib.animation as animation
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap
from sklearn.model_selection import train_test_split, GridSearchCV, cross_val_score
from sklearn.metrics import accuracy_score
from sklearn import svm, linear_model, neighbors, tree, ensemble 

"""
Perceptron Algorithm
Input: A set of examples, (x1, y1), · · · , (xn, yn)
Output: A perceptron defined by (w0, w1, · · · , wd)
Begin
    2. Initialize the weights wj to 0 for all j in {0, · · · , d}
    3. Repeat until convergence
    4. For each example xi for all i in {1, · · · , n}
    5. if yif(xi) <= 0 #an error?
    6. update all wj with wj := wj +yixi #adjust the weights
End
"""
def sklearn_methods(input, output):
    
    data = np.genfromtxt(input, delimiter=',', skip_header=1)
         
    out = open(output, "w")
    
    X, y = data[:,:-1], data[:,-1] 
    n, d = X.shape
    
    plot_data(X, y)
    
    figure = plt.figure(figsize=(18, 18))

    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.4, stratify=y)
    k = 5 # # CV folds
   
    # svm_linear
    parameters = {'kernel':['linear'], 'C':[0.1, 0.5, 1, 5, 10, 50, 100]}
    svr = svm.SVC()
    clf = GridSearchCV(svr, parameters, cv=k)
    clf.fit(X_train, y_train)
    print clf.best_params_
    #print clf.best_score_
    #print cross_val_score(clf, X=X_train, y=y_train, cv=5)
    #print accuracy_score(y_test, clf.predict(X_test))
    out.write('svm_linear,' + str(clf.best_score_) + ',' + str(accuracy_score(y_test, clf.predict(X_test))) + '\n')
    plot_decision_boundary(X_train, y_train, clf, 1, 'svm_linear')
    
    # svm_polynomial
    parameters = {'kernel':['poly'], 'C':[0.1, 1, 3], 'degree': [4, 5, 6], 'gamma': [0.1, 1]}
    svr = svm.SVC()
    clf = GridSearchCV(svr, parameters, cv=k)
    clf.fit(X_train, y_train)
    print clf.best_params_
    out.write('svm_polynomial,' + str(clf.best_score_) + ',' + str(accuracy_score(y_test, clf.predict(X_test))) + '\n')
    plot_decision_boundary(X_train, y_train, clf, 2, 'svm_polynomial')
    
    # svm_rbf
    parameters = {'kernel':['rbf'], 'C':[0.1, 0.5, 1, 5, 10, 50, 100], 'gamma': [0.1, 0.5, 1, 3, 6, 10]}
    svr = svm.SVC()
    clf = GridSearchCV(svr, parameters, cv=k)
    clf.fit(X_train, y_train)
    print clf.best_params_
    out.write('svm_rbf,' + str(clf.best_score_) + ',' + str(accuracy_score(y_test, clf.predict(X_test))) + '\n')
    plot_decision_boundary(X_train, y_train, clf, 3, 'svm_rbf')
    
    scores = [x[1] for x in clf.grid_scores_]
    scores = np.array(scores).reshape(len([0.1, 0.5, 1, 5, 10, 50, 100]), len([0.1, 0.5, 1, 3, 6, 10]))    
    for ind, i in enumerate([0.1, 0.5, 1, 5, 10, 50, 100]):
        plt.plot([0.1, 0.5, 1, 3, 6, 10], scores[ind], label='C: ' + str(i))
    plt.legend()
    plt.xlabel('Gamma')
    plt.ylabel('Mean CV score')
    plt.show()            

    # logistic
    parameters = {'C':[0.1, 0.5, 1, 5, 10, 50, 100]}
    logistic = linear_model.LogisticRegression()
    clf = GridSearchCV(logistic, parameters, cv=k)
    clf.fit(X_train, y_train)
    print clf.best_params_
    out.write('logistic,' + str(clf.best_score_) + ',' + str(accuracy_score(y_test, clf.predict(X_test))) + '\n')
    plot_decision_boundary(X_train, y_train, clf, 4, 'logistic')

    # knn
    parameters = {'n_neighbors':list(range(1,51)), 'leaf_size':np.arange(5,61,5).tolist()}
    knn = neighbors.KNeighborsClassifier()
    clf = GridSearchCV(knn, parameters, cv=k)
    clf.fit(X_train, y_train)
    print clf.best_params_
    out.write('knn,' + str(clf.best_score_) + ',' + str(accuracy_score(y_test, clf.predict(X_test))) + '\n')
    plot_decision_boundary(X_train, y_train, clf, 5, 'knn')

    # decision_tree
    parameters = {'max_depth':list(range(1,51)), 'min_samples_split':list(range(2,11))}
    tr = tree.DecisionTreeClassifier()
    clf = GridSearchCV(tr, parameters, cv=k)
    clf.fit(X_train, y_train)
    print clf.best_params_
    out.write('decision_tree,' + str(clf.best_score_) + ',' + str(accuracy_score(y_test, clf.predict(X_test))) + '\n')
    plot_decision_boundary(X_train, y_train, clf, 6, 'decision_tree')

    scores = [x[1] for x in clf.grid_scores_]
    scores = np.array(scores).reshape(9, 50)    
    for ind, i in enumerate(list(range(2,11))):
        plt.plot(list(range(1,51)), scores[ind], label='min_samples_split: ' + str(i))
    plt.legend()
    plt.xlabel('max_depth')
    plt.ylabel('Mean CV score')
    plt.show()  
    
    # random_forest
    parameters = {'max_depth':list(range(1,51)), 'min_samples_split':list(range(2,11))}
    rf = ensemble.RandomForestClassifier()
    clf = GridSearchCV(rf, parameters, cv=k)
    clf.fit(X_train, y_train)
    print clf.best_params_
    out.write('random_forest,' + str(clf.best_score_) + ',' + str(accuracy_score(y_test, clf.predict(X_test))) + '\n')
    plot_decision_boundary(X_train, y_train, clf, 7, 'random_forest')

    plt.tight_layout()
    plt.show()

def plot_data(x,y):
    x1 = x[y>0]
    plt.scatter(x1[:,0], x1[:,1], s=50, linewidths=4, c='blue', marker='+')
    x1 = x[y==0]
    plt.scatter(x1[:,0], x1[:,1], s=50, linewidths=4, c='red', marker='x')
    plt.show()
    
def plot_decision_boundary(X, y, clf, i, title):
    
    ax = plt.subplot(3, 3, i)
    x_min = X[:, 0].min()
    x_max = X[:, 0].max()
    y_min = X[:, 1].min()
    y_max = X[:, 1].max()

    XX, YY = np.mgrid[x_min:x_max:200j, y_min:y_max:200j]
    if hasattr(clf, "decision_function"):
       Z = clf.decision_function(np.c_[XX.ravel(), YY.ravel()])
    else:
       Z = clf.predict(np.c_[XX.ravel(), YY.ravel()])
    cm = plt.cm.RdBu
    cm_bright = ListedColormap(['#FF0000', '#0000FF'])
    #Z = clf.predict(np.c_[XX.ravel(), YY.ravel()])
    # Put the result into a color plot
    Z = Z.reshape(XX.shape)
    ax.contourf(XX, YY, Z, cmap=cm, alpha=.8)
    ax.scatter(X[:, 0], X[:, 1], c=y, cmap=cm_bright)
    ax.set_xlim(x_min, x_max)
    ax.set_ylim(y_min, y_max)
    ax.set_xticks(())
    ax.set_yticks(())
    ax.set_title(title)
    #ax.text(x_max - .3, y_min + .3, ('%.2f' % score).lstrip('0'),
    #        size=15, horizontalalignment='right')
    #print Z
    #plt.pcolormesh(XX, YY, Z > 0.5, cmap=plt.cm.Paired)
    #plt.contour(XX, YY, Z, colors=['k', 'k', 'k'], linestyles=['--', '-', '--'],
    #            levels=[0, .5, 1])
    #plt.show()            
    
if len(sys.argv) >= 3:

    input, output = sys.argv[1:3] 
    sklearn_methods(input, output)                          
    #plot_LR(x,y,betas[len(betas)-1])
    #fig = plt.figure()
    #ims = []
    #for i in range(1, len(betas)):
    #    ims.append(plot_LR(i,x,y,betas,fig))
    #im_ani = animation.ArtistAnimation(fig, ims, interval=50, repeat=False, blit=True)  
    #plt.show()        
    #im_ani.save('pyLR.mp4', fps=30)

else:

    None