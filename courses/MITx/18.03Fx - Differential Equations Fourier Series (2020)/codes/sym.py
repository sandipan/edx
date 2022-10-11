from sympy import Matrix
#from sympy.abc import x, y, z
from sympy.solvers.solvers import solve_linear_system_LU

'''
print(solve_linear_system_LU(Matrix([
	[1, 2, 0, 1],
	[3, 2, 2, 1],
	[2, 0, 0, 1]]), [x, y, z]))
'''	

#from sym.abc import a, b, c, d, q
	
#def solve(pol):
#	pass

from sympy import Symbol
from sympy.solvers import solve, nsolve 
from sympy import sin

A = Symbol('A')
B = Symbol('B')
K = Symbol('K')
L = Symbol('L')
#print(solve(K*sin(K*L)+A*B/(A*A+B*B), K))
print(nsolve(K*sin(K*L)+A*B/(A*A+B*B), K, 1))


# matlab
# syms A B K L
# eqn = K*sin(K*L)+A*B/(A*A+B*B) == 0
# SK = solve(eqn,K)

Critical load with different boundary conditions: numerical solution need help
discussion posted 4 minutes ago by sandipan_dey

Substitution gave me a solution of the form

f(K)*sin(g(K,L)) = h(A,B)
where f, g and h are some functions (just don't want to reveal the solution).

Tried to get a numerical solution for K using matlab and python (symbolic computation package with sympy), but none of them could solve.

Just wanted to check if I am doing some silly mistake / on the right track, thanks in advance.