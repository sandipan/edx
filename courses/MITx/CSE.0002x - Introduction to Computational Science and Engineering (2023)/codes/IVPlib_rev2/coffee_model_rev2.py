################################################################################
# Model cooling of coffee in a cup with a simple lumped model
#
#    mc cc dTc/dt = h A (Tout - Tc)
#
# where: mc = mass of coffee in cup
#        cc = heat capacity of coffee
#        Tc = temperature of coffee
#      Tout = temperature of environment
#         h = heat transfer coefficient
#         A = surface area of coffee cup (including upper surface)
#
#  Note that dividing through by mc cc gives the equation implemented:
#
#         dTc/dt = h A / (mc cc) (Tout - Tc)
#
    
from IVPlib_rev2 import IVP

class coffeeIVP(IVP):
    def evalf(self, Tc, t):
        """        
        Args:
            Tc (float list): current temperature of coffee.
            t (float): current time
    
        Returns:
            f (float list): returns dTc/dt
        """

        mc = self.get_p('mc')
        cc = self.get_p('cc')
        h = self.get_p('h')
        A = self.get_p('A')
        Tout = self.get_p('Tout')

        f = h*A/(mc*cc)*(Tout - Tc[0])

        return [f]

if __name__ == "__main__":
    
    # Create an IVP object for coffee on a hot day
    p = {}
    p['mc'] = 0.35 # kg
    p['cc'] = 4200.0 # J / (kg C)
    p['h']  = 5.0 # W/(m^2 C)
    p['A']  = 0.04 # m^2
    p['Tout'] = 25.0 # C
        
    TcI = 85.0 # Initial temperature of coffee (C)
    tImin = 0.0 # initial time to start simulation (min)
    tFmin = 700.0 # final time to simulate to (min)
    tI = tImin*60 # convert time to seconds
    tF = tFmin*60 

    coffeeIVP_hotday = coffeeIVP([TcI], tI, tF, p)
    
    # Calculate dTc/dt on a hot day with Tc=40.0 C
    Tc = 40.0
    dTcdt_hotday = coffeeIVP_hotday.evalf([Tc],0.)
    print(f"On a hot day:  dTc/dt = {dTcdt_hotday[0]}")

    # Create an IVP object for coffee on a cool day
    p['Tout'] = 5.0 # C
    
    coffeeIVP_coolday = coffeeIVP([TcI], tI, tF, p)
    
    # Calculate dTc/dt on a cool day with Tc=40.0 C
    dTcdt_coolday = coffeeIVP_coolday.evalf([Tc],0.)
    print(f"On a cool day: dTc/dt = {dTcdt_coolday[0]}")
