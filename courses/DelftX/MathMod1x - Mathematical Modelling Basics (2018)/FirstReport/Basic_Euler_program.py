# Program      : Euler's method
# Author       : MOOC team Mathematical Modelling Basics
# Created      : April, 2017

import numpy as np
import matplotlib.pyplot as plt
from math import pi

print("Solution for dI/dt = kI(N-I)")	# in Python 2.7: use no brackets

# Plot the results

fig = plt.figure()                      # create figure

# Initializations

#Dt = 0.25 #0.5	#1.	#0.1	                # timestep Delta t
N = 4500
k = 25*1e-6 #29*1e-6 #25*1e-6
#for k in np.linspace(0.249,0.25,100):	
#	for Dt in [0.1/16]: #[0.1, 0.1/2, 0.1/4, 0.1/8, 0.1/16]: #[1/pi,1/4.,1/8.]: #1,1/2.,

Dt = 1/512. #1/2.
imax = 67 #78
#while Dt > 1./2**10:
for I_init in [1] + list(range(5, 25, 5)):
	#I_init = 10                              # initial population 
	t_init = 0                              # initial time
	t_end = 360 #250 #360 #110 #25 #60                # stopping time
	n_steps = int(round((t_end-t_init)/Dt)) # total number of timesteps

	t_arr = np.zeros(n_steps + 1)           # create an array of zeros for t
	I_arr = np.zeros(n_steps + 1)           # create an array of zeros for P
	t_arr[0] = t_init                       # add the initial P to the array
	I_arr[0] = I_init                       # add the initial t to the array

	# Euler's method
	for i in range (1, n_steps + 1):
		I = I_arr[i-1]
		t = t_arr[i-1]
		dIdt = k*I*(N-I)          # calculate the derivative 
		#print t, dXdt
		I_arr[i] = I + Dt*dIdt              # calculate P on the next time step
		t_arr[i] = t + Dt                   # adding the new t-value to the list

	#print Dt, k, I_arr[20/Dt]
	#print Dt, X_arr[int(1.5/Dt)]
	#if Dt < 1:
		#diff_arr = [abs(I_arr[2*i] - p_arr[i]) for i in range(p_arr.shape[0])]
		#imax = np.argmax(diff_arr)
		#print(imax, diff_arr[imax]) #np.amax(diff_arr))
	#	print Dt, p_arr[imax], I_arr[2*imax], abs(p_arr[imax]-I_arr[2*imax])
	#	imax *= 2
		
	#plt.plot(t_arr, I_arr, linewidth = 2, label='I(t), Dt = ' + str(Dt))   # plot population vs. time
	plt.plot(t_arr, I_arr, linewidth = 2, label='I(t), I(0) = ' + str(I_init))   # plot population vs. time
	#Dt /= 2.
	#p_arr = I_arr
	indices = np.where(abs(I_arr-4500)<1e-6)
	print(t_arr[indices[0][0]])

	
#print(max(I_arr))
indices = np.where(abs(I_arr-4500)<1e-6)
#print(indices[0][0])
print(t_arr[indices[0][0]])

#plt.axvline(x=67, color='brown', label = 't = 67')
plt.xlabel('t (time in days)')
plt.ylabel('I(t) (number of infected persons in thound persons)')
plt.grid(True)                          # show grid 
plt.legend()
plt.show()

'''
#plt.axvline(x=1.5, color='brown', label = 't = 1.5')

plt.title(r'dI/dt = \beta I(1000-I), I(0)=1', fontsize = 15)  
plt.xlabel('t (in days)', fontsize = 10)
plt.ylabel('P(t) (in persons)', fontsize = 10)
plt.legend()

plt.xticks(fontsize = 15)
plt.yticks(fontsize = 15)
plt.grid(True)                          # show grid 
plt.axis([0, 100, 0, 500])               # define the axes
plt.show()                              # show the plot
# save the figure as .jpg
fig.savefig('epidemic.jpg', dpi=fig.dpi, bbox_inches = "tight")
'''