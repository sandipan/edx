
def coffee_evalf(u, t, p):
    """
    args:
        u (float list): current state with u[0] = v and u[1] = w
        t (float): current time

    returns:
        float list for forcing f, where du/dt = f(u, t)
    """
    # unpack state list
    Tc = u[0]

    #### BEGIN SOLUTION ####
    #raise NotImplementedError("Calculate and return the f vector in terms of v and w")
    return [p['h']*p['A']*(p['Tout'] - Tc) / p['mc'] / p['cc']]
    #### END SOLUTION ####

from copy import deepcopy

class IVP():
    def __init__(self, uI, tI, tF, p, f):
        """
        Args:
            uI (float list): initial condition of state.
            tI (float): initial time.
            tF (float): final time.
            p (dictionary): set of fixed parameters.
            f (function): takes as input u,t,p and returns du/dt
        """

        self._uI = uI[:]
        self._tI = tI
        self._tF = tF
        self._p  = p # THIS IS THE ONLY DIFFERENCE
        #self._p  = deepcopy(p) # THIS IS THE ONLY DIFFERENCE
        self._f  = f
        self._M  = len(uI)

    def evalf(self, u, t):
        """    
        Args:
            u (float list): current solution.
            t (float): current time.

        Returns:
            float list: f(u,t,p).
        """
        
        return self._f(u, t, self._p)

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

# Create an IVP object for coffee on a hot day
coffeeIVP_hotday = IVP([TcI], tI, tF, p, coffee_evalf)

# Calculate dTc/dt on a hot day with Tc=40.0 C
Tc = 40.0
dTcdt_hotday = coffeeIVP_hotday.evalf([Tc],0.)
print(f"On a hot day:        dTc/dt = {dTcdt_hotday[0]}")

# Create an IVP object for coffee on a cool day
p['Tout'] = 5.0 # C

coffeeIVP_coolday = IVP([TcI], tI, tF, p, coffee_evalf)

# Calculate dTc/dt on a cool day with Tc=40.0 C
dTcdt_coolday = coffeeIVP_coolday.evalf([Tc],0.)
print(f"On a cool day:       dTc/dt = {dTcdt_coolday[0]}")

#p['Tout'] = 25.0 # C

# Calculate dTc/dt on a hot day with Tc=40.0 C one more time
dTcdt_hotday_again = coffeeIVP_hotday.evalf([Tc],0.)
print(f"On a hot day again:  dTc/dt = {dTcdt_hotday_again[0]}")
#When that code is run with the original __init__ implementation, the following is printed:

#On a hot day:        dTc/dt = -0.002040816326530612
#On a cool day:       dTc/dt = -0.0047619047619047615
#On a hot day again:  dTc/dt = -0.002040816326530612
#Suppose we consider the following alternative implementation of the __init__ method in which we set self._p = p. Here's the new version of the __init__ method:
