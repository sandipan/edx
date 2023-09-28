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
    
from IVPlib_rev3 import IVP

################################################################################
## PredPrey class definition (a subclass of IVP)
################################################################################

class PredPreyIVP(IVP):

    def evalf(self, u, t):
        """        
        Args:
            u (float list): current population states
            t (float): current time
    
        Returns:
            f (float list): forcing
        """
        
        a    = self.get_p('a')
        b    = self.get_p('b')
        c    = self.get_p('c')
        m    = self.get_p('m')
    
        ru = u[0]
        fu = u[1]
        
        fr =  a*ru -   b*ru*fu
        ff = -m*fu + c*b*ru*fu
            
        return [fr, ff]



