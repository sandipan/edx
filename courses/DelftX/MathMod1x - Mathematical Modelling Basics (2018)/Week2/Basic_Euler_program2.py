# Program      : Euler's method
# Author       : MOOC team Mathematical Modelling Basics
# Created      : April, 2017

import numpy as np
import matplotlib.pyplot as plt
from math import pi

print("Solution for dX/dt = kX(1-X)")	# in Python 2.7: use no brackets

# Plot the results

fig = plt.figure()                      # create figure

# Initializations

#Dt = 0.25 #0.5	#1.	#0.1	                # timestep Delta t
k = 3
for k in np.linspace(0.249,0.25,100):	
	for Dt in [0.1/16]: #[0.1, 0.1/2, 0.1/4, 0.1/8, 0.1/16]: #[1/pi,1/4.,1/8.]: #1,1/2.,

		X_init = 0.02                           # initial population 
		t_init = 0                              # initial time
		t_end = 20 #110 #25 #60                # stopping time
		n_steps = int(round((t_end-t_init)/Dt)) # total number of timesteps

		t_arr = np.zeros(n_steps + 1)           # create an array of zeros for t
		X_arr = np.zeros(n_steps + 1)           # create an array of zeros for P
		t_arr[0] = t_init                       # add the initial P to the array
		X_arr[0] = X_init                       # add the initial t to the array

		# Euler's method
		for i in range (1, n_steps + 1):
			X = X_arr[i-1]
			t = t_arr[i-1]
			dXdt = k*X*(1-X)          # calculate the derivative 
			#print t, dXdt
			X_arr[i] = X + Dt*dXdt              # calculate P on the next time step
			t_arr[i] = t + Dt                   # adding the new t-value to the list

		print k, X_arr[20/Dt]
		#print Dt, X_arr[int(1.5/Dt)]
		
		#plt.plot(t_arr, X_arr, linewidth = 4, label='Dt = ' + str(Dt))   # plot population vs. time

'''
plt.axvline(x=1.5, color='brown', label = 't = 1.5')

plt.title('dX/dt = kX(1-X), X(0)=0.02', fontsize = 15)  
plt.xlabel('t (in days)', fontsize = 10)
plt.ylabel('P(t)', fontsize = 10)
plt.legend()

plt.xticks(fontsize = 15)
plt.yticks(fontsize = 15)
plt.grid(True)                          # show grid 
plt.axis([0, 10, 0, 1.2])                # define the axes
plt.show()                              # show the plot
# save the figure as .jpg
fig.savefig('Rainbowfish.jpg', dpi=fig.dpi, bbox_inches = "tight")
'''