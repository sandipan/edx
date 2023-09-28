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
    
import matplotlib.pyplot as plt
import IVPlib_np_rev1 as IVPlib
from predprey_model_np_rev1 import PredPreyIVP

p = {}
p['a'] = 2.0
p['b'] = 0.01
p['c'] = 0.1
p['m'] = 1.0

rI = 500
fI = 100
uI = [rI, fI]        
tF = 10.0 # final time to simulate to (month)
dt = 0.1 # time step (month)

# Create rabbit fox IVP
rabbit_fox_IVP = PredPreyIVP(uI, 0.0, tF, p)

# Solve rabbit fox IVP
t, v = IVPlib.solve(rabbit_fox_IVP, dt, IVPlib.step_FE)

# Plot   
fig, ax = plt.subplots()
ax.scatter(t,v[:,0],marker='o',label='rabbit')
ax.scatter(t,v[:,1],marker='x',label='fox')
ax.set_xlabel('t (months)')
ax.set_ylabel('population size')
ax.grid(True)
ax.legend()
