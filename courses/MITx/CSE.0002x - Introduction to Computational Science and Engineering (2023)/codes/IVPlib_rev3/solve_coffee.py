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

import matplotlib.pyplot as plt
import math
import IVPlib_rev3 as IVPlib
from coffee_model_rev3 import coffeeIVP 

mc   = 0.35 # kg
cc   = 4200.0 # J / (kg C)
h    = 5.0 # W/(m^2 C)
A    = 0.04 # m^2
Tout = 25.0 # C
        
TcI   = 85.0 # Initial temperature of coffee (C)
tFmin = 700.0 # final time to simulate to (min)
dtmin = 5e1 # time increment to give solutions at (min)

# Convert times to seconds
tF = tFmin*60
dt = dtmin*60

# Initialize CoffeeIVP object
p = {}
p['h']    = h
p['A']    = A
p['mc']   = mc
p['cc']   = cc
p['Tout'] = Tout

coffeeIVP_hotday = coffeeIVP([TcI], 0.0, tF, p)

# Solve coffee IVP
t, v = IVPlib.FEsolve(coffeeIVP_hotday, dt)

# Calculate exact solution
# and extract Tc (list of floats) from v (list of lists)
u  = []
Tc = []

lam  = -h*A/(mc*cc) # Needed for exact solution

for n in range(len(t)):
    ts = t[n]
    t[n] = t[n]/60.0 # convert to minutes
    un = Tout + (TcI-Tout)*math.exp(lam*ts) # this is the exact solution
    u.append(un)
    Tcn = v[n][0]
    Tc.append(Tcn)


# Plot   
fig, ax = plt.subplots()
ax.scatter(t,Tc,marker='o',label='numerical')
ax.set_xlabel('t (min)')
ax.set_ylabel('$T_c$ (C)')
ax.grid(True)
    
ax.scatter(t,u,marker='x',label='exact')
ax.legend()
