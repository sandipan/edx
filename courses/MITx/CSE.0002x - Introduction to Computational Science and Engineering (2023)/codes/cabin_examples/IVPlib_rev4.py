################################################################################
# IntroToCSE
# IVPlib_rev4
#

"""
This Python library is useful in solving Initial Value Problems (IVP).

It implements an IVP base class which defines an IVP in the form:
    
    du/dt = f(u,t,p)   for u(tI) = uI

In which the problem would be solved from t=tI to tF and p are a set of 
parameters

Notes: This rev of IVPlib includes:
    * solve: generic IVP solver which calls a function that takes a single step
    * step_FE: takes a single step of Forward Euler method
    * step_RK2_ME: takes a single step of the RK2 modified Euler method
    * virtual evalf (to be defined in a subclass)
    * getters
    * __len__
"""

import copy 

class IVP():
    def __init__(self, uI, tI, tF, p={}):
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

def step_FE(thisIVP,dt,un,tn):
    """
    Takes a single timestep of the Forward Euler method (FE) to
    (approximately) integrate the state from u(tn) to u(tn+dt)

    Args:
        thisIVP (IVP object): object describing IVP being solved.
        dt (float): time increment.
        un (float list): current state, i.e. u(tn).
        tn (float): current time.

    Returns:
        float list: next state, i.e. u(tn+dt).

    """

    fn = thisIVP.evalf(un,tn)
    un1 = []
    for i in range(len(un)):
        un1.append(un[i] + dt*fn[i])

    return un1


def step_RK2_ME(thisIVP,dt,un,tn):
    """
    Takes a single timestep of the 2nd order Runge-Kutta method knowns as
    the modified Euler method to (approximately) integrate the state from 
    u(tn) to u(tn+dt)

    Args:
        thisIVP (IVP object): object describing IVP being solved.
        dt (float): time increment.
        un (float list): current state, i.e. u(tn).
        tn (float): current time.


    Returns:
        float list: next state, i.e. u(tn+dt).

    """

    # compute RHS for the a vector
    ta = tn
    ua = un
    fa = thisIVP.evalf(ua, ta)
    # compute the a vector
    a = []
    for i in range(len(un)):
        a.append(dt*fa[i])

    # compute RHS for the b vector
    tb = tn + 0.5*dt
    ub = []
    for i in range(len(un)):
        ub.append(un[i] + 0.5*a[i])
    fb = thisIVP.evalf(ub, tb)
    # compute the b vector
    b = []
    for i in range(len(un)):
        b.append(dt*fb[i])

    # compute the next step
    un1 = []
    for i in range(len(un)):
        un1.append(un[i] + b[i])

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
        t (float list): time values at which u(t) is approximated. The nth item in
            the list is the time of the nth step, tn = t[n].
        u (list of float lists): The values of the states at each step.  The nth
            item in the list is the values of the states at tn.  i.e. u(tn) = u[n]
            where u[n] is a float list.  So, if there are three equations being integrated, then
            u[n][0], u[n][1], and u[n][2] are the values of the three states at time t=t[n]

    IMPORTANT: The first element in the returned t and u lists will be the initial values
    of t and u.  Thus:
        * t[0] will be a float which is equal to thisIVP.get_tI()
        * u[0] will be a float list which is equal to thusIVP.get_uI()
    """

    # Gets initial condition, tI and tF
    tI = thisIVP.get_tI()
    tF= thisIVP.get_tF()
    uI = thisIVP.get_uI()
    
    # Create t and u lists, and set initial element
    t = [tI]
    u = [uI]

    # Loop from t=tI to t>=tF
    tn = tI
    un = uI
    while (tn<tF):
        un1 = method(thisIVP,dt,un,tn)
        u.append(un1)
        un = un1
        tn += dt
        t.append(tn)

    return t, u




