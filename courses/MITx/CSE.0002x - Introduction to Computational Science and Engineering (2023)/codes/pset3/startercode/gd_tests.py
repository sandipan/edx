################################################################################
# CSE.0002x
# Problem Set 3: run_tests
# edX Username:


import numpy as np
import matplotlib.pyplot as plt
import gd


def J0(xv):
    """
    Calculates J0 objective function and its gradient (see pset desription).

    Args:
        xv (1D numpy array): for this problem, only one value (xv[0]) will be present

    Returns:
        J0 (float): objective function at x = xv[0]
        J0prime (1D numpy array): gradient of J0 at x = xv[0]
    """
    x = xv[0]
    J0 = (x-0.5)**2
    J0prime = 2 * (x-0.5)
    return J0, J0prime


def J1(xv, pdict):
    """
    Calculates J1 objective function and its gradient (see pset desription).

    Args:
        xv (1D numpy array): x = xv[0], y = xv[1]
        pdict (dictionary): contains the key 'user' with the associated value referring
            to the user location such that:
                pdict['user'][0] is the x-location of the user
                pdict['user'][1] is the y-location of the user

    Returns:
        J1 (float): objective function at xv
        J1prime (1D numpy array): gradient of J1 at xv
    """
    #### BEGIN SOLUTION ####
    #raise NotImplementedError("Calculate J1 and its gradient at a given state xv")
    x, y = xv[0], xv[1]
    xu, yu = pdict['user'][0], pdict['user'][1]
    J1 = -1/(1+(x-xu)**2 + (y-yu)**2)
    J1prime = np.array([2*(x-xu)/(1+(x-xu)**2 + (y-yu)**2)**2, 2*(y-yu)/(1+(x-xu)**2 + (y-yu)**2)**2])
    return J1, J1prime
    #### END SOLUTION ####


def run_test0():
    print()
    print("Running test0")
    xstart = np.array([-0.5])
    alpha = 0.1
    nStop = 40
    xhist, Jhist = gd.gradient_descent(J0, xstart, alpha, nStop, verbose=True)
    print(f"In run_test0: xopt = {xhist[-1,0]:.2e}, Jmin = {Jhist[-1]:.2e}")


def run_test1():
    print()
    print("Running test1")
    pdict = {}
    pdict['user'] = np.array([0.5, -0.25])
    xstart = np.array([0., 0.])
    alpha = 0.1
    nStop = 40
    xhist, Jhist = gd.gradient_descent(J1, xstart, alpha, nStop, verbose=True, pdict=pdict)
    print(f"In run_test1: (xopt, yopt) = ({xhist[-1,0]:.2e}, {xhist[-1,1]:.2e}), Jmin = {Jhist[-1]:.2e}")

    # Set up linearly spaced points in x and y for evaluating objective function
    Nx = 101
    Ny = 101
    bx = np.linspace(-1., 1., Nx)
    by = np.linspace(-1., 1., Ny)
    f = np.zeros((Nx, Ny))

    #### BEGIN SOLUTION ####
    #raise NotImplementedError("Calculate J1 at all (x, y) in bx, by; save into f")
    #X, Y = np.meshgrid(bx, by)
    xy = np.zeros(2)
    for j in range(len(bx)):
        for i in range(len(by)):
            xy[0], xy[1] = bx[j], by[i]
            f[i,j] = J1(xy, pdict)[0]
    #raise NotImplementedError("Plot contours of J1") # this is where you assign axs and cs
    fig, axs = plt.subplots()
    cs = axs.contour(bx, by, f) #, cmap='RdGy')
    axs.clabel(cs)
    axs.set_xlabel('x')
    axs.set_ylabel('y')
    axs.grid(True)
    axs.axis('square')
    #raise NotImplementedError("Plot xhist markers on top of J1's contours")
    #for x, y in xhist[:-1,:]:
    #    axs.plot(x, y, marker='o', color='green')
    axs.plot(xhist[:,0], xhist[:,1], 'go')
    axs.plot(xhist[-1,0], xhist[-1,1], 'mo')
    #### END SOLUTION ####
    return axs, cs


if __name__ == '__main__':
    #run_test0()
    run_test1()
    plt.show()
