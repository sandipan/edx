print([len(bin(ord(c)))-2 for c in [u'👺', u'🤖', u'❣', u'🕳', u'㊙', u'⚪', u'🛫']])
print([c.encode("unicode_escape") for c in [u'👺', u'🤖', u'❣', u'🕳', u'㊙', u'⚪', u'🛫']])
import numpy as np
for n in range(13):
	print(n, bin(n+2), bin(n+2)[3:], np.ceil(np.log2(n+3))-1)
#n = 500
#print(n, bin(n+2)[3:], np.ceil(np.log2(n+3))-1)
#print(n, bin(n//100+2)[3:], bin(int(np.log10(n))+2)[3:])

# 0010100101110110101101000101101011011010001011001011
# python CopyDetection.py 0110111001101 1111111111 110111001101

import matplotlib.pylab as plt
x = [5,10,15,20,30,40,50]
y = [60.3, 41.5, 30.0, 20.4, 9.8, 3.7, 0.2]
#plt.plot(x, y)
#plt.show()

# NCD(x,y) = (Z(x+y) - min(Z(x),Z(y))) / max(Z(x),Z(y))
def NCD(x, y):
	return (Zs[x+y] - min(Zs[x], Zs[y])) / max(Zs[x], Zs[y])


Zs = {'s1':8247, 's2':10793, 's3':2151, 's4':2829}
Zs['s1' + 's2'] = 18022
Zs['s3' + 's4'] = 4352
print(NCD('s1', 's2'))
print(NCD('s3', 's4'))


def NGD(x, y):
	return (max((np.log(G[x]), np.log(G[y]))) - np.log(G[x+y])) / (np.log(N) - min(np.log(G[x]), np.log(G[y])))

G = {'k':18600000, 's':54300000, 'ks':424000}
N = 8*1e9
print(NGD('k','s'))

print(17120*2254/61009)

P1, P2, L = 1670, 2100, 20
print(np.log2(P2-P1-L+1), L-np.log2(L+1)-1)
print([2254*17120/r for r in [440, 990, 780, 1210]])

from hashlib import sha256
S = sha256(('01' * 1000).encode('utf-8')).hexdigest()
print(S, len(S))
print(format(int(S, 16), "040b"))

#S = sha256(('0' * 1000).encode('utf-8')).hexdigest()
#print(S)

'''
import analogy
analogy.generate_string("abc, ijk")
analogy.generate_string("let, ?0, -, ?0, let, mem, 0, orang")
analogy.instruction_complexity("let, ?0, -, ?0, let, mem, 0, orang")

analogy.generate_string("let, ?0, :, ?0, ?1, let, mem, 0, rosa, m")
analogy.instruction_complexity("let, ?0, :, ?0, ?1, let, mem, 0, rosa, m")

analogy.generate_string("let, ?1, :, ?0, let, mem, 0, m, rosa")
analogy.instruction_complexity("let, ?1, :, ?0, let, mem, 0, m, rosa")

analogy.generate_string("let, ?0, a, :, ?0, a, m, let, mem, 0, ros")
analogy.instruction_complexity("let, ?0, a, :, ?0, a, m, let, mem, 0, ros")

analogy.generate_string("let, ?0, :, ?0, m, let, mem, 0, rosa")
analogy.instruction_complexity("let, ?0, :, ?0, m, let, mem, 0, rosa")

analogy.restricted_search('rosa:rosam::vita:vitam')
analogy.restricted_search('puhua:puhun::katsoa:katson')
analogy.restricted_search('abc:abd::ijk:ijl')

# pip install --upgrade threadpoolctl
'''
a = 1
Ns = [2, 113, 230]
ds = [0.5*10**6, 4*10**6, 8*10**6]
for b in [0.1, 0.5, 1]:
	print(b, [-2*np.log2(d)+b*np.log2(1+N/a) for (N, d) in zip(Ns,ds)])

print([np.log2(i) + 2*np.log2(di) for i, di in zip([4,52], [114,15])])