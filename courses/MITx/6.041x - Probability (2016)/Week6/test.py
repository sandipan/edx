p_X = {1:1./6, 2:3./6, 3:2./6}
p_Y = {2:2./6, 3:3./6, 4:1./6}
p_Z = {} # Z = X + Y
for x in p_X:
	for y in p_Y:
		p_Z[x+y] = p_Z.get(x+y, 0) + p_X[x]*p_Y[y] # by independence
print p_Z		