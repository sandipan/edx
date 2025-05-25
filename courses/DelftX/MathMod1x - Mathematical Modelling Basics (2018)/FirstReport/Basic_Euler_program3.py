# Program      			: Euler's method for a system
# Original Author       : MOOC team Mathematical Modelling Basics
# Modified by  			: Sandipan Dey
# Created      			: May, 2017

import numpy as np
import matplotlib.pyplot as plt

print("Solution for dS(t)/dt = -beta.S(t)I(t), dI(t)/dt = beta.S(t)I(t) - alpha.t, dR(t)/dt = alpha.I(t)") 

# Initializations

N = 4500
Dt = 1./2**8 #0.1                  # timestep Delta t
I_init = 10 #3                     # initial population of I
S_init = 4490 #3                   # initial population of S
R_init = 0						   # initial population of R
t_init = 0                         # initial time
t_end = 500 #500 #30 #5            # stopping time

n_steps = int(round((t_end-t_init)/Dt)) # total number of timesteps

X = np.zeros(3)                   # create space for current X=[I,S,R]^T
dXdt = np.zeros(3)                # create space for current derivative
t_arr = np.zeros(n_steps + 1)     # create a storage array for t
X_arr = np.zeros((3,n_steps+1))   # create a storage array for X=[I,S,R]^T
t_arr[0] = t_init                 # add the initial t to the storage array
X_arr[0,0] = I_init               # add the initial I to the storage array
X_arr[1,0] = S_init               # add the initial S to the storage array
X_arr[2,0] = R_init               # add the initial R to the storage array

beta = 25 * 10**(-4)   #5 * 10**(-5) #50 * 10**(-6) #25 * 10**(-4) #50 * 10**(-6) #25 * 10**(-5) #25*10**(-6) #0.001
alpha = 167 * 10**(-3) #500 * 10**(-3) # #167*10**(-3) #0.05
mu = 0.1

# Euler's method

for i in range (1, n_steps + 1):
    t = t_arr[i-1]                 # load the time
    I = X_arr[0,i-1]               # load the value of I
    S = X_arr[1,i-1]               # load the value of S
    R = X_arr[2,i-1]               # load the value of R
    #print I, S, R
    X[0] = I                       # fill current state vector X=[I,S,R]^T
    X[1] = S
    X[2] = R
    dIdt = beta*S*I - alpha*I - mu*I      # calculate the derivative dI/dt
    dSdt = -beta*S*I + mu*N - mu*S               # calculate the derivative dS/dt
    dRdt = alpha*I - mu*R                 # calculate the derivative dR/dt
    dXdt[0] = dIdt                 # fill derivative vector dX/dt
    dXdt[1] = dSdt         
    dXdt[2] = dRdt         
    Xnew = X + Dt*dXdt             # calculate X on next time step
    X_arr[:,i] = Xnew              # store Xnew 
    t_arr[i] = t + Dt              # store new t-value 
    #print t, Xnew

tolerance = 1e-6
indices = np.where(abs(X_arr[0,:]-0)<tolerance) 
#print(indices[0][0])
#print(t_arr[indices[0][0]])
	
# Plot the results

fig = plt.figure()
plt.plot(t_arr, X_arr[0,:], linewidth = 4, label="I(t)")  # plot I vs. time
plt.plot(t_arr, X_arr[1,:], linewidth = 4, label="S(t)")  # plot S vs. time
plt.plot(t_arr, X_arr[2,:], linewidth = 4, label="R(t)")  # plot R vs. time

plt.title(r'$\beta=$' + str(beta) + r', $\alpha=$' + str(alpha) + r', $\frac{1}{R_0}=\frac{\alpha}{\beta}=$' + str(round(alpha/beta,2)) + ', S(0)=' + str(S_init) + ', I(0)=' + str(I_init) + ', R(0)=' + str(R_init), fontsize = 10)  # set title
#plt.title(r'dS(t)/dt = -$\beta$ S(t)I(t), dI(t)/dt = $\beta$ S(t)I(t) - $\alpha$ t, dR(t)/dt = $\alpha$ I(t), $\beta=$' + str(beta) + r' $\alpha=$' + str(alpha) + r' 1/R_0=' + str(round(alpha/beta,2)) + ' S(0)=' + str(S_init), fontsize = 10)  # set title
plt.xlabel('t (in days)', fontsize = 10)   # name of horizontal axis
plt.ylabel('S(t), I(t) and R(t)', fontsize = 10) # name of vertical axis

plt.xticks(fontsize = 10)               # adjust the fontsize
plt.yticks(fontsize = 10)               # adjust the fontsize
plt.axis([0, 100, 0, 4500])             # set the range of the axes

plt.legend(fontsize=10)                 # show the legend
plt.show()                              # necessary for some platforms

# save the figure as .jpg (other formats: png, pdf, svg, (ps, eps))
fig.savefig('SIR_epidemic.jpg', dpi=fig.dpi, bbox_inches = "tight")

