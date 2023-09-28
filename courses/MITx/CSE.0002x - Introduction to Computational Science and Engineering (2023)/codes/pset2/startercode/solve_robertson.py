################################################################################
# CSE.0002x
# Problem Set 2: solve_robertson
# edX Username:

import numpy as np
import matplotlib.pyplot as plt
import time
from IVPlib_pset2 import IVP
import IVPlib_pset2 as IVPlib


################################################################################
## Robertson class definition (a subclass of IVP)
################################################################################


class RobertsonIVP(IVP):

    def evalf(self, u, t):
        """
        Calculates right-hand side of Robertson's IVP
        (this passes through to the calc_all method).
        See docstring of calc_all for details.

        Args:
            u (NumPy ndarray): current state
            t (float): current time

        Returns:
            f (NumPy ndarray): current right-hand side.
        """
        return self.calc_all(u, calc_f=True)

    def evalf_u(self, u, t):
        """
        Calculates Jacobian of right-hand side of Robertson's IVP
        (this passes through to the calc_all method).
        See docstring of calc_all for details.

        Args:
            u (NumPy ndarray): current state
            t (float): current time

        Returns:
            f_u (NumPy ndarray): Jacobian of current right-hand side.
        """
        return self.calc_all(u, calc_Jacobian=True)

    def calc_all(self, u, calc_f=False, calc_Jacobian=False):
        """
        Calculate f and df/du for Robertson's IVP

        Args:
            u: NumPy float ndarray of the three states
            calc_f: boolean
                If True, then calculate f
            calc_Jacobian: boolean
                If True, then calculate df/du (f_u)

        Returns:
            if calc_f and calc_Jacobian: return tuple (f, f_u)
            else return just f or just f_u
        """
        u0 = u[0]
        u1 = u[1]
        u2 = u[2]

        k0 = self.get_p('k0')
        k1 = self.get_p('k1')
        k2 = self.get_p('k2')

        # Calculate f if requested
        if calc_f:
            #### BEGIN SOLUTION #####
            #raise NotImplementedError("Calculate f vector for RobertsonIVP")
            f = np.array([-k0*u0 + k2*u1*u2, k0*u0 - k1*u1**2 - k2*u1*u2, k1*u1**2])
            #### END SOLUTION #####

        # Calculate Jacobian df/du if requested
        if calc_Jacobian:
            #### BEGIN SOLUTION #####
            #raise NotImplementedError("Calculate Jacobian df/du for RobertsonIVP")
            f_u = np.array([[-k0, k2*u2, k2*u1], [k0, -2*k1*u1 - k2*u2, -k2*u1], [0, 2*k1*u1, 0]])
            #### END SOLUTION #####

        if calc_f and calc_Jacobian:
            return f, f_u
        elif calc_f:
            return f
        elif calc_Jacobian:
            return f_u
        else:
            raise ValueError("calc_f and calc_Jacobian both False")


def test_calc_all():
    """
    This function calls the RobertsonIVP.calc_all method with:
        k0 = 4.0e-2
        k1 = 3.0e7
        k2 = 1.0e4

    and u = [0.5, 0.05, 0.45]

    and checks to see if the returned f and Jacobian (f_u) match the
    pre-computed correct values (in f_correct and f_u_correct).

    Returns:
        tuple of booleans (f_match, f_u_match) indicating whether
        f and f_u were calculated correctly
    """
    print("Running test_calc_all...\n")

    # The correct state and f and f_u values
    u = np.array([0.5, 0.05, 0.45])
    f_correct = np.array([2.249800e+02, -7.522498e+04, 7.500000e+04])
    f_u_correct = np.array([
        [-4.000000e-02,  4.500000e+03,  5.000000e+02],
        [ 4.000000e-02, -3.004500e+06, -5.000000e+02],
        [ 0.000000e+00,  3.000000e+06,  0.000000e+00] ])

    #### BEGIN SOLUTION #####
    #raise NotImplementedError("Instantiate a RobertsonIVP with parameters listed in the pset, "
    #                          "and use it to calculate f and f_u at the specified state u")
    p = {'k0': 4e-2, 'k1': 3e7, 'k2': 1e4}
    rivp = RobertsonIVP(u, 0, 4e2, p)
    f, f_u = rivp.calc_all(u, True, True)

    #### END SOLUTION #####

    # Check correctness and print a message
    print("Correct values:")
    print(f"f   = \n{f_correct}")
    print(f"f_u = \n{f_u_correct}\n")

    print("calc_all values:")
    print(f"f   = \n{f}")
    print(f"f_u = \n{f_u}\n")

    f_match = np.allclose(f, f_correct)
    f_u_match = np.allclose(f_u, f_u_correct)
    print(f"Is f   calculately correctly: {f_match}")
    print(f"Is f_u calculately correctly: {f_u_match}\n")
    return f_match, f_u_match


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
    fig, axs = plt.subplots(3, 1)
    
    axs[0].plot(t,u[:,0])
    axs[0].set_title(ptitle)
    axs[0].set_ylabel('$Y_0$')
    axs[0].grid(True)
    axs[0].set_ylim(0, 1)

    axs[1].plot(t,u[:,1])
    axs[1].set_ylabel('$Y_1$')
    axs[1].grid(True)
    axs[1].set_ylim(0, 4.0e-5)

    axs[2].plot(t,u[:,2])
    axs[2].set_ylabel('$Y_2$')
    axs[2].grid(True)
    axs[2].set_ylim(0, 1)    
    #### END SOLUTION #####
    
    return fig, axs

    #### END SOLUTION #####


def run_robertson(mname='FE', dt=1.0e-4):
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
    p['k0'] = 4.0E-2
    p['k1'] = 3.0E7
    p['k2'] = 1.0E4

    # Set initial condition
    uI = np.array([1.0, 0.0, 0.0])

    # Time range to consider
    tI = 0.
    tF = 4.0e2 # sec

    # Instantiate RobertsonIVP object
    Robertson_IVP = RobertsonIVP(uI, tI, tF, p)

    # Get the step method associated with its name
    if mname == 'FE':
        method = IVPlib.step_FE
    elif mname == 'BE':
        method = IVPlib.step_BE
    else:
        raise ValueError("method name must be either FE or BE")

    # Run, plot, and time IVP solution porcess
    print(f"Running {mname}")
    time_0 = time.perf_counter()
    t, u = IVPlib.solve(Robertson_IVP, dt, method)
    time_1 = time.perf_counter()
    plot_Y(t, u, ptitle=f"{mname}, dt={dt:.1e}")

    tot_time = time_1 - time_0
    print(f"Compute time for {mname} = {tot_time:.2e} seconds\n")
    return tot_time


def run_robertson_FE_stable():
    #### BEGIN SOLUTION #####
    # Adjust the Foward Euler timestep upward until just stable
    #return run_robertson(mname='FE', dt=1.0e-4)
    return run_robertson(mname='FE', dt=3.52e-4)
    #### END SOLUTION #####


if __name__ == '__main__':
    # Test the calc_all routine
    test_calc_all()

    # Uncomment once calc_all and test_calc_all are implemented and working
    time_FE = run_robertson_FE_stable()

    # Uncomment once Backward Euler is implemented
    time_BE = run_robertson(mname='BE', dt=1.0e0)
    print(f"Ratio of FE/BE compute time = {time_FE/time_BE:.1f}")

    plt.show()
