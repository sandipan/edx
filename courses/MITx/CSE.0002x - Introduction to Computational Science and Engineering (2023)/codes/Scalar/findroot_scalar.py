################################################################################
# Intro to CSE
#
# bisection and Newton method implemented to find the root of a 
# scalar equation: r(x) = 0

import numpy as np
import matplotlib.pyplot as plt

def calcr(x):   
    return calcr_all(x, calc_r=True)
  
def calcdrdx(x):   
    return calcr_all(x, calc_drdx=True)

def calcr_all(x, calc_r=False, calc_drdx=False):
    """
    Calculate r and dr/dx

    Args:

    x: NumPy 1D array

    calc_r: boolean.
            If True, then calculate r(x)

    calc_drdx: boolean.
            If True, then calculate dr/dx(x)

    Returns:
        if calc_r and calc_drdx: return tuple (r, r_x)
        else return just r or just r_x
    """
    
    # Calculate r if requested
    if calc_r:
        # Simple r(x) example
        r = -np.sin(2*np.pi*x)*np.exp(-x)
        #r = 1 + x - x**4
        #r = x**2 - 2
        #r = 2 - x - x**3
        
        # Uncomment the following for more complex demo
        # r = -3*x**3 + 7*x**2 - 4.

    # Calculate dr/dx if requested
    if calc_drdx:
        # drdx for simple r(x)
        r_x = np.sin(2*np.pi*x)*np.exp(-x) - 2*np.pi*np.cos(2*np.pi*x)*np.exp(-x)
        #r_x = 1 - 4*x**3
        #r_x = 2*x
        #r_x = -1 - 3*x**2
        
        # Uncomment the following for more complex demo
        # r_x = -9*x**2 + 14*x

    if calc_r and calc_drdx:
        return (r, r_x)
    elif calc_r:
        return r
    elif calc_drdx:
        return r_x
    else:
        raise ValueError("calc_r and calc_drdx both False")


def findroot_bisection(calc_r, a, b, n, ax=None):
    """
        Runs the bisection method for finding an approximation to a root
        of r(x) = 0

        Args:
            calc_r (scalar function reference): function which returns r(x) 
            when called as calc_r(x)
            
            a, b (float): numbers such that r(a)*r(b) < 0            
    		(i.e., r(a) and r(b) have opposite signs)
            
            n (int): number of iterations to take
            
            ax (matplotlib pyplot Axes object reference): if provided,
            the plot the locations in the x, r(x) plane for the current 
            bisection interval values of a, m, and b.
                
        Returns:
            x: approximation to a root of r, i.e., such that r(x) = 0
        """

    ra = calc_r(a)
    rb = calc_r(b)
    assert ra*rb < 0.0, "The bisection method needs an interval where the function changes sign"

    m = 0.5*(a+b)
    print(f"Iteration {0:2d}: x = {m: .10f}")
    for i in range(n):
            
        rm = calc_r(m)
        if (ax is not None):
            ax.plot(a,ra, marker='o', fillstyle='none', color='green', markersize=10)
            ax.plot(m,rm,'r*')
            ax.plot(b,rb, marker='o', fillstyle='none', color='blue', markersize=10)
            plt.pause(1.0)

        rma = rm*ra
        if rma > 0:    # ra and rm have the same sign, so a is replaced by m
            a  = m
            ra = rm
        elif rma < 0:  # rb and rm have the same sign, so b is replaced by m
            b  = m
            rb = rm
        else:          # only possible when r(m) == 0
            return m

        m = 0.5*(a+b)
        print(f"Iteration {i+1:2d}: x = {m: .10f}")
    
    if (ax is not None): # Plot location of final iterate
        ax.plot(a,ra, marker='o', fillstyle='none', color='green', markersize=10)
        ax.plot(m,calc_r(m),'m*')
        ax.plot(b,rb, marker='o', fillstyle='none', color='blue', markersize=10)

    
    return m


def findroot_Newton(calc_r, calc_drdx, x0, n, eps=None, ax=None):
    """
        Runs the Newton-Raphson method for finding an approximation to a root of r

        Args:
            calc_r (scalar function reference): function which returns r(x) 
                when called as calc_r(x)
                
            calc_drdx (scalar function reference): function which returns dr/dx(x) 
                when called as calc_drdx(x)

            x0 (float): initial guess of x

            n (int): number of iterations to take
            
            eps (float): if provided, use finite difference with a step size of 
            eps to calculate drdx (instead of calc_drdx)
            
            ax (matplotlib pyplot Axes object reference): if provided,
            the plot the locations in the xk, r(xk) plane for each
            Newton iterate
                
        Returns:
            x: approximation to a root of f, i.e., such that r(x) = 0

        """
    
    def fd_drdx(xk):
        return (calc_r(xk+eps)-calc_r(xk-eps))/(2*eps)
    
    if (eps is not None):
        calc_drdx = fd_drdx

    xk = x0
    print(f"Iteration {0:2d}: x = {xk: .10f}")
    for i in range(n):
        rk = calc_r(xk)

        if (ax is not None): # Plot location of current iterate
            ax.plot(xk, rk, 'r*')
            plt.pause(1.0)

        drdxk = calc_drdx(xk)            
        xk = xk - rk/drdxk
        
        print(f"Iteration {i+1:2d}: x = {xk: .10f}")

    if (ax is not None): # Plot location of final iterate
        ax.plot(xk, calc_r(xk), 'm*')

    return xk


################################################################################
## Main body
################################################################################

if __name__ == "__main__":
    x = np.linspace(-1.,2.,1001)
    fig, ax = plt.subplots()
    ax.plot(x,calcr(x),'k-')
    ax.grid(True)
    ax.set_xlabel('$x$')
    ax.set_ylabel('$r$')
    
    # print("Running bisection")
    # findroot_bisection(calcr, -1.0, 2.0, 10, ax=ax)

    print()
    print("Running Newton")
    #findroot_Newton(calcr, calcdrdx, 0.5, 6, ax=ax)    
    findroot_Newton(calcr, calcdrdx, 0.9, 6, ax=ax)    


