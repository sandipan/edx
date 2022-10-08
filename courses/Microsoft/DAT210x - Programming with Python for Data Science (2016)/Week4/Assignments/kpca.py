# -*- coding: utf-8 -*-
"""
Created on Wed Jul 20 18:28:11 2016

@author: Sandipan.Dey
"""

# cd 'C:/courses/Edx/Current/Microsoft DAT210x Programming with Python for Data Science/Week4/Assignments/'
import pandas as pd
import numpy as np
import pandas as pd
import matplotlib
import matplotlib.pyplot as plt
import matplotlib.colors as colors
from sklearn.decomposition import PCA, KernelPCA 
from sklearn.manifold import Isomap

# Look pretty...
matplotlib.style.use('ggplot')

def do_analysis(df, g, K):

    X = df.loc[:,0:1]
    col = df.loc[:,2]
    
    plt.figure(figsize=(8,6))
    plt.scatter(X.loc[:,0], X.loc[:,1], c=col, alpha=0.5)
    plt.title('Original data')
    plt.xlabel('x')
    plt.ylabel('y')
    plt.show()
    
    pca = PCA(n_components=2)
    pca.fit(X)
    PCA(copy=True, n_components=2, whiten=False)
    T = pca.transform(X)
    plot_PCs(X, T, col, 'PCA', None)

    scikit_kpca = KernelPCA(n_components=2, kernel='rbf', gamma=15)
    T = scikit_kpca.fit_transform(X)
    plot_PCs(X, T, col, 'Gaussian Kernel PCA, gamma=' + str(g), g)

    iso = Isomap(n_neighbors=K, n_components=2)
    iso.fit(X)
    Isomap(eigen_solver='auto', max_iter=None, n_components=2, n_neighbors=K,
        neighbors_algorithm='auto', path_method='auto', tol=0)
    T = iso.transform(X)
    plot_PCs(X, T, col, 'Isomap, K=' + str(K), K)

def plot_PCs(X, T, c, method, param):
    
    plt.figure(figsize=(8,6))
    plt.scatter(T[:,0], T[:,1], c=c, alpha=0.5)
    plt.title('First 2 principal components projections after ' + method + ' via scikit-learn')
    plt.xlabel('PC1')
    plt.ylabel('PC2')
    plt.figure(figsize=(8,6))
    plt.scatter(T[:,0], [0]*T.shape[0], c=c, alpha=0.5)
    plt.title('First principal component projection after ' + method + ' via scikit-learn')
    plt.xlabel('PC1')
    plt.ylabel('')
    plt.show()
    
path = 'C:/courses/Edx/Current/Microsoft DAT210x Programming with Python for Data Science/Week4/Assignments/'
df = pd.read_csv(path + 'flame.txt', header=None, sep='\t')
g = 1
K = 8 #3
cm = colors.Colormap('jet')
do_analysis(df, g, K, cm)

df = pd.read_csv(path + 'moons.csv')
g = 1
K = 8 #3
cm = colors.Colormap('jet')
do_analysis(df, g, K, cm)

df = pd.read_csv(path + 'moons.csv', header=None, sep='\t')
g = 1/5
do_analysis(df, g, K)