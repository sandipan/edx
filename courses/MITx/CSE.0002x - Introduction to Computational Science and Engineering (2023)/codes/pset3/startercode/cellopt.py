################################################################################
# CSE.0002x
# Problem Set 3: cellopt
# edX Username:


import numpy as np
import matplotlib.pyplot as plt
import gd


def calc_objfun(basesv, pdict):
    """
    Calculates the objective function using the p-norm version of min and max to approximate
    the min max power (min over all users, max over all bases). See pset description for more
    details.

    Args:
        basesv (1D numpy array): for base i, the (x, y) location is (basesv[2*i], basesv[2*i+1])
        pdict (dictionary) with the following key, val pairs:
            pdict['p'] = value of p used in Lp-norm min/max
            pdict['r0'] = r0 in power model (see pset description)
            pdict['users'] = 2D numpy array of user locations such that
                user[i,0] is the x location of user i
                user[i,1] is the y location of user i

    Returns:
        Pp: objective function value
        Pp_prime: gradient of Pp with respect to basesv (same shape as basesv)
    """
    p = pdict['p']
    r0 = pdict['r0']
    r02 = r0**2
    users = pdict['users']
    Nusers = len(users)
    Nbases = int(len(basesv)/2)
    bases = basesv.reshape((Nbases, 2))

    Ppt = 0.
    Ppt_prime = np.zeros(bases.shape)
    Up_prime = np.zeros(bases.shape)
    for nu in range(Nusers):
        xu = users[nu,0]
        yu = users[nu,1]
        Up = 0.
        Up_prime[:, :] = 0.
        for nb in range(Nbases):
            xb = bases[nb,0]
            yb = bases[nb,1]
            d2ub = (xb-xu)**2 + (yb-yu)**2
            d2ub_xb = 2 * (xb-xu)
            d2ub_yb = 2 * (yb-yu)
            su = (r02 + d2ub)**-p
            su_d2ub = -p * (r02 + d2ub)**(-p-1)
            Up += su
            Up_prime[nb,0] += su_d2ub * d2ub_xb
            Up_prime[nb,1] += su_d2ub * d2ub_yb
        Ppt += (Up/Nbases)**-1
        Ppt_prime -= (Up/Nbases)**-2 * Up_prime / Nbases
    Pp = -(Ppt/Nusers)**(-1/p)
    Pp_prime = (1/p) * (Ppt/Nusers)**(-1/p - 1) * Ppt_prime / Nusers
    return Pp, Pp_prime.reshape(2*Nbases)


def plot_objfun_onebase(axs, pdict, Nx=101, Ny=101):
    """
    Plots objfun contours as a function of the (x, y) location of a single base.
    The (x, y) plotting region is chosen to be an additional 10% beyond the
    bounding box of user locations. In other words:

        xmin = minimum x location of all users
        xmax = maximum x location of all users
        ymin = minimum y location of all users
        ymax = maximum y location of all users

        Lx = xmax - xmin
        Ly = ymax - ymin

        Then, the plotting region is for all points:
            x0 < x < x1   and   y0 < y < y1
        where:
            x0 = xmin - 0.1 Lx
            x1 = xmax + 0.1 Lx
            y0 = ymin - 0.1 Ly
            y1 = ymax + 0.1 Ly

    Overlayed on the plot are the user locations (this is done by calling plot_users)
    and the base location with the minimum objective.

    The plot's title should specify the value of the minimum objective along with
    and (x, y) location where it occurs (use two digits beyond the decimal in the title).

    Args:
        axs: axes on which plotting will be done
        pdict (dictionary): dictionary as described in calc_objfun's docstring
        Nx (int, optional): number of points in x for plotting (between x0 and x1), defaults to 101
        Ny (int, optional): number of points in y for plotting (between y0 and y1), defaults to 101

    Returns:
        cs: the ContourSet object produced by the contour() plotting function
    """
    users = pdict['users']
    plot_users(axs, users)

    #### BEGIN SOLUTION ####
    #raise NotImplementedError("Plot contours of the objective function "
    #                          "for the location of a single base")

    xmin, xmax = np.min(users[:,0]), np.max(users[:,0])
    ymin, ymax = np.min(users[:,1]), np.max(users[:,1])
    Lx, Ly = xmax - xmin, ymax - ymin
    x0, x1 = xmin - 0.1*Lx, xmax + 0.1*Lx
    y0, y1 = ymin - 0.1*Ly, ymax + 0.1*Ly

    bx = np.linspace(x0, x1, Nx)
    by = np.linspace(y0, y1, Ny)
    f = np.zeros((Nx, Ny))
    xy = np.zeros(2)
    for j in range(len(bx)):
        for i in range(len(by)):
            xy[0], xy[1] = bx[j], by[i]
            f[i,j] = calc_objfun(xy, pdict)[0]
   
    cs = axs.contour(bx, by, f) 
    axs.clabel(cs)
    axs.set_xlabel('x')
    axs.set_ylabel('y')
    axs.grid(True)
    x, y = np.unravel_index(np.argmin(f), f.shape)
    axs.set_title(f'min f = {f[x,y]:.2e} at ({by[y]:.2e}, {bx[x]:.2e})')
    axs.plot(by[y], bx[x], marker='*', color='red')
    #axs.axis('square')
    return cs
    #### END SOLUTION ####


def plot_users(axs, users):
    """
    Plot the location of the users.

    Args:
        axs: axes on which plotting will be done
        users (numpy 2D array): location of users (see docstring for calc_objfun)
    """
    axs.scatter(users[:, 0], users[:, 1], marker='s', color='blue')
    axs.set_aspect('equal')
    axs.set_xlabel('x')
    axs.set_ylabel('y')
    axs.grid(True)


def plot_optimize(axs, bases0, alpha, nStop, verbose=False, pdict={}):
    """
    Optimizes the base locations (calling the gradient descent algorithm) and then plots the
    optimization history of the base locations overlayed with the user locations.

    Args:
        axs: axes on which plotting will be done
        bases0 (2D numpy array): initial location of bases such that
            bases0[i,0] is the x location of base i
            bases0[i,1] is the y location of base i
        alpha (float): gradient descent step size
        nStop (int): number of iteration of gradient descent to run
        verbose (boolean, optional): verbose option for gd.gradient_descent, defaults to False
        pdict (dictionary): dictionary as described in calc_objfun's docstring
    """
    Nbases = len(bases0)
    bases0v = bases0.reshape(2*Nbases)
    bhist, Jhist = gd.gradient_descent(calc_objfun, bases0v, alpha, nStop, verbose, pdict)
    Jmin = Jhist[-1]
    bmin = bhist[-1, :]
    print(f"   Jmin   = {Jmin:.2e}")
    plot_users(axs, pdict['users'])
    for i in range(Nbases):
        axs.plot(bhist[:, 2*i], bhist[:, 2*i+1], marker='o', color='green', linestyle='')
        axs.plot(bmin[2*i], bmin[2*i+1], marker='o', color='magenta')
        print(f"   Base {i:d} = ({bmin[2*i]:9.2e}, {bmin[2*i+1]:9.2e})")


def optimize_bases123(users, alpha=0.1, nStop=10):
    """
    Performs optimization for 1, 2, and 3 base cases for the user locations in users.
    For the case of a single base, also call plot_objfun_onebase to plot the objective function.

    Args:
        users (2D numpy array): user location data (see docstring for calc_objfun)
        alpha (float): fraction of gradient step taken in gradient descent
        nStop (int): number of iterations for gradient descent to take
    """
    pdict = {}
    pdict['p'] = 7
    pdict['r0'] = 1.0
    pdict['users'] = users

    bases01 = np.array([[0.0, 0.0]])
    bases02 = np.array([[-0.5, -0.1], [0.1, 0.5]])
    bases03 = np.array([[-0.5, -0.1], [0., 0.], [0.1, 0.5]])

    print()
    print("Optimization with 1 base station:")
    _, axs1 = plt.subplots()
    plot_optimize(axs1, bases01, alpha, nStop, verbose=False, pdict=pdict)
    cs1 = plot_objfun_onebase(axs1, pdict)

    print()
    print("Optimization with 2 base stations:")
    _, axs2 = plt.subplots()
    plot_optimize(axs2, bases02, alpha, nStop, verbose=False, pdict=pdict)

    print()
    print("Optimization with 3 base stations:")
    _, axs3 = plt.subplots()
    plot_optimize(axs3, bases03, alpha, nStop, verbose=False, pdict=pdict)

    return axs1, axs2, axs3, cs1


def my_alpha():
    #### BEGIN SOLUTION ####
    return 0.1
    #### END SOLUTION ####

def my_nStop():
    #### BEGIN SOLUTION ####
    return 10
    #### END SOLUTION ####


if __name__== '__main__':
    # User locations for T-intersection study
    users_T = np.array([
        [-1.0, -1.0],
        [-1.0, -0.5],
        [-1.0,  0.0],
        [-1.0,  0.5],
        [-1.0,  1.0],
        [-0.5,  0.0],
        [ 0.0,  0.0],
        [ 0.5,  0.0],
        [ 1.0,  0.0]])

    # User locations for undergrad residence study
    users_UG = np.array([
        [-0.25, -0.35],
        [ 1.10, -0.12],
        [-0.50, -0.40],
        [-1.30, -0.40],
        [-1.00,  0.35],
        [ 0.95, -0.12],
        [-1.80,  0.20],
        [-0.65,  1.10],
        [-1.65, -0.40],
        [-2.20, -0.40],
        [-1.86, -0.40],
        [-0.80, -0.40]])

    # Use this line to test plot_objfun_onebase
    optimize_bases123(users_T)

    # Use this line to run gradient descent with custom values of alpha and nStop
    # optimize_bases123(users_T, alpha=my_alpha(), nStop=my_nStop())

    # Use this line to find optimum locations of cell towers on campus
    # optimize_bases123(users_UG, alpha=my_alpha(), nStop=my_nStop())

    plt.show()
