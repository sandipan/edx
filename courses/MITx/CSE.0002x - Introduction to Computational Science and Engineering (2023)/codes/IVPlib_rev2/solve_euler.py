import matplotlib.pyplot as plt
import math

from IVPlib_rev2 import IVP

class twostate_IVP(IVP):
    def evalf(self, u, t):
        """        
        Args:
            Tc (float list): current temperature of coffee.
            t (float): current time
    
        Returns:
            f (float list): returns dTc/dt
        """
        v, w = u
        return [-100*v+w+t, -v+2*w-t**3]


def solve_euler(twostate_IVP, dt):
    # Sets initial condition
    t0 = twostate_IVP.get_tI()
    tF = twostate_IVP.get_tF()
    v0, w0 = twostate_IVP.get_uI()

    t = [t0]
    v, w = [v0], [w0]
    
    # Loop from from t=t0 to t>=tF
    tn = t[0]
    vn, wn = v[0], w[0]

    while (tn<tF):
        # Calculate forcing
        fn = twostate_IVP.evalf([vn, wn],tn)
        
        # Update solution and time
        vn1, wn1 = vn + dt*fn[0], wn + dt*fn[1]
        tn1 = tn + dt
       
        # Append to v and t
        v.append(vn1)
        w.append(wn1)
        t.append(tn1) # store time in minutes
        
        # Set vn and tn for next iteration
        vn, wn = vn1, wn1
        tn = tn1
    
    return t, v, w

dt = 0.1

ivp = twostate_IVP([0, 1], 1, 1.3, {})

# Solve coffee IVP
t, v, w = solve_euler(ivp, dt)
#   print(t, v, w)

# Plot   
fig, (ax1, ax2) = plt.subplots(1,2)
ax1.scatter(t,v,marker='o',label='v')
ax1.set_xlabel('t (min)')
ax1.set_ylabel('v')
ax1.grid(True)
    
ax2.scatter(t,w,marker='x',label='w')
ax2.set_xlabel('t (min)')
ax2.set_ylabel('w')
ax2.grid(True)

plt.show()
