################################################################################
# IntroToCSE
# IVPlib_rev0
#

"""
This Python library is useful in solving Initial Value Problems (IVP).

It implements an IVP base class which defines an IVP in the form:
    
    du/dt = f(u,t,p)   for u(tI) = uI

In which the problem would be solved from t=tI to tF and p are a set of 
parameters
"""

import copy 

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
    