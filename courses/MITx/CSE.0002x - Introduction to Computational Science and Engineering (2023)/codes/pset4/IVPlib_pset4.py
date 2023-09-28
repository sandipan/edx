################################################################################
# CSE.0002x
# Problem Set 4: IVPlib_pset4
# DO NOT MODIFY THIS FILE!

"""
This Python library is useful in solving Initial Value Problems (IVP).

It implements an IVP base class which defines an IVP in the form:

    du/dt = f(u,t,p)   for u(tI) = uI,

in which the problem would be solved from t=tI to tF and p are a set of
parameters.
"""

import copy
import numpy as np
from scipy import optimize


class IVP():
    def __init__(self, uI, tI, tF, p={}):
        """
        Args:
            uI (NumPy ndarray): initial condition of state
            tI (float): initial time
            tF (float): final time
            p (dictionary): set of fixed parameters
        """

        self.__uI = uI.copy()
        self.__tI = tI
        self.__tF = tF
        self.__p = copy.deepcopy(p)

    ############ (other) dunder methods ############

    def __len__(self):
        """
        len is defined as number of states (in _uI)
        """
        return len(self.__uI)

    ############ virtual methods for use outside of class ############

    def evalf(self, u, t):
        """
        Args:
            u (NumPy ndarray): current solution
            t (float): current time

        Returns:
            NumPy ndarray: f(u, t)
        """
        raise NotImplementedError("evalf is not implemented for this class")

    ############ getter methods ############

    def get_tI(self):
        """
        Returns:
            float: initial time
        """
        return self.__tI

    def get_tF(self):
        """
        Returns:
            float: final time
        """
        return self.__tF

    def get_uI(self):
        """
        Returns:
            NumPy ndarray: initial state
        """
        return self.__uI.copy()

    def get_p(self, name):
        """
        Arg:
            name (key): a key which should be in the object's parameter
                dictionary

        Returns:
            value of parameter key given by name
        """
        return self.__p[name]


################################################################################
## Functions to numerically integrate an IVP
################################################################################


def step_FE(thisIVP, dt, un, tn, method_dict=None):
    """
    Takes a single timestep of the Forward Euler method (FE) to
    (approximately) integrate the state from u(tn) to u(tn+dt).

    Args:
        thisIVP (IVP object): object describing IVP being solved
        dt (float): time increment
        un (NumPy ndarray): current state, i.e. u(tn)
        tn (float): current time
        method_dict (dict): dictionary controlling behavior of method

    Returns:
        NumPy ndarray: next state, i.e. u(tn+dt)
    """
    fn = thisIVP.evalf(un, tn)
    un1 = un + dt*fn
    return un1


def step_RK2_ME(thisIVP, dt, un, tn, method_dict=None):
    """
    Takes a single timestep of the Modified Euler version of a 2nd order
    Runge-Kutta method (RK2_ME) to (approximately) integrate the state from
    u(tn) to u(tn+dt).

    Args:
        thisIVP (IVP object): object describing IVP being solved
        dt (float): time increment
        un (NumPy ndarray): current state, i.e. u(tn)
        tn (float): current time
        method_dict (dict): dictionary controlling behavior of method

    Returns:
        NumPy ndarray: next state, i.e. u(tn+dt)
    """
    # compute the a vector
    a = dt*thisIVP.evalf(un, tn)

    # compute the b vector
    b = dt*thisIVP.evalf(un + 0.5*a, tn + 0.5*dt)

    # compute the next step
    un1 = un + b
    return un1


def step_BE(thisIVP, dt, un, tn, method_dict=None):
    """
    Takes a single timestep of the Backward Euler method (BE) to
    (approximately) integrate the state from u(tn) to u(tn+dt).

    If method_dict['use_evalf_u'] is defined and True, then the Jacobian
    of the residual vector is to be calculated using thisIVP.evalf_u(v,tn+dt)
    and a function reference must be passed to optimize.root, specifically

    optimize.root(evalr, un, jac=evalr_u)

    where evalr_u is a function you will write within step_BE that calculates
    the residual Jacobian (i.e. dr/dv) using thisIVP.evalf_u.  Note: evalr_u
    can only take a state vector as an input, i.e. evalr_u(v)

    Args:
        thisIVP (IVP object): object describing IVP being solved
        dt (float): time increment
        un (NumPy ndarray): current state, i.e. u(tn)
        tn (float): current time
        method_dict (dict): dictionary controlling behavior of method

    Returns:
        NumPy ndarray: next state, i.e. u(tn+dt)
    """
    def evalr(v):
        return (v - un)/dt - thisIVP.evalf(v, tn+dt)

    try:
        use_evalf_u = method_dict['use_evalf_u']
    except (KeyError, TypeError):
        use_evalf_u = False

    if use_evalf_u:
        def evalr_u(v):
            return np.eye(len(v))/dt - thisIVP.evalf_u(v,tn+dt)
        un1root = optimize.root(evalr, un, jac=evalr_u)
    else:
        un1root = optimize.root(evalr, un)

    return un1root.x


def solve(thisIVP, dt, method, method_dict=None):
    """
    Solves an IVP using a timestep dt and method. Integrate from t=tI until u(tn) is
    determined for which tn >= tF.

    Args:
        thisIVP (IVP object): object describing IVP being solved
        dt (float): time increment
        method (function): numerical integration method to use
        method_dict (dict): dictionary controlling behavior of method

    Returns:
        t (NumPy ndarray): time values at which u(t) is approximated. The nth item in
            the list is the time of the nth step, tn = t[n].
        u (NumPy ndarray): the values of the states at each step. u(tn) = u[n].
            So, if there are three equations being integrated, then u[n,0],
            u[n,1], and u[n,2] are the values of the three states at time t=t[n].

    IMPORTANT: The first element in the returned t and u lists will be the initial values
    of t and u. Thus:
        * t[0] will be a float which is equal to thisIVP.get_tI()
        * u[0] will be an NumPy ndarray which is equal to thusIVP.get_uI()
    """
    # Set initial conditions
    tI = thisIVP.get_tI()
    tF = thisIVP.get_tF()
    uI = thisIVP.get_uI()

    # Create t and u arrays
    t = np.arange(tI, tF+dt, dt)
    N = len(t)
    M = len(uI)
    u = np.zeros((N, M))
    u[0, :] = uI

    # Loop from t=tI to t>=tF
    for n in range(1, N):
        u[n, :] = method(thisIVP, dt, u[n-1, :], t[n-1], method_dict)

    return t, u
