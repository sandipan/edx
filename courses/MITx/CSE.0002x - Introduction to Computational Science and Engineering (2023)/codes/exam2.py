import numpy as np
import matplotlib.pylab as plt

def compute_grad_step(x, alpha = 0.02):
    def gradJ(x):
        return (np.array([2*np.pi*np.cos(2*np.pi*x[0]),-2*np.pi*np.sin(2*np.pi*x[1])]))
    return x - alpha*gradJ(x)

def compute_gd():
    x = np.array([0.6, 0.2])
    #print(compute_grad_step(x))

    for _ in range(100):
        x = compute_grad_step(x)
        print(x)

import numpy as np

def reqpow(bg):
    """
    Calculates the power required for a refrigeration system
    which has two design parameters: b and g and the gradient
    of the power with respect to b and g

    Args:
        bg (1D numpy array): b = bg[0], g = bg[1]
        
    Returns:
        P (float): the required power
        Pprime (1D numpy array): gradient of P
    """
    b = bg[0]
    g = bg[1]
    
    x   = 10*(b-1)
    x_b = 10.
    y   = g-10
    y_g = 1.0
    P   = 1 - 0.3854*np.exp(-x**2)/(y**2 + 1) + (1e-6)*y**4
    P_x = 0.3854*(2*x)*np.exp(-x**2)/(y**2 + 1)
    P_y = 0.3854*(2*y)*np.exp(-x**2)/(y**2 + 1)**2 + 4*(1e-6)*y**3
    P_b = P_x*x_b
    P_g = P_y*y_g
    
    Pprime = np.array([P_b, P_g])
    
    return P, Pprime

def contour_plot():

    # Set up linearly spaced points in x and y for evaluating objective function
    Nx = 101
    Ny = 101
    bx = np.linspace(0.8, 1.2, Nx)
    by = np.linspace(6., 14., Ny)
    f = np.zeros((Nx, Ny))

    xy = np.zeros(2)
    for j in range(len(bx)):
        for i in range(len(by)):
            xy[0], xy[1] = bx[j], by[i]
            f[i,j] = reqpow(xy)[0]

    #raise NotImplementedError("Plot contours of J1") # this is where you assign axs and cs
    fig, axs = plt.subplots()
    cs = axs.contour(bx, by, f) #, cmap='RdGy')
    axs.clabel(cs)
    axs.set_xlabel('b')
    axs.set_ylabel('g')
    axs.grid(True)
    #axs.axis('square')
    
    plt.show()

#contour_plot()

def gradient_descent(Jfunc, xstart, alpha, nStop, verbose=False, pdict=None):
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
        x =  x - alpha * Jprime
        if pdict is None:
            J, Jprime = Jfunc(x)
        else:
            J, Jprime = Jfunc(x, pdict)
        xhist[n, :] = x
        Jhist[n] = J
        if verbose:
            print(f"Iter={n}: J = {J:.2e}, dJ = {Jhist[n] - Jhist[n-1]:.2e}, max dx = {np.max(xhist[n] - xhist[n-1]):.2e} for state i={np.argmax(xhist[n] - xhist[n-1])}")

    return xhist, Jhist

def run_test():
    print()
    print("Running test")
    xstart = np.array([1.10, 8.0])
    alpha = 0.08
    nStop = 200
    xhist, Jhist = gradient_descent(reqpow, xstart, alpha, nStop, verbose=True)
    print(f"In run_test1: (xopt, yopt) = ({xhist[-1,0]:.2e}, {xhist[-1,1]:.2e}), Jmin = {Jhist[-1]:.2e}")

    # Set up linearly spaced points in x and y for evaluating objective function
    Nx = 101
    Ny = 101
    bx = np.linspace(0.8, 1.2, Nx)
    by = np.linspace(6., 14., Ny)
    f = np.zeros((Nx, Ny))

    xy = np.zeros(2)
    for j in range(len(bx)):
        for i in range(len(by)):
            xy[0], xy[1] = bx[j], by[i]
            f[i,j] = reqpow(xy)[0]
    fig, axs = plt.subplots()
    cs = axs.contour(bx, by, f) #, cmap='RdGy')
    axs.clabel(cs)
    axs.set_xlabel('x')
    axs.set_ylabel('y')
    axs.grid(True)
    axs.plot(xhist[:,0], xhist[:,1], 'go')
    axs.plot(xhist[-1,0], xhist[-1,1], 'mo')
    plt.show()


run_test()
