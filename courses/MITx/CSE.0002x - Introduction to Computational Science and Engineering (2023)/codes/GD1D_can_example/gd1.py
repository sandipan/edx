import numpy as np

def gd(calc_J, calc_Jprime, astart, alpha, nStop):
    """
    Implements gradient descent algorithm to reduce an unconstrained objective 
    function of a single variable

    Args:
        calc_J (function reference): reference to function that calculates the 
            objective function given the state, a.

        calc_Jprime (function reference): reference to function that calculates
            the derivative of the objective function with respect to the state.
                            
        astart (float): Initial guess for a
        
        alpha (float): steepest descent step size factor
        
        nStop (int): number of iterations of steepest descent to run (including
            the initial condition)

    Returns:
        ahist (1D numpy array): returns the iteration history of a with 
            ahist[n] corresponding to the nth iteration and running from n=0 to
            n = nStop-1.  i.e. len(ahist) = nStop
        Jhist (1D numpy array): returns the iteration history of the objective
            function.  Like ahist, len(Jhist)=nStop with Jhist[0] being the value
            of J for the initial condition.
    """
    
    # Allocate ahist and Jhist
    ahist = np.zeros(nStop)
    Jhist = np.zeros(nStop)
    
    # Calculate J and Jprime at astart
    a = astart
    J = calc_J(a)
    Jprime = calc_Jprime(a)
    
    # Store initial a and J in history arrays
    ahist[0] = a
    Jhist[0] = J
        
    # Complete loop for remaining iterations
    for n in range(1,nStop):
        # Perform gradient descent update to a
        a = a - alpha*Jprime
    
        # Calculate J and Jprime at new a
        J = calc_J(a)
        Jprime = calc_Jprime(a)
        
        # Store new a and J
        ahist[n]  = a
        Jhist[n]  = J

    return ahist, Jhist
