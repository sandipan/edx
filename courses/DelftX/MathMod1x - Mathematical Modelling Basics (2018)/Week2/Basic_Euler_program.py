# Program      : Euler's method
# Author       : MOOC team Mathematical Modelling Basics
# Created      : April, 2017

import numpy as np
import matplotlib.pyplot as plt

print("Solution for dP/dt = 0.7P(1-P/750)-20")	# in Python 2.7: use no brackets

# Plot the results

fig = plt.figure()                      # create figure

# Initializations

#Dt = 0.25 #0.5	#1.	#0.1	                # timestep Delta t

for Dt in [0.03125, 0.0625, 0.125, 0.25, 0.5, 1, 2]:

	P_init = 30                             # initial population 
	t_init = 0                              # initial time
	t_end = 420 #110 #25 #60                # stopping time
	n_steps = int(round((t_end-t_init)/Dt)) # total number of timesteps

	t_arr = np.zeros(n_steps + 1)           # create an array of zeros for t
	P_arr = np.zeros(n_steps + 1)           # create an array of zeros for P
	t_arr[0] = t_init                       # add the initial P to the array
	P_arr[0] = P_init                       # add the initial t to the array

	# Euler's method

	for i in range (1, n_steps + 1):
	
		P = P_arr[i-1]
		t = t_arr[i-1]
		dPdt = 0.7*P*(1-P/750.)-20          # calculate the derivative 
		#print t, dPdt
		P_arr[i] = P + Dt*dPdt              # calculate P on the next time step
		t_arr[i] = t + Dt                   # adding the new t-value to the list

	#print P_arr[1], P_arr[13], P_arr[26], P_arr[52], P_arr[104], P_arr[208], P_arr[416]
	# 407.249555625 - 363.094585294
	indices = np.where(P_arr>=720)
	#print indices[:5], map(lambda x:x/32., indices[:5]), P_arr[indices[:5]]
	print Dt, indices[0][0] * Dt, P_arr[indices[0][0]]
	
	plt.plot(t_arr, P_arr, linewidth = 4, label='Dt = ' + str(Dt))   # plot population vs. time

plt.axvline(x=13, color='brown', label = 't = 13')

plt.title('dP/dt = 0.7P(1-P/750)-20, P(0)=30', fontsize = 15)  
plt.xlabel('t (in days)', fontsize = 10)
plt.ylabel('P(t)', fontsize = 10)
plt.legend()

plt.xticks(fontsize = 15)
plt.yticks(fontsize = 15)
plt.grid(True)                          # show grid 
plt.axis([0, 25, 0, 800])                # define the axes
plt.show()                              # show the plot
# save the figure as .jpg
fig.savefig('Rainbowfish.jpg', dpi=fig.dpi, bbox_inches = "tight")