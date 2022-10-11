from numpy import array, sqrt, arange 

def sieve(N):
	primes = array([2] + range(3, N+1, 2))
	n = 1
	while n <= sqrt(N):
		p = primes[n]
		print p
		primes = list(sorted(set(primes) - set(p*arange(2,N/p+1))))
		n += 1
	print '#primes:', len(primes)
	return primes	

'''	
k = 4 #6	
N = 2000 #10**k	
P = sieve(N)
print P
P3 = filter(lambda x: x % 10 == 3, P)	
#print P3
print len(P3)
'''

for x in range(2, 50):
	for y in range(2, 50):
		if x*x + y*y == 1997:
			print (x,y)
			break
			
for C in range(1, 80):
	if 17*C % 81 == 1:
		print C
		break
		
k = 11		
m = 'ILoveMath'
m = str.upper(m)
c = ''.join([str(chr((ord(ch) - ord('A') + k) % 26 + ord('A'))) for ch in m])
d = ''.join([str(chr((ord(ch) - ord('A') - k) % 26 + ord('A'))) for ch in c])
print m, c, d

d = 1
while True:
	if 11*d % 48 == 1:
		print d
		break
	d += 1

p3 = 1
b = 0
while True:
	p3 *= 3
	b += 1
	if p3 % 31 == 26:
		print b
		break
		
for x in range(5):
	for y in range(5):
		if y**2 % 5 == (x**3 + 2) % 5:
			print (x, y)
