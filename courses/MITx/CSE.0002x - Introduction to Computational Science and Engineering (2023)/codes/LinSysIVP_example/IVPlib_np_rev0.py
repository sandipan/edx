################################################################################
# IntroToCSE
# IVPlib_np_rev0
#

"""
This Python library is useful in solving Initial Value Problems (IVP).

It implements an IVP base class which defines an IVP in the form:
    
    du/dt = f(u,t,p)   for u(tI) = uI

In which the problem would be solved from t=tI to tF and p are a set of 
parameters

Notes: This rev of IVPlib includes:
    * NumPy implementation (float lists are no longer used)
    * solve: generic IVP solver which calls a function that takes a single step
    * step_FE: takes a single step of Forward Euler method
    * virtual evalf (to be defined in a subclass)
    * getters
    * __len__
"""

import numpy as np
import copy 

class IVP():
    def __init__(self, uI, tI, tF, p={}):
        """
        Args:
            uI (NumPy ndarray): initial condition of state.
            tI (float): initial time.
            tF (float): final time.
            p (dictionary): set of fixed parameters.
        """
        
        self._uI = uI.copy()
        self._tI = tI
        self._tF = tF
        self._p  = copy.deepcopy(p)

############ (other) dunder methods ############

    def __len__(self):
        """
        len is defined as number of states (in _uI)
        """
        return len(self._uI)
        
############ virtual methods for use outside of class ############
 
    def evalf(self,u,t):
        """
        Args:
            u (NumPy ndarray): current solution.
            t (float): current time.

        Returns:
            NumPy ndarray: f(u,t).
        """
        raise NotImplementedError("evalf is not implemented for this class")

############ getter methods ############

    def get_tI(self):
        """
        Returns:
            float: initial time.
        """
        return self._tI

    def get_tF(self):
        """
        Returns:
            float: final time.
        """
        return self._tF

    def get_uI(self):
        """
        Returns:
            NumPy ndarray: initial state
        """
        return self._uI.copy()

    def get_p(self, name):
        """
        Arg:
            name (key): a key which should be in the object's parameter
            dictionary

        Returns:
            value of parameter key given by name
        """
        return self._p[name]

################################################################################
## Functions to numerically integrate an IVP
################################################################################

def step_FE(thisIVP,dt,un,tn):
    """
    Takes a single timestep of the Forward Euler method (FE) to
    (approximately) integrate the state from u(tn) to u(tn+dt)

    Args:
        thisIVP (IVP object): object describing IVP being solved.
        dt (float): time increment.
        un (NumPy ndarray): current state, i.e. u(tn).
        tn (float): current time.

    Returns:
        NumPy ndarray: next state, i.e. u(tn+dt).
    """

    fn = thisIVP.evalf(un,tn)

    un1 = un + dt*fn
    
    return un1

def step_RK2_ME(thisIVP,dt,un,tn):
    """
    Takes a single timestep of the Modified Euler version of a 2nd order
    Runge-Kutta method (RK2_ME) to (approximately) integrate the state from 
    u(tn) to u(tn+dt)

    Args:
        thisIVP (IVP object): object describing IVP being solved.
        dt (float): time increment.
        un (NumPy ndarray): current state, i.e. u(tn).
        tn (float): current time.

    Returns:
        NumPy ndarray: next state, i.e. u(tn+dt).
    """
    
    # compute the a vector
    a = dt*thisIVP.evalf(un, tn)

    # compute the b vector
    b = dt*thisIVP.evalf(un + 0.5*a, tn + 0.5*dt)

    # compute the next step
    un1 = un + b

    return un1


def solve(thisIVP, dt, method):
    """
    Solves an IVP using a timestep dt and method. Integrate from t=tI until u(tn) is
    determined for which tn >= tF.

    Args:
        thisIVP (IVP object): object describing IVP being solved.
        dt (float): time increment.
        method (function): numerical integration method to use.

    Returns:
        t (NumPy ndarray): time values at which u(t) is approximated. The nth item in
            the list is the time of the nth step, tn = t[n].
        u (NumPy ndarray): The values of the states at each step.  u(tn) = u[n]. 
            So, if there are three equations being integrated, then u[n,0], 
            u[n,1], and u[n,2] are the values of the three states at time t=t[n]

    IMPORTANT: The first element in the returned t and u lists will be the initial values
    of t and u.  Thus:
        * t[0] will be a float which is equal to thisIVP.get_tI()
        * u[0] will be an NumPy ndarray which is equal to thusIVP.get_uI()
    """

    # Sets initial conditions
    tI = thisIVP.get_tI()
    tF = thisIVP.get_tF()
    uI = thisIVP.get_uI()
    
    # Create t and u arrays
    t = np.arange(tI,tF+dt,dt)
    N = len(t)
    M = len(uI)    
    u = np.zeros((N, M))
    u[0] = uI
    
    # Loop from t=tI to t>=tF        
    for n in range(1,N):
        u[n,:] = method(thisIVP,dt,u[n-1,:],t[n-1])
                
    return t, u
