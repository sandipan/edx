from math import sqrt 

def seive(n):
	primes = set(range(2, n))
	for i in range(2, int(sqrt(n))):
		for j in range(2, n / i + 1):
			primes -= set([i * j])
	return primes

#print seive(7058)
#print [x for x in seive(170) if x % 8 == 7] # Dirichlet primes (7 mod 8)
	
def twin_primes(primes):
	primes = list(primes)
	twins = []
	for i in range(len(primes)-1):
		if primes[i] + 2 == primes[i+1]:
			twins += [(primes[i], primes[i+1])]
	return twins

#print twin_primes(seive(1500))
	
def congruent():
	for A in range(1, 100):
		for B in range(1, 150):
			for C in range(1, 30):
				area = (0.5 * A * B) / (3.0 * C)
				num = A**2 * C**2 + B**2 * 9
				D, E = sqrt(num), 3 * C
				if area == 41 and D == int(D):
					print A, B, C, D, E 
					return
					
#congruent()

def congruent2():
	for A in range(1, 100):
		for B in range(1, 150):
			for C in range(1, 30):
				area = (0.5 * A * B) / (5.0 * C)
				num = A**2 * C**2 + B**2 * 25
				D, E = sqrt(num), 5 * C
				if area == 7 and D == int(D):
					print A, B, C, D, E 
					return
					
#congruent2()

def tunnel():
	count = 0
	for X in range(-2, 3):
		for Y in range(-4, 5):
			for Z in range(-1, 2):
				if 17 == 2*X**2 + Y**2 + 8*Z**2:
					print X, Y, Z
					count += 1
	print count

#tunnel()	

def tunnel():
	count = 0
	for X in range(-2, 3):
		for Y in range(-4, 5):
			for Z in range(-1, 1):
				if 17 == 2*X**2 + Y**2 + 32*Z**2:
					print X, Y, Z
					count += 1
	print count

#tunnel()	

def sumsq():
	lim = int(sqrt(239693 - 1))
	for A in range(1, lim):
		for B in range(1, lim):
			if A**2 + B**2 == 239693:
				print A, B
				
#sumsq()

def congruent3():
	for A in range(1, 5000):
		for B in range(1, 3000):
			area = (0.5 * 1519 * A) / (492 * B)
			num = 1519**2 * B**2 + 492**2 * A **2
			C, D = sqrt(num), 492 * B
			if area == 5 and C == int(C):
				print A, B, C, D 
				return

#congruent3()	

def tunnel3():
	count = 0
	for X in range(-6, 7):
		for Y in range(-8, 9):
			for Z in range(-3, 4):
				if 59 == 2*X**2 + Y**2 + 8*Z**2:
					print X, Y, Z
					count += 1
	print count

#tunnel3()			

def tunnel4():
	count = 0
	for X in range(-6, 7):
		for Y in range(-8, 9):
			for Z in range(-2, 3):
				if 59 == 2*X**2 + Y**2 + 32*Z**2:
					print X, Y, Z
					count += 1
	print count

#tunnel4()		

A = 2 * 5 * 11 * 17
B = 3 * 7 * 13 * 19
C = A + B # 7057

'''
from fractions import gcd

N = 6
M = 10000
primes = seive(int(sqrt(M)))
rel_primes = set([])
for A in range(1, M+1):
	for B in range(A+1, M+1):
		rel_prime = True
		sqA, sqB = sqrt(A), sqrt(B)
		for p in primes:
			if A % p == 0 and B % p == 0:
				rel_prime = False
				break
			if p > sqA or p > sqB:
				break
		if rel_prime:
			rel_primes.add((A,B))
#print rel_primes
eps = []
e = 0.1
while e <= 6.0:
	eps.append(e)
	e += 0.1

N1s = []	
counts = []
for epsilon in eps:
	N1 = N**(1+epsilon)
	N1s.append(N1)
	count = 0
	for A in range(1, M+1):
		for B in range(A+1, M+1):
			#if gcd(A, B) == 1 and A + B > N1:
			rel_prime = ((A, B) in rel_primes) | ((B, A) in rel_primes)
			if rel_prime and A + B > N1:
				count += 1
	counts.append(count)
	print epsilon, N1, count
'''		
	