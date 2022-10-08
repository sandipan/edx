# -*- coding: utf-8 -*-
"""
Created on Wed Feb 08 16:39:08 2017

@author: Sandipan.Dey
"""

import sys
import numpy as np
from numpy import matmul, dot #, transpose
from numpy.linalg import inv
from matplotlib.pylab import plt
#from random import randint

def plot_ratings(ax, mat, fontsize=12):
     ax.imshow(mat, interpolation="nearest",  cmap='seismic', aspect=.2)
     ax.set_xlabel('Objects', fontsize=fontsize)
     ax.set_ylabel('Users', fontsize=fontsize)
     ax.set_title('Ratings', fontsize=fontsize)

def plot_U(ax, mat, fontsize=12):
     ax.imshow(mat, interpolation="nearest",  cmap='hot', aspect=.02)
     ax.set_xlabel('Features', fontsize=fontsize)
     ax.set_xticklabels([], [])
     ax.set_yticklabels([], [])
     ax.set_title('U matrix', fontsize=fontsize)

def plot_V(ax, mat, fontsize=12):
     ax.imshow(mat, interpolation="nearest",  cmap='jet', aspect=5)
     ax.set_xlabel('Objects', fontsize=fontsize)
     ax.set_yticklabels([], [])
     ax.set_title('V matrix', fontsize=fontsize)

import matplotlib.gridspec as gridspec

def plot_matrices(r, u, o, i):    
    gs = gridspec.GridSpec(3, 5)
    ax1 = plt.subplot(gs[0:3,0:2])
    ax2 = plt.subplot(gs[0:3,2])
    ax3 = plt.subplot(gs[0,3:5])
    fig = plt.gcf()
    plot_ratings(ax1, r)
    plot_U(ax2, u)
    plot_V(ax3, o)
    #gs.tight_layout(fig)
    gs.tight_layout(fig, rect=[0, 0.03, 1, 0.95])  
    #plt.subplots_adjust(top=0.85)
    fig.suptitle("Pobabilistic Matrix Factorization: Iteration" + str(i), fontsize=14)
    #ax_lst = [ax1,ax2,ax3]
    plt.savefig('sol/mat' + str(i).zfill(2) + '.png')

def plot_embedding(u, v, iter):
    plt.rcParams['savefig.facecolor'] = 'palegoldenrod' #"0.8"
    for i in range(20): #len(u)):
        plt.text(u[i,0], u[i,1], 'U' + str(i))
    plt.scatter(u[0:20,0], u[0:20,1])  
    for i in range(20): #len(u)):
        plt.text(v[i,0], v[i,1], 'V' + str(i))
    plt.scatter(v[0:20,0], v[0:20,1])  
    plt.xlabel('Factor vector 1')
    plt.ylabel('Factor vector 2')
    plt.title('User-Object prxomity in the embedded space at PMF GA iteration ' +str(iter))
    plt.savefig('sol2/em' + str(iter).zfill(2) + '.png')
    plt.close()


# from sklearn.linear_model import Ridge

# python hw4_PMF.py ratings.csv

def gen_data(ratings_file, N_u, N_v, n):
    ratings = np.empty((0,3), int)
    for row in range(n):
        i, j, r = np.random.randint(0,N_u), np.random.randint(0,N_v), np.random.randint(1,6)
        ratings = np.append(ratings, np.array([[i,j,r]]), axis=0)
    np.savetxt(ratings_file, ratings, fmt='%d', delimiter=",")
    
def prob_matrix_factorization(ratings, d=5, sigma2=1./10, lambda1=2, niter=50):
    
    N_u, N_v, _ = map(int, ratings.max(axis=0) + 1)
    
    # initialize
    I_d = np.eye(d)
    r = np.array([[0]*N_v for _ in range(N_u)])
    for i in range(ratings.shape[0]):
        r[int(ratings[i,0]),int(ratings[i,1])] = ratings[i,2]
    u = np.random.multivariate_normal(np.zeros(d), (1./lambda1)*I_d, N_u)
    v = np.random.multivariate_normal(np.zeros(d), (1./lambda1)*I_d, N_v)
    
    Ls = []
    for iter in range(1,niter+1): 
      print 'iteration', iter
      # objective function
      L = 0
      for k in range(ratings.shape[0]):
          L -= (ratings[k, 2] - dot(u[int(ratings[k,0]),:], v[int(ratings[k,1]),:]))**2 / (2.*sigma2)
      L -= sum([lambda1*sum(u[i,:]**2)/2 for i in range(N_u)]) + sum([lambda1*sum(v[j,:]**2)/2 for j in range(N_v)])
      print L
      Ls.append(L)
      
      # coordinate descent  
      # update user location
      for i in range(N_u):
          Omg_u_i = map(int, ratings[ratings[:,0]==i][:,1].tolist())
          if len(Omg_u_i) == 0: continue
          u[i,:] = matmul(sum([ratings[(ratings[:,0]==i) & (ratings[:,1]==j)][0][2]*v[j,:] for j in Omg_u_i]), inv(lambda1*sigma2*I_d + sum([np.outer(v[j,:], v[j,:]) for j in Omg_u_i])))
      if iter in [10, 25, 50]:    
          np.savetxt('U-' + str(iter) + '.csv', u, fmt='%.3f', delimiter=",")
    
      # update object location
      for j in range(N_v):
          Omg_v_j = map(int, ratings[ratings[:,1]==j][:,0].tolist())
          if len(Omg_v_j) == 0: continue
          v[j,:] = matmul(sum([ratings[(ratings[:,0]==i) & (ratings[:,1]==j)][0][2]*u[i,:] for i in Omg_v_j]), inv(lambda1*sigma2*I_d + sum([np.outer(u[i,:], u[i,:]) for i in Omg_v_j])))
      if iter in [10, 25, 50]:    
          np.savetxt('V-' + str(iter) + '.csv', v, fmt='%.3f', delimiter=",")
          
      #plot_matrices(r, u, v.T, iter)  
      plot_embedding(u, v, iter)  
      
    file('objective.csv', 'w').write('\n'.join(map(str, Ls)))    

if len(sys.argv) >= 2:

    ratings_file = sys.argv[1] 
    #gen_data('ratings.csv', 1000, 100, 2000)
    ratings = np.genfromtxt(ratings_file,delimiter=',')
    prob_matrix_factorization(ratings)
    
else:

    None

'''    
import seaborn as sns
import pandas as pd


L = pd.read_csv('objective.csv', header=None, names=['Neg. Likelihood'])
L.plot()
plt.title('PMF Gradient Ascent: Increase in Obective function with Iterations')
plt.xlabel('#iterations')
plt.ylabel('negative likelihood')
plt.show()

u = pd.read_csv('U-50.csv', header=None)
#ax = sns.heatmap(u, yticklabels=False)

v = pd.read_csv('V-50.csv', header=None)
#ax = sns.heatmap(u, yticklabels=False)

#u['ID'] = ['U' + str(i) for i in range(len(u))]

# convert -delay 100 -loop 0 *.png sol.gif

plt.rcParams['savefig.facecolor'] = 'palegoldenrod' #"0.8"
for i in range(20): #len(u)):
    plt.text(u.loc[i,0], u.loc[i,1], 'U' + str(i))
plt.scatter(u.loc[0:20,0], u.loc[0:20,1])  
for i in range(20): #len(u)):
    plt.text(v.loc[i,0], v.loc[i,1], 'V' + str(i))
plt.scatter(v.loc[0:20,0], v.loc[0:20,1])  
plt.xlabel('Factor vector 1')
plt.ylabel('Factor vector 2')
plt.show()  
#u.plot.scatter(x=0, y=1)
'''

'''
fig = plt.figure()

ax1 = plt.subplot(121)
ax2 = plt.subplot(122)
ax3 = plt.subplot(223)

example_plot(ax1)
example_plot(ax2)
example_plot(ax3)

plt.tight_layout()

'''