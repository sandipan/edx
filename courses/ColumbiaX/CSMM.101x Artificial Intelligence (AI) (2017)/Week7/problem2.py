# -*- coding: utf-8 -*-
"""
Created on Thu Mar 02 18:35:54 2017

@author: Sandipan.Dey
"""

import sys
import numpy as np
#import matplotlib.animation as animation
import matplotlib.pyplot as plt
from matplotlib import cm
from mpl_toolkits.mplot3d import *

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
def LR_GD(input, output):
    
    data = np.genfromtxt(input, delimiter=',')
      
    out = open(output, "w")
    
    x, y = data[:,:-1], data[:,-1] 
    n, d = x.shape
    x = (x-np.mean(x, axis=0)) / np.std(x, axis=0) #np.sqrt(np.var(x, axis=0))
    #print np.mean(x, axis=0), np.std(x, axis=0)
    x = np.concatenate((np.reshape(np.ones(n), (n,1)), x), axis=1)    
    niter = 100
    betas = []
    
    for alpha in [0.001, 0.005, 0.01, 0.05, 0.1, 0.5, 1., 5., 10.]:
        
        beta = np.zeros(d+1)

        for iter in range(niter):        
            
            f = np.matmul(x, beta)            
            beta -= (alpha/n) * np.matmul(np.transpose(x), f-y) # vectorized
            #for j in range(d+1):
            #    beta[j] -= (alpha/n) * sum([(f[i]-y[i])*x[i,j] for i in range(n)])
            
        out.write(','.join(map(str, [alpha, niter] + beta.tolist())) + '\n')
    
    alpha = 0.25    
    beta = np.zeros(d+1)
    niter = 300
    for iter in range(niter):        
        f = np.matmul(x, beta)            
        beta -= (alpha/n) * np.matmul(np.transpose(x), f-y)
        betas.append(beta.tolist())
    out.write(','.join(map(str, [alpha, niter] + beta.tolist())) + '\n')
    
    #print np.matmul(inv(np.matmul(np.transpose(x), x)), np.matmul(np.transpose(x), y))
    #print beta.tolist()
    #plt.scatter(x[:,0], x[:,1], s=25, c=y)
    #x = np.linspace(min(x[:,0])-10, max(x[:,0])+10, 100)
    #plt.plot(x, -w[0]/w[1]*x + -w[2]/w[1], 'r-')
    #plt.show()
    
    #return (x,y,np.matmul(inv(np.matmul(np.transpose(x), x)), np.matmul(np.transpose(x), y)))
    return (x,y,betas)
     
def plot_LR(x,y,betas):
    
    for i in range(len(betas)):              
        w = betas[i]
        fig = plt.figure()
        #fig.clf()
        ax = fig.gca(projection='3d') 
        plt.hold(True)
        x1_surf=np.arange(min(x[:,1]), max(x[:,1]), 0.1)  
        x2_surf=np.arange(min(x[:,2]), max(x[:,2]), 0.1)
        x1_surf, x2_surf = np.meshgrid(x1_surf, x2_surf)
        y_surf = w[0] + w[1]*x1_surf + w[2]*x2_surf 
        ax.plot_surface(x1_surf, x2_surf, y_surf, cmap=cm.rainbow, linewidth=0.5, edgecolors='k') # cm.hot
        ax.scatter(x[:,1], x[:,2], y, s = 50) #, s=100, c='blue')
        plt.title('Gradient Descent Iteration: ' + str(i) + ' hyperplane weights: ' + ','.join(map(lambda x: str(round(x, 3)), w)))
        plt.savefig('problem2/fig' + str(i).zfill(3))
        plt.close()
    #plt.show()
        
def save_ani_gif(dirname, output):
    #__author__ = 'Robert'
    from images2gif import writeGif
    from PIL import Image
    import os
    file_names = sorted((fn for fn in os.listdir(dirname) if fn.endswith('.png')))
    print file_names
    images = [Image.open(dirname + '/' + fn) for fn in file_names] #[:100]]
    writeGif(output, images, duration=1)
    # convert -delay 30 -loop 0 *.png problem2.gif
    
if len(sys.argv) >= 3:

    input, output = sys.argv[1:3] 
    x, y, betas = LR_GD(input, output)            
    #plot_LR(x,y,betas)
    save_ani_gif('problem2', 'problem2.gif')
    #fig = plt.figure()
    #ims = []
    #for i in range(1, len(betas)):
    #    ims.append(plot_LR(i,x,y,betas,fig))
    #im_ani = animation.ArtistAnimation(fig, ims, interval=50, repeat=False, blit=True)  
    #plt.show()        
    #im_ani.save('pyLR.mp4', fps=30)

else:

    None