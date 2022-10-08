import numpy as np
from scipy.integrate import quad

'''
from sympy.stats import Bernoulli, sample_iter
print(list(sample_iter(Bernoulli('X', 0.8), numsamples=10)))
def flip(p, n):
	return list(map(lambda x: 'H' if x==1 else 'T', sample_iter(Bernoulli('X', p), numsamples=n)))
print(flip(0.8, 10))
bias = [0.10,0.10,0.15,0.15,0.14,0.16,0.05,0.06,0.04,0.05]
np.where(np.random.multinomial(1, bias, size=1)[0]==1)[0][0]
'''

#from sympy import *
#from sympy.stats import Normal, Bernoulli, Uniform, P, E, variance, sample_iter, density
import mpmath as mp
from scipy.stats import norm, chi2, t, binom, uniform, laplace, cauchy, expon, chisquare
from numpy.linalg import eig
import matplotlib.pylab as plt
import statsmodels.api as sm

'''
x = expon.rvs(1, size=1000)
x.sort()
fig = sm.qqplot(x, uniform) #, distargs=(0,1), loc=0, scale=1) #norm
plt.show()
'''

m, n = 5, 5
s1_2, s2_2 = 0.5, 0.5
print((s1_2/n+s2_2/m)**2 / (s1_2**2/(n**3-n**2)+ s2_2**2/(m**3-m**2)))

xbar, x2bar, n = 0.9, 1.31, 5
Sn = (x2bar-xbar**2)
Sntil = (n/(n-1))* Sn
Tn = xbar / np.sqrt(Sntil)
print(Sntil)
print(xbar, Sn)
print(Tn)
pval = 2*(1-t.cdf(Tn,df=n-1))
alpha = 0.05
tq = t.ppf(1-alpha/2, df=n-1)
print(pval, tq, 2*(1-t.cdf(tq, df=n-1)))
print(np.sqrt(Sntil/n), xbar-tq*np.sqrt(Sntil/n), xbar+tq*np.sqrt(Sntil/n))
#print(norm.cdf(1.96), xbar-1.96*np.sqrt(Sntil/n), xbar+1.96*np.sqrt(Sntil/n))
alpha=0.07
print(chi2.ppf(1-alpha, df=1))
n, xbar, s2 = 500, 0.86, 1.09
thetaMLE = (xbar**2+s2)/2
print(thetaMLE)
print(1-chi2.cdf(n*(thetaMLE-1)**2/thetaMLE**2, df=1))
print(1-chi2.cdf(2*(n*thetaMLE-n*np.log(thetaMLE)-n), df=1))
print(chi2.ppf(1-alpha, df=1), chi2.ppf(1-alpha, df=2), chi2.ppf(1-alpha, df=3))
