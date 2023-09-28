################################################################################
# Model predator-prey population dynamics
#
#    dr/dt =  a r - b r f
#    df/dt = -m f + c b r f 
#
# where: r  = population of prey (e.g. number of rabbits)
#        f  = population of predator (e.g. number of foxes)
#        a  = birth rate of prey per capita
#        m  = mortality rate of predator per capita
#        b  = predation rate per prey x predator
#        c  = frequency at which predation results prey
#
    
import numpy as np
from IVPlib_np_rev1 import IVP

################################################################################
## PredPrey class definition (a subclass of IVP)
################################################################################

class PredPreyIVP(IVP):

    def evalf(self, u, t):
        """        
        Args:
            u (NumPy ndarray): current population states
            t (float): current time
    
        Returns:
            f (NumPy ndarray): forcing
        """
        
        a    = self.get_p('a')
        b    = self.get_p('b')
        c    = self.get_p('c')
        m    = self.get_p('m')

        f = np.zeros(2)
        f[0] =  a*u[0] -   b*u[0]*u[1]
        f[1] = -m*u[1] + c*b*u[0]*u[1]
            
        return f


