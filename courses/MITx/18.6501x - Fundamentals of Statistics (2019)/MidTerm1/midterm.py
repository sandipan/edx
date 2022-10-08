import numpy as np
from scipy.stats import norm
import matplotlib.pylab as plt
from sympy import *

# 1.
n = 100000
X = np.random.normal(0, 1, n)
X1 = np.random.normal(0, 1, n)
print(np.mean(np.abs(X)<2), np.mean(np.abs(X)<2**(1/5)), np.mean(np.abs(X)<2)*np.mean(np.abs(X1)<2**(1/5)), np.mean((np.abs(X)<2) & (np.abs(X1**5)<2)))
print(0.95*0.75)

ns = [10, 100, 1000, 10000]
alpha = 0.05
#q_alpha = norm.ppf(1-alpha)
#print(q_alpha, norm.cdf(q_alpha))
#print(np.quantile(np.random.normal(0, 1, 10000), 1-alpha))
for n in ns:
	xn_bars = []
	for iter in range(1000):
		xn_bar = np.mean(np.random.normal(0, 1, n))
		xn_bars.append(xn_bar)
	print(np.mean(xn_bars), np.var(xn_bars), 1/n, np.quantile(xn_bars, 1-alpha))
	
# 2.
x = Symbol('x')
a = 0.2 #Symbol('a')
print(integrate(ln(1/a)*(a**x), (x, 0, oo)))
print(integrate(ln(1/a)*x*(a**x), (x, 0, oo)), -1/np.log(a))
print(integrate(ln(1/a)*x*x*(a**x), (x, 0, oo)), 2/(np.log(a))**2)
print(integrate(ln(1/a)*x**2*(a**x), (x, 0, oo))-(integrate(ln(1/a)*x*(a**x), (x, 0, oo)))**2, 1/(np.log(a))**2)

x = np.linspace(0.01, 100, 10000)
a = 0.45 #0.36
K = np.log(1/a)
tau = 10	
n = 10000
X = np.array([np.random.choice(x, p=K*a**x/np.sum(K*a**x)) for _ in range(n)])
print(np.exp(-1/np.mean(X)), a)

p = 0.2
n = 10000
xn_bars = []
for iter in range(1000):
	if iter % 100 == 0: print(iter)
	xn_bar = np.mean(np.array([np.random.choice([0,1], p=[1-p,p]) for _ in range(n)]))
	#print(xn_bar)
	xn_bars.append(xn_bar)
xn_bars = np.array(xn_bars)

plt.hist(np.random.normal(0,np.sqrt(p*(1-p)),n), label='N', alpha=0.2)
plt.hist(np.sqrt(n)*(xn_bars-p), label='D', alpha=0.2)
plt.legend()
plt.show()


n = 10000
xn_bars = []
for iter in range(1000):
	if iter % 100 == 0: print(iter)
	xn_bar = np.mean(np.array([np.random.choice(x, p=K*a**x/np.sum(K*a**x)) for _ in range(n)]))
	#print(xn_bar)
	xn_bars.append(xn_bar)
xn_bars = np.array(xn_bars)

print(np.mean(xn_bars), 1/K)
print(np.var(np.sqrt(n)*(xn_bars-1/K)), (1/K)**2)
print(np.mean(np.exp(-1/xn_bars)), a)
print(np.var(np.sqrt(n)*(np.exp(-1/xn_bars)-a)), (a*np.log(a))**2)

theta_hat = 0.62
n = 100	
print(norm.ppf(1-alpha), theta_hat + norm.ppf(1-alpha)*(theta_hat*np.log(1/theta_hat)/np.sqrt(n)))

#plt.hist(np.random.normal(0,-1/(ln(a)),n), label='N', alpha=0.2)
#plt.hist(np.sqrt(n)*(xn_bars-1/K), label='D', alpha=0.2)
plt.hist(np.random.normal(0,theta_hat*np.log(1/theta_hat),n), label='N', alpha=0.2)
plt.hist(np.sqrt(n)*(np.exp(-1/xn_bars)-a), label='D', alpha=0.2)
plt.legend()
plt.show()

# 3.
x = Symbol('x')
a = 0.2 #Symbol('a')
t = Symbol('t')
print(integrate(ln(1/a)*(a**x), (x, t, oo)))

x = np.linspace(0.01, 100, 10000)
theta = 0.36
K = np.log(1/theta)
tau = 10	
n = 10000
X = np.array([np.random.choice(x, p=K*theta**x/np.sum(K*theta**x)) for _ in range(n)])
print(np.mean(X))
Y = X > tau
print(np.mean(Y), theta**tau, (np.mean(Y))**(1/tau))
	
'''
x = np.linspace(0,1,100)
plt.plot(x,x-x**2,label=r'$\tau=1$')
plt.plot(x,(1-x**2)/4,label=r'$\tau=2$')
plt.axvline(x=1/3,label=r'$x=1/3$',color='g')
plt.legend()
plt.show()
'''