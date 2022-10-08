# -*- coding: utf-8 -*-
"""
Created on Thu Mar 02 18:35:54 2017

@author: Sandipan.Dey
"""

import sys
import numpy as np
import matplotlib.animation as animation
import matplotlib.pyplot as plt
#from copy import deepcopy 

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
def PLA(input, output):
    
    data = np.genfromtxt(input, delimiter=',')
    out = open(output, "w")
    
    ws = []    
    x, y = data[:,:-1], data[:,-1] 
    n, d = x.shape
    w = np.zeros(d+1)
    x = np.concatenate((x, np.reshape(np.ones(n), (n,1))), axis=1)    
        
    while True:
        
        found = False
        for i in range(n):
            f = np.dot(w, x[i,:])
            if y[i]*f <= 0:
                w += y[i]*x[i,:]
                ws.append(w.tolist())
                out.write(','.join(map(str, w.tolist())) + '\n')
                found = True
                break
        if not found:    
            out.write(','.join(map(str, w.tolist())) + '\n')
            break
    
    #plt.scatter(x[:,0], x[:,1], s=25, c=y)
    #x = np.linspace(min(x[:,0])-10, max(x[:,0])+10, 100)
    #plt.plot(x, -w[0]/w[1]*x + -w[2]/w[1], 'r-')
    #plt.show()
    
    return (x,y,ws)
     
def plot_PLA(i,x,y,ws):
    #plt.scatter(x[:,0], x[:,1], s=50, linewidths=4, c=y, cmap=plt.cm.coolwarm)
    x1 = x[y>0]
    plt.scatter(x1[:,0], x1[:,1], s=50, linewidths=4, c='blue', marker='+')
    x1 = x[y<0]
    plt.scatter(x1[:,0], x1[:,1], s=50, linewidths=4, c='red', marker='x')
    plt.xlim(min(x[:,0])-1, max(x[:,0])+1)
    plt.ylim(min(x[:,1])-1, max(x[:,1])+1)
    plt.title('Perceptron Learning Algorithm') #, Iteration ' + str(deepcopy(i)))
    w = ws[i]
    X = np.linspace(min(x[:,0])-1, max(x[:,0])+1, 100)
    plt.plot(X, -w[0]/w[1]*X-w[2]/w[1], 'k-')    
    plt.savefig('problem1/fig' + str(i).zfill(3))
    plt.close()
    #return plt.plot(X, -w[0]/w[1]*X-w[2]/w[1], 'k-')    
    
if len(sys.argv) >= 3:

    input, output = sys.argv[1:3] 
    x,y,ws=PLA(input, output)
    fig = plt.figure()
    for i in range(1, len(ws)):
        plot_PLA(i,x,y,ws)
    #ims = []
    #for i in range(1, len(ws)):
    #    ims.append(plot_PLA(i,x,y,ws))
    #im_ani = animation.ArtistAnimation(fig, ims, interval=100, repeat=False, blit=True)  
    #im_ani.save('pyPLA.gif', writer='imagemagick', fps=30)
    #im_ani.save('pyPLA.mp4', writer='imagemagick', fps=30)
    #plt.show()                              
    
else:

    None