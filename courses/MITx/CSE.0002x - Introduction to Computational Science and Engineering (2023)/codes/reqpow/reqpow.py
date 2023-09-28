################################################################################
# CSE.0002x

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
