################################################################################
# Model predator-prey population dynamics
#
#    dr/dt =  a r - b r f
#    df/dt = -m f + c b r f 
#
# where: r  = population of prey (e.g. number of rabbits)
#        f  = population of predator (e.g. number of foxes)
#        a  = birth rate of prey per capita
#        m  = mortality rate of predator per capita
#        b  = predation rate per prey x predator
#        c  = frequency at which predation results prey
#

import numpy as np
from scipy import optimize
import matplotlib.pyplot as plt

def evalf(u, t):
        
    a = p['a']
    b = p['b']
    c = p['c']
    m = p['m']

    f = np.zeros(2)
    f[0] =  a*u[0] -   b*u[0]*u[1]
    f[1] = -m*u[1] + c*b*u[0]*u[1]
            
    return f


def evalf_u(u, t):  
      
    a = p['a']
    b = p['b']
    c = p['c']
    m = p['m']

    f_u = np.zeros((2,2))
    f_u[0][0] = a - b*u[1]
    f_u[0][1] = -b*u[0]
    f_u[1][0] = c*b*u[1]
    f_u[1][1] = -m + c*b*u[0]
            
    return f_u


def evalr(v):
    
    return (v - vn)/dt - evalf(v,tn+dt)


def evalr_u(v):
    
    return np.eye(2)/dt - evalf_u(v,tn+dt)
    
# Main for solving predator-prey model using Backward Euler
p = {}
p['a'] = 2.0
p['b'] = 0.01
p['c'] = 0.1
p['m'] = 1.0

rI = 500
fI = 100     
tF = 10.0 # final time to simulate to (month)
dt = 0.1 # time increment to give solutions at (s)
    
# Sets initial condition
t = np.arange(0,tF+dt,dt)
N = len(t)
v = np.zeros((N,2))
v[0,:] = [rI, fI]

# Loop from from t=0 to t>=tF
for n in range(N-1):
    tn = t[n]
    vn = v[n,:]
    
    vn1root = optimize.root(evalr, vn, jac=evalr_u)
    # vn1root = optimize.root(evalr, vn)

    v[n+1,:] = vn1root.x
        
# Plot   
fig, ax = plt.subplots()
ax.scatter(t,v[:,0],marker='o',label='rabbit')
ax.scatter(t,v[:,1],marker='x',label='fox')
ax.set_xlabel('t (months)')
ax.set_ylabel('population size')
ax.grid(True)
ax.legend()


