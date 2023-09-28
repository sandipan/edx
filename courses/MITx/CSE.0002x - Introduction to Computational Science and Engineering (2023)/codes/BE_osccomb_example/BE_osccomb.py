import numpy as np
import matplotlib.pyplot as plt

tau = 5.0e-8 # s
T_F = 0.1 # s
A_F = 0.01 # mol/cm^3/s

pi = np.pi
FI = 0.0 # mol/cm^3
tF = 1 # final time to simulate to (s)
dt = 1e-3 # time increment to give solutions at (s)

# Sets initial condition
t = np.arange(0,tF+dt,dt)
N = len(t)
v = np.zeros(N)
v[0] = FI

# Loop from from t=0 to t>=tF
for n in range(N-1):
    tn1 = t[n+1]
    vn  = v[n]
    
    # Update solution using Backward Euler method
    I_F = 0.5*A_F*(1-np.cos(2*pi*tn1/T_F))
    
    v[n+1] = (vn + dt*I_F)/(1+dt/tau)

# Plot
plt.plot(t,v,label=f'BE, dt = {dt:.6e} s')
plt.xlabel('t (s)')
plt.ylabel('F (mol/cm$^3$)')
plt.grid(True)
plt.legend()
plt.show()
