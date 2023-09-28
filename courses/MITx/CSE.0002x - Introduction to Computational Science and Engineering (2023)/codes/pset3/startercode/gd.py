################################################################################
# CSE.0002x
# Problem Set 3: gd
# edX Username:


import numpy as np


def gradient_descent(Jfunc, xstart, alpha, nStop, verbose=False, pdict=None):
    """
    Implements gradient descent algorithm to reduce an unconstrained objective function.

    Args:
        Jfunc (function object): function that calculates the objective function
            and gradient. Jfunc is called with one required argument, x, the state
            at which the objective function and gradient are to be evaluated.
            In addition, Jfunc will be passed pdict (if pdict is provided).
            So, the return and call from a Jfunc will be:
                J, Jprime = Jfunc(x, pdict)     # if pdict was provided
                J, Jprime = Jfunc(x)            # if pdict was not provided
        xstart (1D numpy array): initial guess for x
        alpha (float): steepest descent step size factor
        nStop (int): number of iterations of steepest descent to run
        verbose (boolean): if true, print information at every iteration of the gradient descent
        pdict (dictionary): passed through to Jfunc if provided

    Returns:
        xhist (2D numpy array): the iteration history of x with xhist[n, :]
            corresponding to the nth iteration, where n ranges from 0 to nStop
        Jhist (1D numpy array): the iteration history of the objective function
    """
    # Initialize storage for xhist and Jhist
    Nx = len(xstart)
    xhist = np.zeros((nStop+1, Nx))
    Jhist = np.zeros(nStop+1)

    # Calculate J and Jprime at xstart
    x = xstart
    if pdict is None:
        J, Jprime = Jfunc(x)
    else:
        J, Jprime = Jfunc(x, pdict)
    xhist[0, :] = x
    Jhist[0] = J

    if verbose:
        print(f"Iter=0: J = {J:.2e}")

    # Perform nStop steps of steepest descent
    for n in range(1, nStop+1):
        #### BEGIN SOLUTION ####
        x =  x - alpha * Jprime
        if pdict is None:
            J, Jprime = Jfunc(x)
        else:
            J, Jprime = Jfunc(x, pdict)
        xhist[n, :] = x
        Jhist[n] = J
        if verbose:
            print(f"Iter={n}: J = {J:.2e}, dJ = {Jhist[n] - Jhist[n-1]:.2e}, max dx = {np.max(xhist[n] - xhist[n-1]):.2e} for state i={np.argmax(xhist[n] - xhist[n-1])}")
        #### END SOLUTION ####

    return xhist, Jhist
