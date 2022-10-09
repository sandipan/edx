# Homework

# Q1
def message(i, j, x_j, values, pgm, m, N):
	ret = 0
	for x_i in values:
		term = pgm['phi_'+str(i)][x_i] * pgm['psi'][x_i, x_j]
		for k in N['x_'+str(i)]:
			if k != 'x_'+str(j): 
				term *= m[int(k[-1]), i, x_i]
		ret += term
	m[i, j, x_j] = ret

def p_x_i(i, x_i, pgm, m, N):
	ret = pgm['phi_'+str(i)][x_i]
	for k in N['x_'+str(i)]:
		ret *= m[int(k[-1]), i, x_i]
	return ret
	
pgm = {
	'phi_1':{'blue':0.5,'green':0.5},
	'phi_2':{'blue':0.5,'green':0.5},
	'phi_3':{'blue':0.6,'green':0.4},
	'phi_4':{'blue':0.8,'green':0.2},
	'phi_5':{'blue':0.8,'green':0.2},
	'psi': {('blue','blue'):0,
			('blue','green'):1,
			('green','blue'):1,
			('green','green'):0}
}

pgm = {
	'phi_1':{'blue':0.5,'green':0.5},
	'phi_2':{'blue':0.5,'green':0.5},
	'phi_3':{'blue':0,'green':1},
	'phi_4':{'blue':1,'green':0},
	'phi_5':{'blue':0,'green':1},
	'psi': {('blue','blue'):0.2,
			('blue','green'):0.8,
			('green','blue'):0.8,
			('green','green'):0.2}
}

N = {
	'x_1':['x_2','x_3'],
	'x_2':['x_1', 'x_4','x_5'],
	'x_3':['x_1'],
	'x_4':['x_2'],
	'x_5':['x_2']
	}

m = {}
values = ['blue', 'green']
message(4,2,'blue',values,pgm,m,N)		
message(4,2,'green',values,pgm,m,N)	
m[4,2,'blue'], m[4,2,'green'] = m[4,2,'blue'] / (m[4,2,'blue'] + m[4,2,'green']), m[4,2,'green'] / (m[4,2,'blue'] + m[4,2,'green']) # normalize
message(5,2,'blue',values,pgm,m,N)		
message(5,2,'green',values,pgm,m,N)		
m[5,2,'blue'], m[5,2,'green'] = m[5,2,'blue'] / (m[5,2,'blue'] + m[5,2,'green']), m[5,2,'green'] / (m[5,2,'blue'] + m[5,2,'green']) # normalize
message(3,1,'blue',values,pgm,m,N)		
message(3,1,'green',values,pgm,m,N)		
m[3,1,'blue'], m[3,1,'green'] = m[3,1,'blue'] / (m[3,1,'blue'] + m[3,1,'green']), m[3,1,'green'] / (m[3,1,'blue'] + m[3,1,'green']) # normalize
message(1,2,'blue',values,pgm,m,N)		
message(1,2,'green',values,pgm,m,N)		
m[1,2,'blue'], m[1,2,'green'] = m[1,2,'blue'] / (m[1,2,'blue'] + m[1,2,'green']), m[1,2,'green'] / (m[1,2,'blue'] + m[1,2,'green']) # normalize
print(m)
b = p_x_i(2, 'blue', pgm, m, N)
g = p_x_i(2, 'green', pgm, m, N)
print b, g
print b / (b + g)

# Q2
def message2(i, j, x_j, values, pgm, m, N):
	ret = 0
	for x_i in values:
		term = pgm['phi_'+str(i)][x_i] * pgm['psi' if i < j else 'psi_'][x_i, x_j]
		for k in N['x_'+str(i)]:
			if k != 'x_'+str(j): 
				term *= m[int(k[-1]), i, x_i]
		ret += term
	m[i, j, x_j] = ret

pgm = {
	'phi_1':{'wizard':0.5,'muggle':0.5},
	'phi_2':{'wizard':0.5,'muggle':0.5},
	'phi_3':{'wizard':0.5,'muggle':0.5},
	'phi_4':{'wizard':1,'muggle':0},
	'phi_5':{'wizard':0.5,'muggle':0.5},
	'phi_6':{'wizard':0.5,'muggle':0.5},
	'phi_7':{'wizard':0.5,'muggle':0.5},
    'psi': {('wizard','wizard'):0.5,
			('wizard','muggle'):0.5,
			('muggle','wizard'):0.25,
			('muggle','muggle'):0.75},
    'psi_': {('wizard','wizard'):0.5,
			('wizard','muggle'):0.25,
			('muggle','wizard'):0.5,
			('muggle','muggle'):0.75}
}

N = {
	'x_1':['x_2','x_3'],
	'x_2':['x_1', 'x_4', 'x_5'],
	'x_3':['x_1', 'x_6', 'x_7'],
	'x_4':['x_2'],
	'x_5':['x_2'],
	'x_6':['x_3'],
	'x_7':['x_3']
	}
par = {4:2, 5:2, 6:3, 7:3, 2:1, 3:1}

print '\n\n'

m = {}
values = ['wizard', 'muggle']
for n in [4,5,2,6,7,3]:
	p = par[n]
	message2(n,p,'wizard',values,pgm,m,N)		
	message2(n,p,'muggle',values,pgm,m,N)	
	m[n,p,'wizard'], m[n,p,'muggle'] = m[n,p,'wizard'] / (m[n,p,'wizard'] + m[n,p,'muggle']), m[n,p,'muggle'] / (m[n,p,'wizard'] + m[n,p,'muggle']) # normalize
print m
w = p_x_i(1, 'wizard', pgm, m, N)
m = p_x_i(1, 'muggle', pgm, m, N)
print w, m
print w / (w + m)
