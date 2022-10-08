'''
Minimize: f = -1*x[0] + 4*x[1]

Subject to: -3*x[0] + 1*x[1] <= 6
1*x[0] + 2*x[1] <= 4
x[1] >= -3
where: -inf <= x[0] <= inf

c = [-1, 4]
A = [[-3, 1], [1, 2]]
b = [6, 4]
x0_bounds = (None, None)
x1_bounds = (-3, None)
from scipy.optimize import linprog
res = linprog(c, A_ub=A, b_ub=b, bounds=(x0_bounds, x1_bounds), options={"disp": True})
print(res)
'''

## Week 2

'''
c = [-58,-70]
A = [[50,73],[23,10],[19,14]]
b = [9300,3070,1970]
x0_bounds = (0, None)
x1_bounds = (0, None)
from scipy.optimize import linprog
res = linprog(c, A_ub=A, b_ub=b, bounds=(x0_bounds, x1_bounds), options={"disp": True})
print(res)
'''

# Week 3
'''
import numpy as np
c = [60,50,43,49,64,63,71,44,62,58]
A = np.zeros((5,10))
A[0,:2] = -1
A[1,2:4] = -1
A[2,4] = A[2,7] = 1
A[3,5] = A[3,8] = 1
A[4,6] = A[4,9] = 1
b = [-1000,-800,500,300,1000]
Aeq = np.zeros((2,10))
Aeq[0,0]=Aeq[0,2]=1
Aeq[0,4]=Aeq[0,5]=Aeq[0,6]=-1
Aeq[1,1]=Aeq[1,3]=1
Aeq[1,7]=Aeq[1,8]=Aeq[1,9]=-1
beq = [0,0]
from scipy.optimize import linprog
res = linprog(c, A_ub=A, b_ub=b, A_eq=Aeq, b_eq=beq, bounds=[(0, None)]*10, options={"disp": True})
print(res)
'''

import pulp
my_lp_problem = pulp.LpProblem("My LP Problem", pulp.LpMinimize)
xAB = pulp.LpVariable('xAB', lowBound=0, cat='Integer')
xAI = pulp.LpVariable('xAI', lowBound=0, cat='Integer')
xPB = pulp.LpVariable('xPB', lowBound=0, cat='Integer')
xPI = pulp.LpVariable('xPI', lowBound=0, cat='Integer')
xHB = pulp.LpVariable('xHB', lowBound=0, cat='Integer')
xHI = pulp.LpVariable('xHI', lowBound=0, cat='Integer')
# Objective function
my_lp_problem += 16700 * xAB + 15700 * xAI + 9540 * xPB + 8980 * xPI + 8870 * xHB + 9670 * xHI, "C"
# Constraints
my_lp_problem += xAB + xAI <= 4800
my_lp_problem += xPB + xPI <= 4700
my_lp_problem += xHB + xHI <= 1100
my_lp_problem += xAB + xPB + xHB >= 4100
my_lp_problem += xAI + xPI + xHI >= 5400
my_lp_problem
my_lp_problem.solve()
pulp.LpStatus[my_lp_problem.status]
for variable in my_lp_problem.variables():
    print "{} = {}".format(variable.name, variable.varValue)
print pulp.value(my_lp_problem.objective)
	

