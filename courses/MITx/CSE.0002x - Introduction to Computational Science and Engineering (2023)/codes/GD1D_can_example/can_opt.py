import numpy as np
import matplotlib.pyplot as plt
import gd1

def calc_S(r):
    return 2*np.pi*r**2 + 2*V/r
    
def calc_dS(r):
    return 4*np.pi*r - 2*V/r**2
    
def calc_d2S(r):
    return 4*np.pi   + 4*V/r**3



V = 800. # cm^3

r = np.linspace(1,10,1001)

h = V/(np.pi*r**2)

S = calc_S(r)

fig, ax = plt.subplots(nrows=2, ncols=1, sharex=True)
ax[0].plot(r,S)
ax[0].set_ylabel('S (cm$^2$)')
ax[0].set_xticks(np.arange(1,10.1,1.))
ax[0].grid(True)
ax[1].plot(r,h)
ax[1].set_xlabel('r (cm)')
ax[1].set_ylabel('h (cm)')
ax[1].grid(True)
plt.show()

imin = S.argmin()
Smin = S[imin]
rmin = r[imin]
hmin = h[imin]

print(f"Minimum S = {Smin:.1f} cm^2 with (r,h)=({rmin:.2f},{hmin:.2f}) cm") 

# dSdr   = calc_dS(r)
# d2Sdr2 = calc_d2S(r)

# figdS, axdS = plt.subplots(nrows=2, ncols=1, sharex=True)
# axdS[0].plot(r,dSdr)
# axdS[0].set_ylabel('$dS/dr$ (cm)')
# axdS[0].set_xticks(np.arange(1,10.1,1.))
# axdS[0].grid(True)
# axdS[1].plot(r,d2Sdr2)
# axdS[1].set_xlabel('r (cm)')
# axdS[1].set_ylabel('$d^2 S/dr^2$')
# axdS[1].grid(True)

# rstart = 1.0
# alpha = 6.0e-2
# nStop = 100
# rhist, Jhist = gd1.gd(calc_S, calc_dS, rstart, alpha, nStop)

# fighist, axhist = plt.subplots(nrows=2, ncols=1, sharex=True)
# axhist[0].scatter(range(nStop), Jhist)
# axhist[0].set_ylabel('J')
# axhist[0].grid(True)
# axhist[1].scatter(range(nStop), rhist)
# axhist[1].set_xlabel('Iteration')
# axhist[1].set_ylabel('r')
# axhist[1].grid(True)


