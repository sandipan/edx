################################################################################
# IntroToCSE
# IVPlib_rev3
#

"""
This Python library is useful in solving Initial Value Problems (IVP).

It implements an IVP base class which defines an IVP in the form:
    
    du/dt = f(u,t,p)   for u(tI) = uI

In which the problem would be solved from t=tI to tF and p are a set of 
parameters

Notes: This rev of IVPlib includes:
    * FEsolve: Forward Euler implementation to solve an IVP
    * virtual evalf (to be defined in a subclass)
    * getters
    * __len__
"""

import copy 

class IVP():
    def __init__(self, uI, tI, tF, p):
        """
        Args:
            uI (float list): initial condition of state.
            tI (float): initial time.
            tF (float): final time.
            p (dictionary): set of fixed parameters.
        """
        
        self._uI = uI[:]
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
            u (float list): current solution.
            t (float): current time.

        Returns:
            float list: f(u,t).
        """
        raise NotImplementedError("evalf is not implemented for this object")

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
            float list: initial state
        """
        return self._uI[:]

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

def FEsolve(thisIVP, dt):
    """
    Solves an IVP using the Forward Euler method with timestep dt. Integrate
    from t=tI until v(tn) is determined for which tn >= tF.

    Args:
        thisIVP (IVP object): object describing IVP being solved.
        dt (float): time increment.

    Returns:
        t (float list): time values at which u(t) is approximated. The nth item in
            the list is the time of the nth step, tn = t[n].
        v (list of float lists): The values of the states at each step.  The nth
            item in the list is the values of the states at tn.  i.e. v(tn) = v[n]
            where v[n] is a float list.  So, if there are three equations being integrated, then
            v[n][0], v[n][1], and v[n][2] are the values of the three states at time t=t[n]

    IMPORTANT: The first element in the returned t and v lists will be the initial values
    of t and v.  Thus:
        * t[0] will be a float which is equal to thisIVP.get_tI()
        * v[0] will be a float list which is equal to thisIVP.get_uI()
    """

    # Sets initial condition & places them in an array
    tI = thisIVP.get_tI()
    t = [tI]

    vI = thisIVP.get_uI()
    v = [vI]

    # Loop from t=tI to t>=tF
    tn = tI
    vn = vI
    tF= thisIVP.get_tF()
    while (tn<tF):
        fn = thisIVP.evalf(vn,tn)
        vn1 = []
        for i in range(len(vn)):
            vn1.append(vn[i] + dt*fn[i])
            
        v.append(vn1)
        vn = vn1
        
        tn += dt
        t.append(tn)

    return t, v

def RK2_MEsolve(thisIVP, dt):
    """
    Solves an IVP using the RK2 Modified Euler method with timestep dt. Integrate
    from t=tI until v(tn) is determined for which tn >= tF.

    Args:
        thisIVP (IVP object): object describing IVP being solved.
        dt (float): time increment.

    Returns:
        t (float list): time values at which u(t) is approximated. The nth item in
            the list is the time of the nth step, tn = t[n].
        v (list of float lists): The values of the states at each step.  The nth
            item in the list is the values of the states at tn.  i.e. v(tn) = v[n]
            where v[n] is a float list.  So, if there are three equations being integrated, then
            v[n][0], v[n][1], and v[n][2] are the values of the three states at time t=t[n]

    IMPORTANT: The first element in the returned t and v lists will be the initial values
    of t and v.  Thus:
        * t[0] will be a float which is equal to thisIVP.get_tI()
        * v[0] will be a float list which is equal to thisIVP.get_uI()
    """
    
    # Sets initial condition & places them in an array
    tI = thisIVP.get_tI()
    t = [tI]

    vI = thisIVP.get_uI()
    v = [vI]

    # Loop from t=tI to t>=tF
    tn = tI
    vn = vI
    tF= thisIVP.get_tF()
    while (tn<tF):
        va = vn
        ta = tn
        fa = thisIVP.evalf(va,ta)
        a = []
        for i in range(len(vn)):
            a.append(dt*fa[i])
            
        vb = []
        for i in range(len(vn)):
            vb.append(vn[i] + 0.5*a[i])
        tb = tn + 0.5*dt
        fb = thisIVP.evalf(vb,tb)
        b = []
        for i in range(len(vn)):
            b.append(dt*fb[i])
            
        vn1 = []
        for i in range(len(vn)):
            vn1.append(vn[i] + b[i])
            
        v.append(vn1)
        vn = vn1
        
        tn += dt
        t.append(tn)

    return t, v
