# Homework

# Q1
def message(i, j, x_j, values, pgm, m, N):
	ret = -1
	for x_i in values:
		term = pgm['phi_'+str(i)][x_i] * pgm['psi'][x_i, x_j]
		for k in N['x_'+str(i)]:
			if k != 'x_'+str(j): 
				term *= m[int(k[-1]), i, x_i]
		ret = max(ret, term)
	m[i, j, x_j] = ret

def p_x_i(i, x_i, pgm, m, N):
	ret = pgm['phi_'+str(i)][x_i]
	for k in N['x_'+str(i)]:
		ret *= m[int(k[-1]), i, x_i]
	return ret
	
pgm = {
	'phi_1':{0:0.5,1:0.5},
	'phi_2':{0:0.5,1:0.5},
	'psi': {(0,0):1./11,
			(0,1):10./11,
			(1,0):10./11,
			(1,1):1./11}
}

N = {
	'x_1':['x_2'],
	'x_2':['x_1']
	}

m = {}
values = [0,1]
message(2,1,0,values,pgm,m,N)		
message(2,1,1,values,pgm,m,N)	
print(m)
m[2,1,0], m[2,1,1] = m[2,1,0] / (m[2,1,0] + m[2,1,1]), m[2,1,1] / (m[2,1,0] + m[2,1,1]) # normalize
print(m)
z = p_x_i(1, 0, pgm, m, N)
o = p_x_i(1, 1, pgm, m, N)
print z, o
print z / (z + o)
message(1,2,0,values,pgm,m,N)		
message(1,2,1,values,pgm,m,N)	
print(m)
m[1,2,0], m[1,2,1] = m[1,2,0] / (m[1,2,0] + m[1,2,1]), m[1,2,1] / (m[1,2,0] + m[1,2,1]) # normalize
print(m)
z = p_x_i(1, 0, pgm, m, N)
o = p_x_i(1, 1, pgm, m, N)
print z, o
print z / (z + o)
