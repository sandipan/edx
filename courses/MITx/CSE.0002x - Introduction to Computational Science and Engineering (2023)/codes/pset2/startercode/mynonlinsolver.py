################################################################################
# CSE.0002x
# Problem Set 2: mynonlinsolver
# edX Username:

"""
This Python library implements Newton's method to solve a nonlinear
system of equations: r(u) = 0
"""

import numpy as np


def myNewton(u0, evalr, evalr_u, numNewton=10):
    """
    Args:
        u0: NumPy ndarray, initial guess
        evalr: reference to a function which takes as input u, an ndarray
            of the same size as u0, and returns r(u)
        evalr_u: reference to a function which takes as input u, an ndarray
            of the same size as u0, and returns the Jacobian dr/du evaluated
            as u

    Returns: u, the approximate solution to r(u) = 0, determined using
        Newton's method
    """
    uNewton = u0.copy()  # Set Newton initial solution to u0
    for k in range(numNewton):
        # Note: you may use np.linalg.solve to solve the linear system
        #### BEGIN SOLUTION #####
        #raise NotImplementedError("Update the uNewton state for a single step of Newton's method")
        uNewton = uNewton - np.linalg.solve(evalr_u(uNewton), evalr(uNewton))
        #### END SOLUTION #####
    return uNewton


def test_myNewton():
    """
    This function runs a test of the Newton method implementation in
    myNewton.
    """
    def calcr(u):
        u0 = u[0]
        u1 = u[1]
        r0 = u0**2 - u1 + u0*np.cos(np.pi*u0)
        r1 = u0*u1 + np.exp(-u1) - 1/u0
        return np.array([r0, r1])

    def calcr_u(u):
        u0 = u[0]
        u1 = u[1]
        r_u = np.zeros((2, 2))
        r_u[0,0] = 2*u0 + np.cos(np.pi*u0) - u0*np.pi*np.sin(np.pi*u0)
        r_u[0,1] = -1.0
        r_u[1,0] = u1 + 1/u0**2
        r_u[1,1] = u0 - np.exp(-u1)
        return r_u

    u0 = np.array([2.0, -1.0])

    u2 = myNewton(u0, calcr, calcr_u, numNewton=2)
    u2_true = np.array([1.016920e+00, -5.679316e-02])

    print("Result of a 2 iteration Newton solve:")
    print(f"u2    = {u2}")
    print(f"r(u2) = {calcr(u2)}")
    print(f"Does solution = correct solution: {np.allclose(u2, u2_true)}")
    print()

    u10 = myNewton(u0, calcr, calcr_u, numNewton=10)
    u10_true = np.array([1.000000, 1.299920e-17])

    print("Result of 10 iteration Newton solve:")
    print(f"u10    = {u10}")
    print(f"r(u10) = {calcr(u10)}")
    print(f"Does solution = correct solution: {np.allclose(u10, u10_true)}")
    print()


if __name__ == '__main__':
    test_myNewton()
