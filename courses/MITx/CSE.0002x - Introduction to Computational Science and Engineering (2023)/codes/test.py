#A = [ [1,2,3], [4,5,6] ]
#print(A[0][:])
#print(A[:][0])
#print(A[:,0])
#print(A[0,:])


import matplotlib.pyplot as plt
import numpy as np

# Data for plotting
x = np.linspace(0.0, 1.0, 31)
f1 = x
f2 = x**2

# plotting
fig = plt.figure()
plt.plot(x, f1, color='r', marker='o', linestyle='-', label='f(x)=x')
plt.plot(x, f2, color='b', marker='x', linestyle='-.', label='f(x)=x^2')
plt.xlabel('x label')
plt.ylabel('y label')
plt.title('Our first plot!')

# draw the grid on the figure
plt.grid()

# create the legend
plt.legend()

# save the figure to a file you can then send to your friends
fig.savefig("pyplotexampleplot.png")

# display the figure
plt.show()

plt.figure()

'''
# the arguments to subplot are
# plt.subplot("number of rows", "number of columns", "subplot index")

# this is the "first" subplot. all the plotting commands below are restricted to this scope.
plt.subplot(2,1,1)
plt.scatter(t,Tc,marker='o',label='numerical')

# we enclose in $$ to use LaTeX, don't worry about this
plt.ylabel('$T_c$ (C)')
plt.grid(True)

plt.scatter(t,u,marker='x',label='exact')
plt.title('$\Delta t$ = 50 min')
plt.legend()

# this is the "second" subplot. all the plotting commands below are restricted to this scope.
plt.subplot(2,1,2)
plt.scatter(t,e,marker='o')
plt.xlabel('t (min)')
plt.ylabel('error (C)')
plt.grid(True)
'''

import matplotlib.pyplot as plt
import numpy as np

N_points = 100000
n_bins = 20

# Generate a normal distribution centered at x=0
rng = np.random.default_rng()
x = rng.normal(0., 1., N_points)

# plt.subplot("number of rows", "number of columns", "subplot index")
plt.subplot(1,2,1)

# We can set the number of bins with the `bins` kwarg
plt.hist(x, bins=n_bins)
plt.ylabel("Count")
plt.xlabel("Data")

plt.subplot(1,2,2)
plt.hist(x, density=True, bins=n_bins)
plt.ylabel("Density")
plt.xlabel("Data")
plt.show()

h, A, To, Tc, mc, cc = 5, 0.04, 25, 40, 0.35, 4200
h*A*(To-Tc) / mc / cc

h, A, To, Tc, mc, cc = 5, 0.04, 5, 40, 0.35, 4200
h*A*(To-Tc) / mc / cc

a, b, c, m, r, f = 2, 0.01, 0.1, 1, 500, 100
a*r - b*r*f
-m*f + c*b*r*f

a, b, c, m, r, f = 2, 0.01, 0.1, 1, 500, 350
a*r - b*r*f
-m*f + c*b*r*f

def evalf(u, t):
    """
    args:
        u (float list): current state with u[0] = v and u[1] = w
        t (float): current time

    returns:
        float list for forcing f, where du/dt = f(u, t)
    """
    # unpack state list
    v = u[0]
    w = u[1]

    #### BEGIN SOLUTION ####
    #raise NotImplementedError("Calculate and return the f vector in terms of v and w")
    return [-100*v + w + t, -v + 2*w - t**3]
    #### END SOLUTION ####

#print(evalf([1,1], 0))

import numpy as np
t = np.array([0.01, 0.02, 0.04, 0.08, 0.16]) #np.logspace(0.1, 0.16, 5, base=2)
At = np.array([193.21, 193.28, 193.84, 198.32, 234.16])
Bt = np.array([192.96, 192.72, 192.24, 191.28, 189.36])
Ct = 193.0
lEAt = np.log(np.abs(At-Ct))
lEBt = np.log(np.abs(Bt-Ct))
lt = np.log(t)
#python -m pip install scikit-learn
from sklearn.linear_model import LinearRegression
print(LinearRegression().fit(lt.reshape(-1,1), lEAt).coef_, LinearRegression().fit(lt.reshape(-1,1), lEBt).coef_)


def step_RK2_HEUN(evalf, dt, vn, tn):
    """
    Takes a single timestep of the Heun version of a 2nd order
    Runge-Kutta method (RK2_ME) to integrate the state from vn (at time tn)
    to vn1 (at time tn1 = tn + dt).

    Args:
        evalf (function reference): the referenced function has inputs of
            a state vector (v) and time (t) and returns the forcing f(v, t).
            v and f are float lists.
        dt (float): time increment
        vn (float list): current state
        tn (float): current time

    Returns:
        float list: next state, i.e. vn1
    """
    #### BEGIN SOLUTION ####
        
    # compute RHS for the a vector
    ta = tn
    va = vn
    fa = evalf(va, ta)
    # compute the a vector
    a = []
    for i in range(len(vn)):
        a.append(dt*fa[i])

    # compute RHS for the b vector
    tb = tn + dt
    vb = []
    for i in range(len(vn)):
        vb.append(vn[i] + a[i])
    fb = evalf(vb, tb)
    # compute the b vector
    b = []
    for i in range(len(vn)):
        b.append(dt*fb[i])

    # compute the next step
    vn1 = []
    for i in range(len(vn)):
        vn1.append(vn[i] + 0.5*(a[i] +  b[i]))
    return vn1
    #### END SOLUTION ####

import numpy as np


def create_seq():
    """
    Returns: a numpy ndarray containing 0., 0.01, 0.02, ... 0.98, 0.99, 1.
    """
    #### BEGIN SOLUTION ####
    return np.linspace(0,1,101)
    #### END SOLUTION ####

print(create_seq()) 

import numpy as np

u = np.array([1, 2, 3])
v = np.array([4, 5, 6])
w = np.array([u[0]+v[0], u[1]+v[1], u[2]+v[2]]) # i.e. w = [5,7,9]

print( u+v == w )

import numpy as np

u = np.array([1, 2, 3])
v = np.array([2*u[0], 2*u[1], 2*u[2]]) # i.e. v = [2,4,6]

print( v == 2*u )

import numpy as np
A = np.array( [ [1,2,3], [4,5,6] ] )

A[1][1]
A[1,1]

import numpy as np
A = np.array( [ [1,2,3], [4,5,6] ] )

A[0][:]
A[:][0]
A[0,:]
A[:,0]

import numpy as np
un = np.array([1.0, 2.0])
fn = np.array([0.0, 1.0])
dt = 2.0
un1 = un + dt*fn
print(un1)

A = np.array([[-6,1,0],[1,-6,1],[0,1,-6]])
b = np.array([4,8,16])
np.linalg.solve(A, -b)

import numpy as np


def create_A():
    """
    Returns: a numpy ndarray representing the matrix specified in the exercise
    """
    #### BEGIN SOLUTION ####
    return np.array([[1,-1,0],[-1,2,-1],[0,-1,2]])
    #### END SOLUTION ####

import numpy as np


def give_x():
    """
    Returns: a numpy ndarray containing the solution to Ax = b,
        for A and x given in the exercise
    """
    #### BEGIN SOLUTION ####
    #raise NotImplementedError("Create and return the specified numpy ndarray")
    A = np.array([[1,-1,0],[-1,2,-1],[0,-1,2]])
    b = np.ones(3)
    return np.linalg.solve(A, b)
    #### END SOLUTION ####

    
#print(give_x())

from matplotlib.colors import LinearSegmentedColormap

colormap = LinearSegmentedColormap.from_list('custom', 
                                       [(0, '#00ff00'),
                                        (1,   '#ff0000')], N=256)
K1, K2, C = 1, 2, 20
x, y = np.linspace(1,20,100), np.linspace(1,20,100)
X, Y = np.meshgrid(x, y)
ax = plt.axes(projection='3d')
Z = np.sqrt(K1+X)+np.sqrt(K2+Y)
ax.plot_surface(X, Y, Z, cmap='jet', alpha=0.3)
ax.plot_wireframe(X, Y, Z, rstride=5, cstride=5, alpha=0.2)
#x, y = np.linspace(5,12,100), np.linspace(5,12,100)
X, Y = np.meshgrid(x, y)
Z = X+Y-C
ax.plot_surface(X, Y, Z, cmap='Reds', alpha=0.3)
s1, s2 = (K2-K1)/2 + C/2, (K1-K2)/2 + C/2
Z = np.sqrt(K1+s1)+np.sqrt(K2+s2)
print(s1, s2, Z)
ax.scatter(s1,s2,Z,s=100)
ax.set_zlim(np.sqrt(K1)+np.sqrt(K2)-0.1, np.sqrt(K1+20)+np.sqrt(K2+20)+0.1)
#ax.scatter*
plt.show()


import numpy as np

for i in range(4):
    rng = np.random.default_rng(0)
    v = rng.uniform(1,2)
    print("{:.8f}".format(v))