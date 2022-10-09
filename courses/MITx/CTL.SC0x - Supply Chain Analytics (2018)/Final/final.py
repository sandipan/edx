'''
# Problem 1
x = 100000
y = -127000 + 18*x
print y - 1270000

x = 127000
y = -127000 + 18*x
print y - 1270000
'''

# Problem 2
import pulp
my_lp_problem = pulp.LpProblem("My LP Problem", pulp.LpMinimize)
xTA = pulp.LpVariable('xTA', lowBound=0, cat='Integer')
xTT = pulp.LpVariable('xTT', lowBound=0, cat='Integer')
xTM = pulp.LpVariable('xTM', lowBound=0, cat='Integer')
xRA = pulp.LpVariable('xRA', lowBound=0, cat='Integer')
xRT = pulp.LpVariable('xRT', lowBound=0, cat='Integer')
xRM = pulp.LpVariable('xRM', lowBound=0, cat='Integer')
xIA = pulp.LpVariable('xIA', lowBound=0, cat='Integer')
xIT = pulp.LpVariable('xIT', lowBound=0, cat='Integer')
xIM = pulp.LpVariable('xIM', lowBound=0, cat='Integer')
xMA = pulp.LpVariable('xMA', lowBound=0, cat='Integer')
xMT = pulp.LpVariable('xMT', lowBound=0, cat='Integer')
xMM = pulp.LpVariable('xMM', lowBound=0, cat='Integer')
xAM = pulp.LpVariable('xAM', lowBound=0, cat='Integer')
xAN = pulp.LpVariable('xAN', lowBound=0, cat='Integer')
xAS = pulp.LpVariable('xAS', lowBound=0, cat='Integer')
xAC = pulp.LpVariable('xAC', lowBound=0, cat='Integer')
yTM = pulp.LpVariable('yTM', lowBound=0, cat='Integer')
xTN = pulp.LpVariable('xTN', lowBound=0, cat='Integer')
xTS = pulp.LpVariable('xTS', lowBound=0, cat='Integer')
xTC = pulp.LpVariable('xTC', lowBound=0, cat='Integer')
yMM = pulp.LpVariable('yMM', lowBound=0, cat='Integer')
xMN = pulp.LpVariable('xMN', lowBound=0, cat='Integer')
xMS = pulp.LpVariable('xMS', lowBound=0, cat='Integer')
xMC = pulp.LpVariable('xMC', lowBound=0, cat='Integer')
yA = pulp.LpVariable('yA', lowBound=0, upBound=1, cat='Binary')
yT = pulp.LpVariable('yT', lowBound=0, upBound=1, cat='Binary')
yM = pulp.LpVariable('yM', lowBound=0, upBound=1, cat='Binary')
zT = pulp.LpVariable('zT', lowBound=0, upBound=1, cat='Binary')
zR = pulp.LpVariable('zR', lowBound=0, upBound=1, cat='Binary')
zI = pulp.LpVariable('zI', lowBound=0, upBound=1, cat='Binary')
zM = pulp.LpVariable('zM', lowBound=0, upBound=1, cat='Binary')

# Objective function
my_lp_problem += 44 * xTA + 36 * xTT + 38 * xTM + 37 * xRA + 33 * xRT + 46 * xRM + 47 * xIA + 26 * xIT + 50 * xIM + 40 * xMA + 27 * xMT + 35 * xMM + 700 * yA + 500 * yT + 800 * yM + 43 * xAM + 21 * xAN + 42 * xAS + 36 * xAC + 35 * yTM + 43 * xTN + 15 * xTS + 34 * xTC + 30 * yMM + 45 * xMN + 23 * xMS + 47 * xMC + zT*540 + zR*580 + zI*200 + zM*480, "C"
# Constraints
my_lp_problem += xTA + xTT + xTM <= 38
my_lp_problem += xRA + xRT + xRM <= 23
my_lp_problem += xIA + xIT + xIM <= 27
my_lp_problem += xMA + xMT + xMM <= 36
my_lp_problem += xTA + xRA + xIA + xMA <= 40
my_lp_problem += xTT + xRT + xIT + xMT <= 49
my_lp_problem += xTM + xRM + xIM + xMM <= 34
my_lp_problem += xAM + yTM + yMM >= 9
my_lp_problem += xAN + xTN + xMN >= 6
my_lp_problem += xAS + xTS + xMS >= 27
my_lp_problem += xAC + xTC + xMC >= 18
my_lp_problem += xTA + xRA + xIA + xMA - xAM - xAN - xAS - xAC == 0
my_lp_problem += xTT + xRT + xIT + xMT - yTM - xTN - xTS - xTC == 0
my_lp_problem += xTM + xRM + xIM + xMM - yMM - xMN - xMS - xMC == 0
my_lp_problem += 10000.*yA - xTA - xRA - xIA - xMA >= 0  
my_lp_problem += 10000.*yT - xTT - xRT - xIT - xMT >= 0
my_lp_problem += 10000.*yM - xTM - xRM - xIM - xMM >= 0

my_lp_problem += 10000.*zT - xTA - xTT - xTM >= 0  
my_lp_problem += 10000.*zR - xRA - xRT - xRM >= 0
my_lp_problem += 10000.*zI - xIA - xIT - xIM >= 0
my_lp_problem += 10000.*zM - xMA - xMT - xMM >= 0
my_lp_problem
print my_lp_problem.valid()
my_lp_problem.solve()
pulp.LpStatus[my_lp_problem.status]
for variable in my_lp_problem.variables():
    print "{} = {}".format(variable.name, variable.varValue)
print pulp.value(my_lp_problem.objective)	

'''
# Problem 3
print 38 + 23 + 27 + 36
print 40 + 49 + 34
print 36 + 500 + 15
print 9 + 6 + 27 + 18
'''

# Problem 4



'''
# Problem 1
#Box#	1	2	3	4	5	6	7	8	9	10	11	12
#Weight (tons)	1.3	1.2	1.0	1.6	1.5	1.1	0.9	0.8	0.7	0.5	1.4	0.6
#Profit ($)	80	130	140	120	90	160	70	110	50	60	100	150
import pulp
my_lp_problem = pulp.LpProblem("My LP Problem", pulp.LpMaximize)
x1 = pulp.LpVariable('x1', lowBound=0, upBound = 1, cat='Integer')
x2 = pulp.LpVariable('x2', lowBound=0, upBound = 1, cat='Integer')
x3 = pulp.LpVariable('x3', lowBound=0, upBound = 1, cat='Integer')
x4 = pulp.LpVariable('x4', lowBound=0, upBound = 1, cat='Integer')
x5 = pulp.LpVariable('x5', lowBound=0, upBound = 1, cat='Integer')
x6 = pulp.LpVariable('x6', lowBound=0, upBound = 1, cat='Integer')
x7 = pulp.LpVariable('x7', lowBound=0, upBound = 1, cat='Integer')
x8 = pulp.LpVariable('x8', lowBound=0, upBound = 1, cat='Integer')
x9 = pulp.LpVariable('x9', lowBound=0, upBound = 1, cat='Integer')
x10 = pulp.LpVariable('x10', lowBound=0, upBound = 1, cat='Integer')
x11 = pulp.LpVariable('x11', lowBound=0, upBound = 1, cat='Integer')
x12 = pulp.LpVariable('x12', lowBound=0, upBound = 1, cat='Integer')
# Objective function
my_lp_problem += 80*x1+ 130*x2	+ 140*x3 + 	120*x4	+ 90*x5	+ 160*x6 +	70*x7 +	110*x8 +	50*x9	+ 60*x10 +	100*x11	+ 150*x12
# Constraints
my_lp_problem += 1.3*x1+ 1.2*x2	+ 1.0*x3 + 	1.6*x4	+ 1.5*x5	+ 1.1*x6 +	0.9*x7 +	0.8*x8 +	0.7*x9	+ 0.5*x10 +	1.4*x11	+ 0.6*x12 <= 6.5
my_lp_problem
my_lp_problem.solve()
pulp.LpStatus[my_lp_problem.status]
for variable in my_lp_problem.variables():
    print "{} = {}".format(variable.name, variable.varValue)
print pulp.value(my_lp_problem.objective)
'''

# Problem 2	
'''
print 32 +	19 +	31 +	23 +	13
print 25 +	25 +	47

import pulp
my_lp_problem = pulp.LpProblem("My LP Problem", pulp.LpMinimize)
xSM = pulp.LpVariable('xSM', lowBound=0, cat='Integer')
xSP = pulp.LpVariable('xSP', lowBound=0, cat='Integer')
xST = pulp.LpVariable('xST', lowBound=0, cat='Integer')
xBM = pulp.LpVariable('xBM', lowBound=0, cat='Integer')
xBP = pulp.LpVariable('xBP', lowBound=0, cat='Integer')
xBT = pulp.LpVariable('xBT', lowBound=0, cat='Integer')
xYM = pulp.LpVariable('xYM', lowBound=0, cat='Integer')
xYP = pulp.LpVariable('xYP', lowBound=0, cat='Integer')
xYT = pulp.LpVariable('xYT', lowBound=0, cat='Integer')
xWM = pulp.LpVariable('xWM', lowBound=0, cat='Integer')
xWP = pulp.LpVariable('xWP', lowBound=0, cat='Integer')
xWT = pulp.LpVariable('xWT', lowBound=0, cat='Integer')
xGM = pulp.LpVariable('xGM', lowBound=0, cat='Integer')
xGP = pulp.LpVariable('xGP', lowBound=0, cat='Integer')
xGT = pulp.LpVariable('xGT', lowBound=0, cat='Integer')

# Objective function
my_lp_problem += 56 * xSM + 80 * xSP + 56 * xST + 87 * xBM + 43 * xBP + 75 * xBT + 54 * xYM + 51 * xYP + 84 * xYT + 46 * xWM + 52 * xWP + 53 * xWT + 51 * xGM + 91 * xGP + 77 * xGT, "C"
# Constraints
my_lp_problem += xSM + xSP + xST <= 32
my_lp_problem += xBM + xBP + xBT <= 19
my_lp_problem += xYM + xYP + xYT <= 31
my_lp_problem += xWM + xWP + xWT <= 23
my_lp_problem += xGM + xGP + xGT <= 13
my_lp_problem += xSM + xBM + xYM + xWM + xGM >= 25
my_lp_problem += xSP + xBP + xYP + xWP + xGP >= 25
my_lp_problem += xST + xBT + xYT + xWT + xGT >= 47
my_lp_problem
my_lp_problem.solve()
pulp.LpStatus[my_lp_problem.status]
for variable in my_lp_problem.variables():
    print "{} = {}".format(variable.name, variable.varValue)
print pulp.value(my_lp_problem.objective)
'''

'''
import pulp
my_lp_problem = pulp.LpProblem("My LP Problem", pulp.LpMinimize)
xSD = pulp.LpVariable('xSD', lowBound=0, cat='Integer')
xSW = pulp.LpVariable('xSW', lowBound=0, cat='Integer')
xSN = pulp.LpVariable('xSN', lowBound=0, cat='Integer')
xBD = pulp.LpVariable('xBD', lowBound=0, cat='Integer')
xBW = pulp.LpVariable('xBW', lowBound=0, cat='Integer')
xBN = pulp.LpVariable('xBN', lowBound=0, cat='Integer')
xYD = pulp.LpVariable('xYD', lowBound=0, cat='Integer')
xYW = pulp.LpVariable('xYW', lowBound=0, cat='Integer')
xYN = pulp.LpVariable('xYN', lowBound=0, cat='Integer')
xWD = pulp.LpVariable('xWD', lowBound=0, cat='Integer')
xWW = pulp.LpVariable('xWW', lowBound=0, cat='Integer')
xWN = pulp.LpVariable('xWN', lowBound=0, cat='Integer')
xGD = pulp.LpVariable('xGD', lowBound=0, cat='Integer')
xGW = pulp.LpVariable('xGW', lowBound=0, cat='Integer')
xGN = pulp.LpVariable('xGN', lowBound=0, cat='Integer')
xDM = pulp.LpVariable('xDM', lowBound=0, cat='Integer')
xDP = pulp.LpVariable('xDP', lowBound=0, cat='Integer')
xDT = pulp.LpVariable('xDT', lowBound=0, cat='Integer')
xWM = pulp.LpVariable('xWM', lowBound=0, cat='Integer')
xWP = pulp.LpVariable('xWP', lowBound=0, cat='Integer')
xWT = pulp.LpVariable('xWT', lowBound=0, cat='Integer')
xNM = pulp.LpVariable('xNM', lowBound=0, cat='Integer')
xNP = pulp.LpVariable('xNP', lowBound=0, cat='Integer')
xNT = pulp.LpVariable('xNT', lowBound=0, cat='Integer')

# Objective function
my_lp_problem += 26 * xSD + 32 * xSW + 41 * xSN + 42 * xBD + 43 * xBW + 37 * xBN + 44 * xYD + 38 * xYW + 39 * xYN + 30 * xWD + 46 * xWW + 25 * xWN + 25 * xGD + 36 * xGW + 45 * xGN + 18 * xDM + 44 * xDP + 22 * xDT + 35 * xWM + 25 * xWP + 27 * xWT + 26 * xNM + 42 * xNP + 26 * xNT, "C"
# Constraints
my_lp_problem += xSD + xSW + xSN <= 32
my_lp_problem += xBD + xBW + xBN <= 19
my_lp_problem += xYD + xYW + xYN <= 31
my_lp_problem += xWD + xWW + xWN <= 23
my_lp_problem += xGD + xGW + xGN <= 13
my_lp_problem += xDM + xWM + xNM >= 25
my_lp_problem += xDP + xWP + xNP >= 25
my_lp_problem += xDT + xWT + xNT >= 47
my_lp_problem += xSD + xBD + xYD + xWD + xGD - xDM - xDP - xDT == 0
my_lp_problem += xSW + xBW + xYW + xWW + xGW - xWM - xWP - xWT == 0
my_lp_problem += xSN + xBN + xYN + xWN + xGN - xNM - xNP - xNT == 0
my_lp_problem
my_lp_problem.solve()
pulp.LpStatus[my_lp_problem.status]
for variable in my_lp_problem.variables():
    print "{} = {}".format(variable.name, variable.varValue)
print pulp.value(my_lp_problem.objective)	

'''

# Problem 3
'''
import pandas as pd
import networkx as nx
g = nx.Graph()
df = pd.read_csv('graph.txt')
df[['u','v']] = df['EdgeConnection'].str.split(n=1, pat='-', expand=True)
#print(df)
for i in range(df.shape[0]):
	#print df.iloc[i].u, df.iloc[i].v, df.iloc[i].Weights
	g.add_edge(df.iloc[i].u, df.iloc[i].v, distance=df.iloc[i].Weights)
u, v = 'D', 'P' #'E', 'Q'
print nx.dijkstra_path(g, u, v, 'distance')
print nx.dijkstra_path_length(g, u, v, 'distance')
'''

'''
import math
D = 354.
QMAX = 60.
d_Linehaul = math.sqrt(5**2 + 5**2)
lcf = 1.06
print 2 * (D/QMAX + 1/2.) * d_Linehaul * lcf

n = 354.
ktsp = 1.10
delta = n / (20.*10.)
print n*ktsp / math.sqrt(delta)

c_d = 2.15
c_s = 2
c_l = 3
c_vs = 0.5
print ((c_d * 2 * (D/QMAX + 1/2) * d_Linehaul * lcf) + (c_d * n*ktsp / math.sqrt(delta)) + (c_s*n + c_l*(D/QMAX + 1/2.) + c_vs*D)) / n
'''

'''
import math
D = 354.
QMAX = 5.
d_Linehaul = math.sqrt(5**2 + 5**2)
lcf = 1.06
print 2 * (D/QMAX + 1/2.) * d_Linehaul * lcf

n = 354.
ktsp = 1.06
delta = n / (20.*10.)
print n*ktsp / math.sqrt(delta)

c_d = 1.62
c_s = 1
c_l = 4
c_vs = 1
print ((c_d * 2 * (D/QMAX + 1/2) * d_Linehaul * lcf) + (c_d * n*ktsp / math.sqrt(delta)) + (c_s*n + c_l*(D/QMAX + 1/2.) + c_vs*D)) / n
'''

# Problem 4
