# Program      : Euler's method for a system
# Author       : MOOC team Mathematical Modelling Basics
# Created      : May, 2017

import numpy as np
import matplotlib.pyplot as plt

print("Solution for dP/dt = 0.7*P-4*G, dG/dt = -0.55*G") 

# Initializations

Dt = 1. #0.1                      # timestep Delta t
P_init = 20 #10                   # initial population of P
G_init = 5 #3                     # initial population of G
t_init = 0                        # initial time
t_end = 100 #5                    # stopping time

n_steps = int(round((t_end-t_init)/Dt)) # total number of timesteps

X = np.zeros(2)                   # create space for current X=[P,G]^T
dXdt = np.zeros(2)                # create space for current derivative
t_arr = np.zeros(n_steps + 1)     # create a storage array for t
X_arr = np.zeros((2,n_steps+1))   # create a storage array for X=[P,G]^T
t_arr[0] = t_init                 # add the initial t to the storage array
X_arr[0,0] = P_init               # add the initial P to the storage array
X_arr[1,0] = G_init               # add the initial G to the storage array

# Euler's method

for i in range (1, n_steps + 1):
    t = t_arr[i-1]                 # load the time
    P = X_arr[0,i-1]               # load the value of P
    G = X_arr[1,i-1]               # load the value of G
    X[0] = P                       # fill current state vector X=[P,G]^T
    X[1] = G
    dPdt = 0.7*P-0.007*P**2-0.04*P*G #0.7*P - 4*G             # calculate the derivative dP/dt
    dGdt = 0.008*P*G-0.25*G #- 0.55*G                # calculate the derivative dG/dt
    dXdt[0] = dPdt                 # fill derivative vector dX/dt
    dXdt[1] = dGdt         
    Xnew = X + Dt*dXdt             # calculate X on next time step
    X_arr[:,i] = Xnew              # store Xnew 
    t_arr[i] = t + Dt              # store new t-value 

# Plot the results

fig = plt.figure()
plt.plot(t_arr, X_arr[0,:], linewidth = 4, label="P(t)")  # plot P vs. time
plt.plot(t_arr, X_arr[1,:], linewidth = 4, label="G(t)")  # plot G vs. time

plt.title('dP/dt = 0.7*P-4*G, dG/dt = -0.55*G', fontsize = 20)  # set title
plt.xlabel('t (in days)', fontsize = 20)   # name of horizontal axis
plt.ylabel('P(t) and G(t)', fontsize = 20) # name of vertical axis

plt.xticks(fontsize = 15)               # adjust the fontsize
plt.yticks(fontsize = 15)               # adjust the fontsize
plt.axis([0, 100, 0, 70])                 # set the range of the axes

plt.legend(fontsize=15)                 # show the legend
plt.show()                              # necessary for some platforms

# save the figure as .jpg (other formats: png, pdf, svg, (ps, eps))
fig.savefig('Rainbowfish_Gourami.jpg', dpi=fig.dpi, bbox_inches = "tight")

