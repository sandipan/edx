# import sympy  
from sympy import * 
  
#M = Matrix([[1, 0, 1, 3], [2, 3, 4, 7], [-1, -3, -3, -4]]) 
#M = Matrix([[0, 0, -2, 0, 7, 12], [2, 4, -10, 6, 12, 28], [2, 4, -5, 6, -5, -1]]) 
#M = Matrix([[-3, 6, 1, -1, 7], [1, -2, 2, 3, -1], [2, -4, 5, 8, -4]]) 
M = Matrix([[1, 3, 2], [-1, 1, -2], [2, 3, 4]]) 
print("Matrix : {} ".format(M)) 
   
# Use sympy.rref() method  
M_rref = M.rref()   
print("Matrix RREF : {} ".format(M_rref)) 
   
import numpy as np
D = np.array([[7,2,1],[0,3,-1],[-3,4,-2]])
print(np.linalg.inv(D))
b = [21, 5, -1]
print(np.linalg.solve(D, b))


# Not necessary but gives nice-looking latex output
# More info at: http://docs.sympy.org/latest/tutorial/printing.html
#init_printing()

n = 1024
M = np.array([[1,1,1], [1,0,0], [0,1,0]])
[x, y, z], V  = np.linalg.eig(M)
#print(x, y, z, V)
c1 = (1-y)*(1-z) / ((x-y)*(x-z))
c2 = (1-x)*(1-z) / ((y-x)*(y-z))
c3 = (1-x)*(1-y) / ((z-x)*(z-y))
#print(c1, c2, c3)
n = 1024
C1, C2 = c1*x**n, c2*y**n + c3*z**n
Gn = C1 + C2
#print(C1, C2, np.log(Gn) / n)

m = np.array([[x**2, y**2, z**2], [x, y, z], [1, 1, 1]])
S = m
S_1 = np.linalg.inv(S)
G = np.array([[1.], [1.], [1.]])
for i in range(n-2):
	#D = np.diag([x**(n-2),y**(n-2),z**(n-2)])
	G = M@G #(S@D@S_1@np.array([[1],[1],[1]]))[0]
#print(G)
G_n = G[0]
#print(np.log(G_n)/n)
#lnGn = np.log(m) + np.log()
#x, y, z = symbols('x y z')
#matrix2 = Matrix([[x**3, y**3, z**3], 
#                     [x**2, y**2, z**2],
#					 [x, y, z]])
#matrix = Matrix([[x**2, y**2, z**2], 
#                     [x, y, z],
#					 [1, 1, 1]])
#print(matrix.inv())

n = 10**13
logGn  = np.log(c1) + n*np.log(x)
logGn_n  = np.log(c1)/n + np.log(x)
#print(np.log(c1)/n, logGn / n, logGn_n, np.log(x), x)

#print((-201+np.sqrt(401))/200, (-201-np.sqrt(401))/200)

#print(np.linalg.eig([[-101/100, 1/100], [1, -1]]))
import scipy.linalg

A = np.array([[-2,1],[1,-2]])
print(np.exp(A), scipy.linalg.expm(A))
e1, e3 = np.exp(-1), np.exp(-3)
#print([[(e1+e3)/2, (e1-e3)/2], [(e1-e3)/2, (e1+e3)/2]])
s = 1/np.sqrt(2)
#print(np.array([[s, -s], [s, s]])@np.diag([np.exp(-1), np.exp(-3)])@np.linalg.inv(np.array([[s, -s], [s, s]])))
λ, X = np.linalg.eig(A)
print(X @ np.diag(np.exp(λ)) @ np.linalg.inv(X))

#print(13/np.sqrt(38))
#print(np.linalg.eig(np.array([[0,1,0],[0,0,1],[-2,1,2]])))

#print(np.sqrt(-np.linalg.eig(np.array([[-101/100,1/100],[1,-1]]))[0]))

m1, k1, b1, m2, k2, b2 = 1, 1, 0.001, 0.05, 1, 0.01
L, V = np.linalg.eig(np.array([[0,0,1,0], [0,0,0,1], [-(k1+k2)/m1, k2/m1, -(b1+b2)/m1, b2/m1], [k2/m2, -k2/m2, b2/m2, -b2/m2]]))
print(np.real(L))
print(np.imag(L))
print(np.imag(L)*V)