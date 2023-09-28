################################################################################
# CSE.0002x
# Problem Set 1: IVPlib_pset1
# Name:

"""
This Python library is useful in solving Initial Value Problems (IVP).

It implements an IVP base class which defines an IVP in the form:

    du/dt = f(u,t,p)   for u(tI) = uI,

in which the problem would be solved from t=tI to tF and p are a set of
parameters.

This is the version of the IVPlib which must be used for Pset 1.
"""

import copy


class IVP():

    def __init__(self, uI, tI, tF, p={}):
        """
        Args:
            uI (float list): initial condition of state
            tI (float): initial time
            tF (float): final time
            p (dictionary): set of fixed parameters
        """
        self._uI = uI[:]
        self._tI = tI
        self._tF = tF
        self._p = copy.deepcopy(p)

    ############ (other) dunder methods ############

    def __len__(self):
        """
        len is defined as number of states (in _uI)
        """
        return len(self._uI)

    ############ virtual methods for use outside of class ############

    def evalf(self, u, t):
        """
        Args:
            u (float list): current solution
            t (float): current time

        Returns:
            float list: f(u,t)
        """
        raise NotImplementedError("evalf is not implemented for this class")

    ############ getter methods ############

    def get_tI(self):
        """
        Returns:
            float: initial time
        """
        return self._tI

    def get_tF(self):
        """
        Returns:
            float: final time
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
            name (key): a key which should be in the object's parameter dictionary

        Returns:
            value of parameter key given by name
        """
        return self._p[name]


################################################################################
## Functions to numerically integrate an IVP
################################################################################


def step_FE(thisIVP, dt, un, tn):
    """
    Takes a single timestep of the Forward Euler method (FE) to
    (approximately) integrate the state from u(tn) to u(tn+dt)

    Args:
        thisIVP (IVP object): object describing IVP being solved
        dt (float): time increment
        un (float list): current state, i.e. u(tn)
        tn (float): current time

    Returns:
        float list: next state, i.e. u(tn+dt)
    """
    fn = thisIVP.evalf(un, tn)
    un1 = []
    for i in range(len(un)):
        un1.append(un[i] + dt*fn[i])
    return un1


def step_RK4(thisIVP, dt, un, tn):
    """
    Takes a single timestep of the 4th order Runge-Kutta method (RK4) to
    (approximately) integrate the state from u(tn) to u(tn+dt)

    Args:
        thisIVP (IVP object): object describing IVP being solved
        dt (float): time increment
        un (float list): current state, i.e. u(tn)
        tn (float): current time

    Returns:
        float list: next state, i.e. u(tn+dt)
    """
    #### BEGIN SOLUTION ####
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

    # compute RHS for the c vector
    tc = tn + 0.5*dt
    uc = []
    for i in range(len(un)):
        uc.append(un[i] + 0.5*b[i])
    fc = thisIVP.evalf(uc, tc)
    # compute the c vector
    c = []
    for i in range(len(un)):
        c.append(dt*fc[i])

    # compute RHS for the d vector
    td = tn + dt
    ud = []
    for i in range(len(un)):
        ud.append(un[i] + c[i])
    fd = thisIVP.evalf(ud, td)
    # compute the d vector
    d = []
    for i in range(len(un)):
        d.append(dt*fd[i])

    # compute the next step
    un1 = []
    for i in range(len(un)):
        un1.append(un[i] + (1/6)*(a[i] + 2*b[i] + 2*c[i] + d[i]))

    return un1
    #### END SOLUTION ####


def solve(thisIVP, dt, method):
    """
    Solves an IVP using a timestep dt and method. Integrate from t=tI until u(tn) is
    determined for which tn >= tF.

    Args:
        thisIVP (IVP object): object describing IVP being solved
        dt (float): time increment
        method (function): numerical integration method to use (i.e. method
            will be a reference to step_FE, step_RK4, etc.)

    Returns:
        t (float list): time values at which u(t) is approximated. The nth item in
            the list is the time of the nth step, tn = t[n].
        u (list of float lists): the values of the states at each step. The nth
            item in the list is the values of the states at tn, i.e. u(tn) = u[n]
            where u[n] is a float list. So, if there are three equations being integrated, then
            u[n][0], u[n][1], and u[n][2] are the values of the three states at time t = t[n]

    IMPORTANT: The first element in the returned t and u lists will be the initial values
    of t and u. Thus:
        * t[0] will be a float which is equal to thisIVP.get_tI()
        * u[0] will be a float list which is equal to thisIVP.get_uI()
    """
    # Set initial conditions and place them in arrays
    tI = thisIVP.get_tI()
    t = [tI]
    uI = thisIVP.get_uI()
    u = [uI]

    # Loop from t=tI to t>=tF
    #### BEGIN SOLUTION #####
    tF= thisIVP.get_tF()

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
    #### END SOLUTION ####
