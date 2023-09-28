import matplotlib.pyplot as plt
import math

import IVPlib_rev3 as IVPlib

class twostate_IVP(IVPlib.IVP):
    def evalf(self, u, t):
        """        
        Args:
            Tc (float list): current temperature of coffee.
            t (float): current time
    
        Returns:
            f (float list): returns dTc/dt
        """
        v, w = u
        return [-100*v+w+t, -v+2*w-t**3]




dt = 0.1

ivp = twostate_IVP([0, 1], 1, 1.3, {})
t, v = IVPlib.FEsolve(ivp, dt)

print(t, v)
