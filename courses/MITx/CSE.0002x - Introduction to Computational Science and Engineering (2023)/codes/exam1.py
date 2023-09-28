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
import numpy as np
import matplotlib.pylab as plt

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

import numpy as np


def step_RK3(evalf, dt, vn, tn):
    """
    Takes a single timestep of the 3rd order Runge-Kutta method (RK3) to
    integrate the state from vn (at time tn) to vn1 (at time tn1 = tn + dt).

    Args:
        evalf (function reference): the referenced function has inputs of
            a state vector (v) and time (t) and returns the forcing f(v, t).
            v and f(v, t) are NumPy arrays of floats.
        dt (float): time increment
        vn (NumPy array of floats): current state
        tn (float): current time

    Returns:
        vn1 (NumPy array of floats): next state
    """
    #### BEGIN SOLUTION ####
    # compute RHS for the a vector
    ta = tn
    va = vn
    fa = evalf(va, ta)
    # compute the a vector
    a = []
    for i in range(len(vn)):
        a.append(dt*fa[i])

    # compute RHS for the b vector
    tb = tn + 0.5*dt
    vb = []
    for i in range(len(vn)):
        vb.append(vn[i] + 0.5*a[i])
    fb = evalf(vb, tb)
    # compute the b vector
    b = []
    for i in range(len(vn)):
        b.append(dt*fb[i])

    # compute RHS for the c vector
    tc = tn + 0.5*dt
    vc = []
    for i in range(len(vn)):
        vc.append(vn[i] + 0.5*b[i])
    fc = evalf(vc, tc)
    # compute the c vector
    c = []
    for i in range(len(vn)):
        c.append(dt*fc[i])

    # compute the next step
    vn1 = []
    for i in range(len(vn)):
        vn1.append(vn[i] + (a[i] + 4*b[i]+ c[i])/6)

    return vn1
    #### END SOLUTION ####

def step_RK3(evalf, dt, vn, tn):
    """
    Takes a single timestep of the 3rd order Runge-Kutta method (RK3) to
    integrate the state from vn (at time tn) to vn1 (at time tn1 = tn + dt).

    Args:
        evalf (function reference): the referenced function has inputs of
            a state vector (v) and time (t) and returns the forcing f(v, t).
            v and f(v, t) are NumPy arrays of floats.
        dt (float): time increment
        vn (NumPy array of floats): current state
        tn (float): current time

    Returns:
        vn1 (NumPy array of floats): next state
    """
    #### BEGIN SOLUTION ####
    # compute RHS for the a vector
    ta = tn
    va = vn
    fa = evalf(va, ta)
    # compute the a vector
    a = dt*fa

    # compute RHS for the b vector
    tb = tn + dt
    vb = vn + a
    fb = evalf(vb, tb)
   # compute the b vector
    b = dt*fb

    # compute RHS for the c vector
    tc = tn + 0.5*dt
    vc = vn + 0.25*a + 0.25*b
    fc = evalf(vc, tc)
    # compute the c vector
    c = dt*fc

    # compute the next step
    vn1 = vn + (a + b+ 4*c)/6

    return vn1
    #### END SOLUTION ####

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




################################################################################
# Model cooling of coffee in a cup with a simple lumped model
#
#    mc cc dTc/dt = h A (Tout - Tc)
#
# where: mc = mass of coffee in cup
#        cc = heat capacity of coffee
#        Tc = temperature of coffee
#      Tout = temperature of environment
#         h = heat transfer coefficient
#         A = surface area of coffee cup (including upper surface)
#
#  Note that dividing through by mc cc gives the equation implemented:
#
#         dTc/dt = h A / (mc cc) (Tout - Tc)
#
    
class testIVP(IVP):
    def evalf(self, u, t):
        """        
        Args:
            Tc (float list): current temperature of coffee.
            t (float): current time
    
        Returns:
            f (float list): returns dTc/dt
        """

        lambd = self.get_p('lambd')

        f = lambd * u[0]

        return [f]

if __name__ == "__main__":
    
    
    # Create an IVP object for coffee on a hot day
    p = {}
    p['lambd'] = -1 #0.1
            
    tI = 0
    tF = 10
    dt = 0.01

    u = 1

    ivp = testIVP([u], tI, tF, p)
    t, u = solve(ivp, dt, step_FE)
    
    # Put v in r, f
    f = []
    for i in range(len(t)):
        f.append(u[i])

    # Plot   
    fig, ax = plt.subplots()
    ax.plot(t,f)
    ax.set_xlabel('t')
    ax.set_ylabel('u')
    ax.grid(True)
    ax.legend()
    plt.show()

    u = np.array([0.76, 5.14, 6.98])
    dt = 0.1
    t = 3.14
    f = np.array([4.7, -5.8, 9.1])
    u = u + dt*f
    t = t + dt
    print(t, u)

import numpy as np


"""
The docstring for both calc_methodA and calc_methodB follows:

This function calculates the residual r and the Jacobian matrix r_v
for an implicit numerical method.

Args:
    vnp1 (NumPy array of floats): guess for state at time t^{n+1} = tn + dt
    vn (NumPy array of floats): state at time tn
    vnm1 (NumPy array of floats): state at time t^{n-1} = tn - dt

    dt (float): time increment
    tn (float): time at step n

    evalf (function reference): the referenced function has inputs of
        a state vector (v) and time (t) and returns the forcing f(v, t).
        v and f(v, t) are NumPy arrays of floats.

    evalf_v (function reference): the referenced function has inputs of
        a state vector (v) and time (t) and returns the matrix of
        derivatives, df/dv, where f is the forcing f(v, t).
        The matrix of derivatives returned by evalf_v are in a 2D NumPy
        array of floats such that the following line:

            f_v = evalf_v(v, t)

        will result in f_v being a 2D NumPy array where f_v[i,j] is the
        derivative of the i'th component of f with respect to the j'th
        state, i.e. d(f_i)/d(v_j).

Returns: tuple (r, r_v) where
    r (NumPy array of floats): residual vector
    r_v (2D NumPy array of floats): Jacobian matrix where r_v[i,j] is
        the derivative of the i'th component of r with respect to the j'th
        state, i.e. d(r_i)/d(v_j)
"""


def calc_methodA(vnp1, vn, vnm1, dt, tn, evalf, evalf_v):
    """
    Implementation for numerical method A.

    See docstring given at the top of this file.
    """
    #### BEGIN SOLUTION ####
    #raise NotImplementedError("Implement calc_methodA")
    r = (vnp1 - 4*vn/3 + vnm1/3)/dt - 2*evalf(vnp1, tn+dt)/3
    r_v = np.ones((len(vn), len(vn)))/dt - 2*evalf_v(vnp1, tn+dt)/3
    return (r, r_v)
    #### END SOLUTION ####


def calc_methodB(vnp1, vn, vnm1, dt, tn, evalf, evalf_v):
    """
    Implementation for numerical method B.

    See docstring given at the top of this file.
    """
    #### BEGIN SOLUTION ####
    #raise NotImplementedError("Implement calc_methodB")
    r = (vnp1 - vn)/dt - ((5/12)*evalf(vnp1, tn+dt) + (8/12)*evalf(vn, tn) - (1/12)*evalf(vnm1, tn-dt))
    r_v = np.ones((len(vn), len(vn)))/dt - (5/12)*evalf_v(vnp1, tn+dt)
    return (r, r_v)
    #### END SOLUTION ####
   

   ################################################################################
# CSE.0002x
# Exam 1: IVPlib
# DO NOT MODIFY THIS FILE

"""
This Python library is useful in solving Initial Value Problems (IVP).

It implements an IVP base class that defines an IVP in the form:

    du/dt = f(u, t, p)   for u(tI) = uI,

in which the problem would be solved from t=tI to tF, and p is a set of
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
        Calculates the right-hand side f(u, t, p) for the IVP

        Args:
            u (NumPy ndarray): current solution
            t (float): current time

        NOTE: Any needed parameter values (i.e. p) should be found by calling
        the get_p method defined below.

        Returns:
            f (NumPy ndarray): the evaluation of f(u, t, p)
        """
        raise NotImplementedError("evalf is not implemented for this class")


    def evalf_u(self, u, t):
        """
        Calculates the Jacobian df/du of the right-hand side f(u, t, p)

        Args:
            u (NumPy ndarray): current state
            t (float): current time

        NOTE: Any needed parameter values (i.e. p) should be found by calling
        the get_p method defined below.

        Returns:
            f_u (NumPy 2D ndarray): Jacobian of current right-hand side where
                f_u[i,j] = the derivative of f[i] with respect to u[j]
        """
        raise NotImplementedError("evalf_u is not implemented for this class")

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


def step_FE(thisIVP, dt, un, tn):
    """
    Takes a single timestep of the Forward Euler method (FE) to
    (approximately) integrate the state from u(tn) to u(tn+dt)

    Args:
        thisIVP (IVP object): object describing IVP being solved
        dt (float): time increment
        un (NumPy ndarray): current state, i.e. u(tn)
        tn (float): current time

    Returns:
        NumPy ndarray: next state, i.e. u(tn+dt)
    """
    fn = thisIVP.evalf(un, tn)
    un1 = un + dt*fn
    return un1


def step_RK2_ME(thisIVP, dt, un, tn):
    """
    Takes a single timestep of the Modified Euler version of a 2nd order
    Runge-Kutta method (RK2_ME) to (approximately) integrate the state from
    u(tn) to u(tn+dt)

    Args:
        thisIVP (IVP object): object describing IVP being solved
        dt (float): time increment
        un (NumPy ndarray): current state, i.e. u(tn)
        tn (float): current time

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


def step_BE(thisIVP, dt, un, tn):
    """
    Takes a single timestep of the Backward Euler method (BE) to
    (approximately) integrate the state from u(tn) to u(tn+dt)

    Args:
        thisIVP (IVP object): object describing IVP being solved
        dt (float): time increment
        un (NumPy ndarray): current state, i.e. u(tn)
        tn (float): current time

    Returns:
        NumPy ndarray: next state, i.e. u(tn+dt)
    """
    def evalr(v):
        return (v - un)/dt - thisIVP.evalf(v, tn+dt)

    def evalr_u(v):
        return np.eye(len(v))/dt - thisIVP.evalf_u(v, tn+dt)

    # Use Newton's method to determine un1
    un1root = optimize.root(evalr, un, jac=evalr_u)
    un1 = un1root.x
    return un1


def solve(thisIVP, dt, method):
    """
    Solves an IVP using a timestep dt and method. Integrate from t=tI until u(tn) is
    determined for which tn >= tF.

    Args:
        thisIVP (IVP object): object describing IVP being solved
        dt (float): time increment
        method (function): numerical integration method to use

    Returns:
        t (NumPy ndarray): time values at which u(t) is approximated. The nth item in
            the list is the time of the nth step, tn = t[n].
        u (NumPy ndarray): the values of the states at each step. u(tn) = u[n].
            So, if there are three equations being integrated, then u[n,0],
            u[n,1], and u[n,2] are the values of the three states at time t=t[n].

    IMPORTANT: The first element in the returned t and u lists will be the initial values
    of t and u. Thus:
        t[0] will be a float which is equal to thisIVP.get_tI()
        u[0] will be an NumPy ndarray which is equal to thusIVP.get_uI()
    """
    # Set initial conditions
    tI = thisIVP.get_tI()
    tF = thisIVP.get_tF()
    uI = thisIVP.get_uI()

    M = len(uI) # number of states
    t = np.arange(tI, tF+dt, dt)
    N = len(t) # number of time points
    u = np.zeros((N, M))
    u[0, :] = uI

    # Loop from t=tI to t>=tF
    for n in range(1, N):
        u[n, :] = method(thisIVP, dt, u[n-1, :], t[n-1])

    return t, u

################################################################################
# CSE.0002x
# Exam 1: osccomb2
# edX username:

import numpy as np

################################################################################
## Oscillating combustor fuel+oxidizer class definition (a subclass of IVP)
################################################################################


class OscComb2IVP(IVP):
    """
    The OscComb2IVP class is derived from the IVP base class. The
    states in this IVP are:
        u[0] = fuel concentration
        u[1] = oxidizer concentration

    The following keys must be used for the parameters in this IVP:
        'tau':      combustion timescale
        'A_fuel':   fuel oscillation amplitude
        'T_fuel':   fuel oscillation time period
        'C_ox':     oxidizer reaction rate coefficient
        'ox_base':  oxidizer base concentration
    The values for these parameters should be retrieved using the get_p
    method defined in the IVP base class.
    """

    #### BEGIN SOLUTION #####
    def evalf(self, u, t):
        """
        Calculates the right-hand side f(u, t, p) for the IVP

        Args:
            u (NumPy ndarray): current solution
            t (float): current time

        NOTE: Any needed parameter values (i.e. p) should be found by calling
        the get_p method defined below.

        Returns:
            f (NumPy ndarray): the evaluation of f(u, t, p)
        """
        #raise NotImplementedError("evalf is not implemented for this class")
        u0 = u[0]
        u1 = u[1]
        tau = self.get_p('tau')
        A_fuel = self.get_p('A_fuel')
        T_fuel = self.get_p('T_fuel')
        C_ox = self.get_p('C_ox')
        ox_base = self.get_p('ox_base')
        return np.array([-1/tau*u0*u1 + 0.5*A_fuel*(1-np.cos(2*np.pi*t/T_fuel)), -C_ox/tau*u0*u1 + ox_base - u1])
    #### END SOLUTION #####

    #### BEGIN SOLUTION #####
    def evalf_u(self, u, t):
        """
        Calculates the Jacobian df/du of the right-hand side f(u, t, p)

        Args:
            u (NumPy ndarray): current state
            t (float): current time

        NOTE: Any needed parameter values (i.e. p) should be found by calling
        the get_p method defined below.

        Returns:
            f_u (NumPy 2D ndarray): Jacobian of current right-hand side where
                f_u[i,j] = the derivative of f[i] with respect to u[j]
        """
        u0 = u[0]
        u1 = u[1]
        tau = self.get_p('tau')
        C_ox = self.get_p('C_ox')
        return np.array([[-1/tau*u1, -1/tau*u0], [-C_ox/tau*u1, -C_ox/tau*u0 -1]])        
    #### END SOLUTION #####

import time

def plot_Y(t, u, ptitle='Y vs t'):
    """
    Plot Y0, Y1, Y2 versus time using a 3 by 1 plot
    with shared x axes. The function must return the fig
    and axes for the plot.

    Further, the plot should:
        * Have grids on
        * Include the plot title given by ptitle
        * Include y-axis labels
        * Include an x-axis label on the bottom plot
        * Use the following y-axis limits:
            * For Y0 and Y2: ylim = [0., 1.]
            * For Y1: ylim = [0., 4.0E-5]

    Args:
        t (NumPy ndarray): time values at which solution was calculated
        u (NumPy ndarray): time history of states
            u[n,:] gives the value of the threes states at time t=t[n]
            u[:,i] gives the time history of state i (which is Yi)
        ptitle (string): plot title

    Returns:
        fig, axs of the subplots
    """
    #### BEGIN SOLUTION #####
    #raise NotImplementedError("Plot Y proportions for a given run of a RobertsonIVP")
    fig, axs = plt.subplots(2, 1)
    
    axs[0].plot(t,u[:,0])
    axs[0].set_title(ptitle)
    axs[0].set_ylabel('$Fuel$')
    axs[0].grid(True)
    #axs[0].set_ylim(0, 1e-5)

    axs[1].plot(t,u[:,1])
    axs[1].set_ylabel('$Oxid$')
    axs[1].grid(True)
    #axs[1].set_ylim(0, 1)

    plt.show()

    #### END SOLUTION #####
    
    return fig, axs

    #### END SOLUTION #####

def run_combustion(mname='FE', dt=1.0e-5):
    """
    Solves Robertson IVP using a specified step method with the given
    timestep size.

    Args:
        mname (string): either 'FE' or 'BE', indicating whether to use
            the Forward or Backward Euler method
        dt (float): timestep to use

    Returns:
        tot_time (float): the time in seconds it took to solve the RobertsonIVP
            using the specified method
    """
    # Rate constants for Robertson's IVP
    p = {}
    p['tau'] = 1e-4
    p['A_fuel'] = 0.1
    p['T_fuel'] = 1.0
    p['C_ox'] = 2.0
    p['ox_base'] = 1.0

    # Set initial condition
    uI = np.array([0.0, 1.0])

    # Time range to consider
    tI = 0.
    tF = 8.0 # sec

    # Instantiate RobertsonIVP object
    ivp = OscComb2IVP(uI, tI, tF, p)

    # Get the step method associated with its name
    if mname == 'FE':
        method = step_FE
    elif mname == 'BE':
        method = step_BE
    else:
        raise ValueError("method name must be either FE or BE")

    # Run, plot, and time IVP solution porcess
    print(f"Running {mname}")
    time_0 = time.perf_counter()
    t, u = solve(ivp, dt, method)
    time_1 = time.perf_counter()
    plot_Y(t, u, ptitle=f"{mname}, dt={dt:.1e}")

    tot_time = time_1 - time_0
    print(f"Compute time for {mname} = {tot_time:.2e} seconds\n")
    return tot_time

run_combustion()