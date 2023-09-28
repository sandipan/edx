################################################################################
# CSE.0002x
# Problem Set 2: LinSysIVP
# DO NOT MODIFY THIS FILE!

"""
This Python library implements a child IVP class that solves IVP governed
by linear systems, specifically, IVP of the form:

    du/dt = f(u,t,p)   where f(u,t,p) = A(p)*u + b(t,p)
"""

import numpy as np
import time
from IVPlib_pset2 import IVP


class LinSysIVP(IVP):

    def __init__(self, uI, tI, tF, p={}):
        """
        Args:
            uI (NumPy ndarray): initial condition of state
            tI (float): initial time
            tF (float): final time
            p (dictionary): set of fixed parameters
        """
        # Call constructor from super class
        super().__init__(uI, tI, tF, p)
        # Calculate A and store its reference
        self._A = self.calcA()

    def evalf(self, u, t):
        """
        Args:
            u (NumPy ndarray): current solution
            t (float): current time

        Returns:
            NumPy ndarray: f(u,t)
        """
        f = self.get_A()@u + self.evalb(t)
        return f

    def solve_eq(self, plotdict=None, linsolve=np.linalg.solve):
        """
        Solves equilibrium problem: A u_eq + b_eq = 0

        Args:
            plotdict (dictionary): contains info needed for plotstate

        Returns:
            NumPy ndarray: u_eq
        """
        time_0 = time.perf_counter()
        u_eq = -linsolve(self.get_A(), self.evalb())
        time_1 = time.perf_counter()
        tot_time = time_1 - time_0
        print(f"Compute time for linear solve = {tot_time:.2e} seconds")

        if plotdict is not None:
            self.plotstate(u_eq, plotdict)

        return u_eq

    ############ getter methods ############

    def get_A(self):
        """
        Returns:
            float: the A matrix
        """
        return self._A

    ############ virtual methods for use outside of class ############

    def calcA(self):
        """
        Calculate the A matrix (this is only called at construction of
        the IVP object).

        Returns:
            NumPy ndarray: A
        """
        raise NotImplementedError("calcA is not implemented for this class")

    def evalb(self, t=None):
        """
        Calculates the external forcing. If t=None then evalb should evaluate
        the external forcing for the equilibrium condition.

        Args:
            t (float): current time

        Returns:
            NumPy ndarray: b(t) or b_eq
        """
        raise NotImplementedError("evalb is not implemented for this class")
