import copy 
import math
import matplotlib.pylab as plt

class IVP():
    def __init__(self, uI, tI, tF, p, f):
        """
        Args:
            uI (float list): initial condition of state.
            tI (float): initial time.
            tF (float): final time.
            p (dictionary): set of fixed parameters.
            f (function): takes as input u,t,p and returns du/dt
        """
        
        self._uI = uI[:]
        self._tI = tI
        self._tF = tF
        self._p  = copy.deepcopy(p)
        self._f  = f
        self._M  = len(uI)
        
    def evalf(self, u, t):
        """    
        Args:
            u (float list): current solution.
            t (float): current time.

        Returns:
            float list: f(u,t,p).
        """
        
        return self._f(u, t, self._p)
    
def eq_evalf(u, t, p):
    """        
        Args:
            u (float list): current u.
            t (float): current time
            p (dict): dictionary containing parameters
    
        Returns:
            f (float list): returns dTc/dt
    """

    #f = -math.sin(2*math.pi*u[0])*math.exp(-u[0])
    f = -1000*u[0]

    return [f]

def solve_euler(eq_IVP, dt):
    # Sets initial condition
    t0 = eq_IVP._tI
    tF = eq_IVP._tF
    u0 = eq_IVP._uI[0]

    t = [t0]
    u = [u0]
    
    # Loop from from t=t0 to t>=tF
    tn = t[0]
    un = u[0]

    while (tn<tF):
        # Calculate forcing
        fn = eq_IVP.evalf([un],tn)
        
        # Update solution and time
        un1 = un + dt*fn[0]
        tn1 = tn + dt
       
        # Append to v and t
        u.append(un1)
        t.append(tn1) # store time in minutes
        
        # Set vn and tn for next iteration
        un = un1
        tn = tn1
    
    return t, u

import numpy as np
from scipy import optimize 

def solve_backward_euler(eq_IVP, dt):
    # Sets initial condition
    tI = eq_IVP._tI
    tF = eq_IVP._tF
    uI = eq_IVP._uI

    def evalr(v):
        return (v - un)/dt - eq_IVP.evalf(v,tn+dt)   
  

    # Create t and u arrays
    t = np.arange(tI,tF+dt,dt)
    N = len(t)
    M = len(uI)    
    u = np.zeros((N, M))
    u[0] = uI
    
    # Loop from t=tI to t>=tF        
    for n in range(1,N):
        un, tn = u[n-1,:], t[n-1]
        u[n,:] = optimize.root(evalr, un).x        
    
    
    return t, u

dt = 0.0001 #0.001
tI, tF = 0, 0.1
uI = 1 #0.9 #0.6 #0.4
ivp = IVP([uI], tI, tF, {}, eq_evalf)

# Solve coffee IVP
t, u = solve_euler(ivp, dt)
tb, ub = solve_backward_euler(ivp, dt)
print(u, ub)

# Plot   
fig, (ax1, ax2) = plt.subplots(1,2)

ax1.plot(t,u,label='u')
ax1.set_xlabel('t (min)')
ax1.set_ylabel('u')
ax1.grid(True)

ax2.plot(tb,ub,label='ub')
ax2.set_xlabel('t (min)')
ax2.set_ylabel('ub')
ax2.grid(True)

plt.show()