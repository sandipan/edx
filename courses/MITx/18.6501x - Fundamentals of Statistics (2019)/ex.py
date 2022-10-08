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

from sympy import *
from sympy.stats import Normal, Bernoulli, Uniform, P, E, variance, sample_iter, density
import mpmath as mp
from scipy.stats import norm, chi2, t, binom, uniform, laplace, cauchy, expon, chisquare
from numpy.linalg import eig
import matplotlib.pylab as plt

def Unit_1():

	x, mu, sigma = Symbol('x'), Symbol('m'), Symbol('s')
	#print(integrate(exp(-(x-mu)**2/(2*sigma**2))/sqrt(2*pi*sigma**2), (x, -oo, oo)))
	#X = Normal('X', mu, sigma)
	#print(simplify(P(X>0))) #, E(X**2), E(X**3), E(X**4), variance(X**2))

	def pdf(x, a, b):
		return 1 / (b - a)

	def Ex(x, a, b):
		return x / (b - a)

	def Ex2(x, a, b):
		return x*x / (b - a)

	a = 2
	b = 8.5
	X = Uniform('X', a, b)
	print(quad(Ex, a, b, args=(a,b)), (a+b)/2, E(X))
	print(quad(Ex2, a, b, args=(a,b))[0]-(quad(Ex, a, b, args=(a,b))[0])**2, (b-a)**2/12, variance(X))

	I = quad(pdf, 4, b, args=(a,b))
	print(I, (b - 4)/(b - a), P(X > 4))
	print(quad(pdf, 2, np.exp(1), args=(a,b)), (np.exp(1)-2)/(b-a), P(X < mp.e))

	U = Uniform('U', 0, 1)
	V = Uniform('V', 0, 1)
	#print(E(abs(U-V).rewrite(Heaviside)))
	print(P(U==V))
	#print(P(U<=V))
	#print(density(U+V))

	n = 10000
	U, V = np.random.random(n), np.random.random(n)
	print(np.mean(abs(U-V)))
	print(np.mean(abs(U-V) < 10**(-6)))
	print(np.mean(U <= V))

	'''
	#plt.hist(U+V, normed=True)
	plt.hist(np.maximum(U,V), normed=True)
	plt.show()
	'''

	t = 1/2
	print((1-t/10)**10,(1-t/100)**100,(1-t/100000)**100000, np.exp(-t))


	print(1-norm.cdf(0), 1-norm.cdf(1,1,np.sqrt(2.25)))
	print(norm.cdf(2/np.sqrt(2.25))-norm.cdf(0), norm.cdf(3,1,np.sqrt(2.25))-norm.cdf(1,1,np.sqrt(2.25)))
	print(2*(1-norm.cdf(1/np.sqrt(2.25))), 2*(1-norm.cdf(2,1,np.sqrt(2.25))), 1 - (norm.cdf(2,1,np.sqrt(2.25))-norm.cdf(-2,1,np.sqrt(2.25))))
	print(2*(1-norm.cdf(np.sqrt(2)/np.sqrt(2.25))), 1-norm.cdf(1+np.sqrt(2),1,np.sqrt(2.25))+norm.cdf(1-np.sqrt(2),1,np.sqrt(2.25)))
	print(1-norm.cdf(400,300,np.sqrt(210)))

	A = np.array([[3,0],[1/2,2]])
	print(eig(A))

	print(np.roots([1,-3,2]))

	alpha = 0.05
	q_alpha_2 = norm.ppf(1-alpha/2)
	print(q_alpha_2, norm.cdf(q_alpha_2))
	n = 100
	R_n_bar = 0.645
	A = (1 + q_alpha_2**2/n)
	B = -(2*R_n_bar + q_alpha_2**2/n)
	C = R_n_bar**2
	print(A, B, C)
	print(np.roots([A, B, C]))

	print(norm.cdf(5/2) - norm.cdf(-11/2), norm.cdf(6, 1, 2) - norm.cdf(-10, 1, 2))
	
# Unit_1()

#def Indicator(x):
#	return x 

def Unit2():

	alpha = 0.5 #0.02 #0.5 #0.05
	q_alpha_2 = norm.ppf(1-alpha/2)
	print(q_alpha_2, norm.cdf(q_alpha_2)-norm.cdf(-q_alpha_2))
	Rn_bar = 0.5 #0.645
	n = 150
	print(Rn_bar - q_alpha_2*np.sqrt((1/2)*(1-1/2))/(np.sqrt(n)), Rn_bar + q_alpha_2*np.sqrt((1/2)*(1-1/2))/(np.sqrt(n))) # conservative
	print(Rn_bar - q_alpha_2*np.sqrt(Rn_bar*(1-Rn_bar))/(np.sqrt(n)), Rn_bar + q_alpha_2*np.sqrt(Rn_bar*(1-Rn_bar))/(np.sqrt(n))) # plug-in
	print(sorted(np.roots([(1 + q_alpha_2**2/n), -(2*Rn_bar + q_alpha_2**2/n), Rn_bar**2]))) # Isolve
	lambda_hat = 1 / 7.8
	alpha = 0.1 #0.02 #0.5 #0.05
	n = 64
	q_alpha_2 = 1.65 #norm.ppf(1-alpha/2)
	print(q_alpha_2, norm.cdf(q_alpha_2)-norm.cdf(-q_alpha_2))
	print(lambda_hat/(1 + q_alpha_2/np.sqrt(n)), lambda_hat/(1 - q_alpha_2/np.sqrt(n)), lambda_hat/(1 - q_alpha_2/np.sqrt(n)) - lambda_hat/(1 + q_alpha_2/np.sqrt(n))) # Isolve
	print(lambda_hat*(1 - q_alpha_2/np.sqrt(n)), lambda_hat*(1 + q_alpha_2/np.sqrt(n)), lambda_hat*(1 + q_alpha_2/np.sqrt(n)) - lambda_hat*(1 - q_alpha_2/np.sqrt(n))) # plug-in
	n = 25
	q_alpha_2 = 1.6448
	Xn_bar = 4.5
	print(sorted(np.roots([1, -(2*np.sqrt(Xn_bar) + q_alpha_2**2/(4*n)), Xn_bar]))) # Isolve
	print(np.sqrt(Xn_bar) - q_alpha_2*(Xn_bar)**(1/4)/np.sqrt(4*n), np.sqrt(Xn_bar) + q_alpha_2*(Xn_bar)**(1/4)/np.sqrt(4*n)) # plug-in
	
	'''
	y = np.linspace(0,5,100)
	plt.plot(y, y**2)
	plt.plot(y, np.exp(y)-1)
	plt.show()
	'''
	
	D1 = np.sqrt(200)*(80/200-0.5) / np.sqrt(0.5*(1-0.5))
	print(D1, norm.cdf(D1))
	D1 = np.sqrt(200)*(106/200-0.5) / np.sqrt(0.5*(1-0.5))
	print(D1, 1-norm.cdf(D1))
	
	X_n = [-1.0,-0.8,-2.9,1.4,0.3,-0.8,1.4]
	X_n = [-1.7,-0.1,-0.2,0.3,0.3,-0.9,-0.03]
	X_n = [-0.2,0.6,1.1,-0.9,0.1,-1.2,1.1]
	n = len(X_n)
	print(np.sqrt(n)*np.abs(np.mean(X_n))>0.25)
	
	print(norm.cdf(norm.ppf(1-0.05)), 1-norm.cdf(norm.ppf(1-0.05))+norm.cdf(-norm.ppf(1-0.05)),2- 2*norm.cdf(norm.ppf(1-0.05)))
	
	print(np.max([0.1,0.53,0.002,0.1234,0.24,0.48]) > 1/2)
	
	print(norm.ppf(1-0.05), norm.ppf(1-0.1))
	
	print(np.sqrt(200)*np.abs(80/200-0.5)/0.5)
	
	print('######')
	n = 124
	Xn_bar =106/n # 0.645 #80/n #75/n #106/n #80/n
	print(Xn_bar)
	val = 2*np.sqrt(n)*np.abs(Xn_bar - 1/2)
	val = 0.8485 #2.82842
	print(val, 1-(norm.cdf(val)-norm.cdf(-val)), 2*(1-norm.cdf(val)))
	
	n = 15
	Xn_bar = 16.5
	Z = np.sqrt(n)*(Xn_bar-20)/5.2
	print(Z, norm.cdf(Z))
	
	n = 1000
	Xn_bar = 257
	Yn_bar = 260
	val = np.sqrt(n)*np.abs(Xn_bar-Yn_bar)/np.sqrt(38**2+39**2)
	pval = 2-2*norm.cdf(val)
	print(val, norm.ppf(1-0.1/2), pval)
	
	alpha = 0.05
	q_alpha_2 = norm.ppf(1-alpha/2)
	X = 1.32
	val = np.abs(X)
	psi = val - q_alpha_2 > 0
	pval = 2-2*norm.cdf(val)
	print(int(psi), q_alpha_2, pval)
	
#Unit2()

def TV(A, P, Q):
	return sum([np.abs(P[x]-Q[x]) for x in A])/2

def KL(S, P, Q):
	return sum([P[x]*np.log(P[x]/Q[x]) for x in S])	
	
import scipy as sp
from sympy.solvers import solve, solveset
from sympy import Symbol

def Unit3():

	f = {1:1/4,2:1/4,3:1/8,4:3/8}
	g = {1:1/4,2:1/4,3:1/4,4:1/4}
	A = [3]
	print(TV(A, f, g))
	A = [4]
	print(TV(A, f, g))
	A = [3,4]
	print(TV(A, f, g))
	A = [1,2,3,4]
	print(TV(A, f, g))
	x = [0, 1]
	X = {0:1/2,1:1/2}
	Y = {0:1/2,1:1/2}
	print(TV(x, X, Y))
	x = [0, 1]
	X = {0:1/2,1:1/2}
	Y = {0:2/3,1:1/3}
	print(TV(x, X, Y))
	
	#n = 100
	#x = np.arange(n)
	#plt.plot(x, sp.misc.comb(n,x)*(1/2)**x)
	#plt.plot(x, np.exp(-x**2/2)/np.sqrt(2*np.pi))
	#plt.show()
	
	x = [0, 1]
	X = {0:1/2,1:1/2}
	Y = {0:1/2,1:1/2}
	print(KL(x, X, Y))
	X = {0:1/2,1:1/2}
	Y = {0:2/3,1:1/3}
	print(KL(x, X, Y))
	print(KL(x, Y, X))

	x = Symbol('x')
	f = x**3/3 - x**2 - 3*x + 10
	fd = diff(f)
	fdd = diff(fd)
	#polyRoots = solveset(f, x)
	dRoots = solveset(fd, x)
	ddRoots = solveset(fdd, x)
	print(fd, dRoots)
	print(fdd, ddRoots)
	print([fdd.subs(x, _) for _ in dRoots])
	#print([f.subs(x, _) for _ in dRoots])
	#x = np.linspace(-4, 4, 100)
	#plt.plot(x, x**3/3 - x**2 - 3*x + 10)
	#plt.show()
	
	'''
	n = 1000
	x = np.linspace(0.01, 100, n)
	plt.plot(x, np.log(x))
	plt.show()
	x = np.linspace(-100, 100, n)
	plt.plot(x, -x**4+x**2+40*x)
	plt.show()
	x = np.linspace(0.01, 100, n)
	plt.plot(x, 1/(np.exp(x)-1))
	plt.show()
	'''
	
	Xs, Ys = [], []
	n = 100000
	for i in range(n):
		X = np.random.choice([-1,1],1)[0]
		#print(X)
		Y = np.random.choice([-3*X-1,-3*X,-3*X+1],1)[0]
		Xs.append(X)
		Ys.append(Y)
	print(np.var(Xs), np.var(Ys), np.cov(Xs, Ys))	
	
	Sx = np.array([[1,1/2],[1/2,1]])
	M = np.array([[1,-1],[1,1]])
	print(M@Sx@M.T)
	
	Sx = np.array([[1,2],[2,4]])
	M = np.array([[2,-1]])
	print(M@Sx@M.T)
	
	X, Y = [], []
	n = 100000
	for i in range(n):
		x = np.random.uniform(0, 1, 1)[0]
		#print(x)
		y = np.random.uniform(x, 1, 1)[0]
		X.append(x)
		Y.append(y)
	#print(X[:10])
	#print(Y[:10])
	print(np.var(X), np.var(Y), np.cov(X, Y))	
	
	b = 2 #10
	mu = 0
	X, Y = [], []
	n = 100000
	for i in range(n):
		x = np.random.laplace(mu, b, 1)[0]
		#print(x)
		y = np.sign(x)
		X.append(x)
		Y.append(y)
	#print(X[:10])
	#print(Y[:10])
	print(np.var(X), np.var(Y), np.cov(X, Y))	
	d = 15
	D = np.ones((d,d))*(-1/d**2)
	for i in range(d):
		D[i,i] = 1/d - 1/d**2
	#print(D)
	print(np.linalg.det(D))
	
	X = np.array([0.5, 1.8, -2.3, 0.9])
	m1, m2 = sum(X)/len(X), sum(X**2)/len(X)
	print(m1, np.sqrt(m2 - m1**2))
	
	'''
	m = np.linspace(-4, 6, 100)
	plt.plot(m, np.abs(1-m) + np.abs(2-m) + np.abs(3-m))
	plt.plot(m, np.abs(1-m) + np.abs(2-m) + np.abs(3-m) + np.abs(4-m))
	plt.show()
	'''
	
	#d = np.linspace(0, 100, 1000)
	d = np.linspace(0, 10, 100)
	plt.plot(d, 2*(1-d*np.exp(-d)-np.exp(-d))/(1-np.exp(-d))**2)
	#plt.plot(d, (d-3*d*np.exp(-d)+2-2*np.exp(-d)))
	plt.show()
	
	from scipy.optimize import fmin, minimize
	def f(d):
		#return 2*(1-d*np.exp(-d)-np.exp(-d))/(1-np.exp(-d))**2 if d >=0 else np.Inf
		return -2*(1-d*np.exp(-d)-np.exp(-d))/(1-np.exp(-d))**2 if d >=0 else -np.Inf
	res = minimize(f, 1) #lambda d: 2*(1-d*np.exp(-d)-np.exp(-d))/(1-np.exp(-d))**2 #fmin
	print(res)

	
#Unit3()

from collections import Counter
def multinomila_MLE(x):
	fd = Counter(x)
	print(fd)
	return {k:fd[k]/sum(fd.values()) for k in fd}

import scipy.linalg

def KS_test_stat(x):
	x = sorted(x)
	n = len(x)
	T = np.zeros(n)
	for i in range(n):
		T[i] = max(abs((i)/n-x[i]), abs((i+1)/n-x[i]))
	print(T)
	T = np.sqrt(n)*max(T)
	return T

def KL_test_stat(x):
	x = sorted(x)
	n = len(x)
	mu, sigma = np.mean(x), np.std(x)
	z = (x - mu) / sigma 
	T = np.zeros(n)
	for i in range(n):
		T[i] = abs(norm.cdf(z[i])-emp_CDF(z, z[i]))
	print(T)
	T = np.sqrt(n)*max(T)
	return T
	
def T_KS(n):
    SIMSIZE=1000000
    i = np.arange(1,n+1)[:,np.newaxis]
    u = np.random.uniform(size=(n,SIMSIZE))
    u.sort(axis=0)
    return np.max( np.maximum(np.abs((i-1)/n - u), np.abs(i/n - u)), axis=0 )

def emp_CDF(x, val):
	x = sorted(x)
	return np.sum(x  <= val) / len(x)

def q_KS(n, M, alpha):
	u = np.random.uniform(size=(n,M))
	u.sort(axis=0)
	x = np.max(np.maximum(abs(np.arange(n)[:,np.newaxis]/n-u), abs((np.arange(n)+1)[:,np.newaxis]/n-u)), axis=0)
	return np.quantile(x, 1-alpha)

def Unit4():
	'''
	#print(scipy.linalg.sqrtm(np.array([[2,0],[0,0]])))
	P = np.sqrt(1/2)*np.array([[1,-1],[1,1]])
	D = np.array([[3,0],[0,0]])
	A = P.T@D@P
	print(scipy.linalg.sqrtm(A), (P.T)@scipy.linalg.sqrtm(D)@(P))
	alpha = 0.05
	beta=1-alpha #0.95
	print(chi2.ppf(alpha, df=1), (norm.ppf(1-beta/2))**2, (norm.ppf((1-alpha)/2))**2, norm.ppf((1-alpha)/2), (1-alpha)/2, (1-alpha/2))
	#X = np.array([1])
	X = np.array([1,0,0,0,1,1,1,0,0,1,0,1,0,0,0,0])
	print(np.sum(X==0), np.sum(X==1))
	print((0.75)**np.sum(X==1)*(0.25)**np.sum(X==0)/(0.25)**np.sum(X==1)*(0.75)**np.sum(X==0))
	print(chi2.ppf(0.95, df=3))
	X = np.array([0.2,-0.1,-1.9,-0.4,-1.8])
	mu_MLE, sigma2_MLE = np.mean(X), np.var(X, ddof=0)
	theta_MLE = np.array([mu_MLE, sigma2_MLE])
	theta_0 = np.array([0,1])
	I_theta_MLE = np.array([[1/theta_0[1],0],[0,1/(2*theta_0[1]**2)]])
	n = len(X)
	Wn = n*(theta_MLE-theta_0).T@I_theta_MLE@(theta_MLE-theta_0)
	print(theta_MLE, theta_0, I_theta_MLE)
	print(Wn) # Wald
	Xnbar=6.2
	Ymbar=6
	σ1_2=0.1
	σ2_2=0.2  
	n=50  
	m=50
	print((σ1_2/n+σ2_2/m)**2/(σ1_2**2/(n**3-n)+σ2_2**2/(m**3-m))) # Welch-Satterthwaite
	print(1-t.cdf((Xnbar-Ymbar)/np.sqrt(σ1_2/n+σ2_2/m), df=89))
	print(1-chi2.cdf(1.03, df=1))
	n = 100
	xnbar = 0.83
	print(1-norm.cdf(np.sqrt(n)*(1-xnbar)))
	print(1-chi2.cdf(n*(1-xnbar)**2, df=1))
	n=100
	mu=2.41
	sigma2=5.20
	print(norm.cdf((mu-np.sqrt(sigma2))/np.sqrt(1.5*sigma2/n)))
	mu=3.28
	sigma2=15.95
	print(norm.cdf((mu-np.sqrt(sigma2))/np.sqrt(1.5*sigma2/n)))
	x=[1,3,1,2,2,2,1,1,3,1,1,2]
	p = multinomila_MLE(x)
	print(p)
	n = len(x)
	d = 3
	T = n*np.sum((np.array(list(p.values()))-1/3)**2)/(1/3)
	print(T, 1-chi2.cdf(T, df=d-1)) # https://shiny.rit.albany.edu/stat/chisq/
	print(norm.ppf(1-0.05), chi2.ppf(1-0.05, df=6-1)) # https://people.richland.edu/james/lecture/m170/tbl-chi.html
	x = [5,6,1,6,4,1,2,4,6,6,1,6,6,3,5]
	p = multinomila_MLE(x)
	print(p)
	n = len(x)
	d = 6
	T = n*np.sum((np.array(list(p.values()))-1/6)**2)/(1/6)
	print(T, 1-chi2.cdf(T, df=d-1)) # https://shiny.rit.albany.edu/stat/chisq/
	x = 20*['X'] + 30*['Y'] + 50*['Z']
	p = multinomila_MLE(x)
	print(p, p.values())
	n = len(x)
	d = 3
	T = n*np.sum((np.array(list(p.values()))-np.array([1/10,4/10,5/10]))**2/np.array([1/10,4/10,5/10]))
	print(T, 1-chi2.cdf(T, df=d-1)) # https://shiny.rit.albany.edu/stat/chisq/
	print(norm.ppf(1-0.05), chi2.ppf(1-0.05, df=3-1)) # https://people.richland.edu/james/lecture/m170/tbl-chi.html
	'''
	n = 1000
	N = [339, 455, 180, 26]
	K = 3
	theta_MLE = np.sum([j*N[j] for j in range(K+1)])/(n*K)
	f_theta = np.array(binom.pmf(range(K+1),K,theta_MLE))
	T = n*np.sum((np.array(N)/n-f_theta)**2/f_theta)
	pval = 1-chi2.cdf(T,df=K-1)
	print(theta_MLE, f_theta, sum(f_theta), T, pval)
	x = [0.8,0.7,0.4,0.7,0.2]
	print(KS_test_stat(x), np.sqrt(5)*0.56328)
	t=T_KS(10)
	print(np.quantile(t, 1 - 0.05 ))
	x = np.array([0.28,0.2,0.01,0.80,0.1])
	for val in np.array([0.5,0.1,1]):
		print(val, emp_CDF(x, val))
	print(KS_test_stat(x), KL_test_stat(x))
	from statsmodels.stats.diagnostic import kstest_normal, lilliefors
	#print(kstest_normal(x))
	print(lilliefors(x))
	#print(np.mean(x), np.var(x))
	import statsmodels.api as sm
	x.sort()
	print(x)
	fig = sm.qqplot(x, uniform, line='45') #, distargs=(0,1), loc=0, scale=1) #norm
	plt.show()
	'''
	n = 275
	d = 4
	T = n*np.sum((np.array([205,26,25,19])/n-np.array([0.72,0.07,0.12,0.09]))**2/np.array([0.72,0.07,0.12,0.09]))
	print(T, 1-chi2.cdf(T, df=d-1)) # https://shiny.rit.albany.edu/stat/chisq/
	print(chisquare(np.array([205,26,25,19]), f_exp=n*np.array([0.72,0.07,0.12,0.09])))
	'''
	'''
	x = np.linspace(norm.ppf(0.01), norm.ppf(0.99), 100)
	plt.plot(x, norm.pdf(x),lw=2, alpha=0.6, label='norm pdf')
	x = np.linspace(laplace.ppf(0.01, scale=1/np.sqrt(2)), laplace.ppf(0.99, scale=1/np.sqrt(2)), 100)
	plt.plot(x, laplace.pdf(x), lw=2, alpha=0.6, label='laplace pdf')
	x = np.linspace(cauchy.ppf(0.1), cauchy.ppf(0.9), 100)
	plt.plot(x, cauchy.pdf(x), lw=2, alpha=0.6, label='cacuchy pdf')
	x = np.linspace(-3, 3, 100)
	plt.plot(x, uniform.pdf(x, loc=-np.sqrt(3), scale=2*np.sqrt(3)), lw=2, alpha=0.6, label='uniform pdf')
	x = np.linspace(expon.ppf(0, scale=1), expon.ppf(0.99, scale=1), 100)
	plt.plot(x, expon.pdf(x, scale=1), lw=2, alpha=0.6, label='exponential pdf')
	plt.legend()
	plt.show()
	import statsmodels.api as sm
	#sm.qqplot(laplace.rvs(scale=1/np.sqrt(2), size=10000), norm, line='45') #, distargs=(0,1), loc=0, scale=1) #norm
	#sm.qqplot(cauchy.rvs(size=10000), norm) #, distargs=(0,1), loc=0, scale=1) #norm
	sm.qqplot(expon.rvs(size=10000, scale=1/2.5)+1, norm) #, distargs=(0,1), loc=0, scale=1) #norm
	plt.show()
	'''
	'''
	x = np.random.uniform(0,1,5) # theoretical samples from uniform distribution [0,1]
	y = [0.01, 0.1, 0.2, 0.28, 0.8]
	plt.figure()
	plt.scatter(np.sort(x), np.sort(y))
	plt.scatter(np.linspace(0, 1, 100), np.linspace(0, 1, 100), s=1) # y=x
	plt.show()
	'''
	#print(q_KS(10, 10**6, 0.05))

#Unit4()

def ber_likelihood(p, n, X):
	return p**(sum(X))*(1-p)**(n-sum(X))
	
def ber_post(p, L):
	return L*p / sum(L*p)

from scipy.stats import mode, truncnorm

def Unit5():
	'''
	x = np.linspace(0,1,1000)
	plt.subplot(221), plt.plot(x, x**(0.3-1)*(1-x)**(0.2-1)), plt.title('case1')
	plt.subplot(222), plt.plot(x, x**(0.3-1)*(1-x)**(1.5-1)), plt.title('case2')
	plt.subplot(223), plt.plot(x, x**(1.5-1)*(1-x)**(0.3-1)), plt.title('case3')
	#plt.subplot(224), plt.plot(x, x**(1-1)*(1-x)**(1-1)), plt.title('case4')
	plt.subplot(224), plt.plot(x, x**(1.3-1)*(1-x)**(1.5-1)), plt.axvline((1.3-1)/(1.3+1.5-2)), plt.title('case4')
	#plt.legend()
	plt.show()
	'''
	'''
	x = np.linspace(0.05,0.95,1000)
	plt.plot(x, x**2 + (1-x)**2, label='1')
	plt.plot(x, x*(1-x), label='2')
	#plt.plot(x, 1/x + 1/(1-x), label='3')
	plt.legend()
	plt.show()
	'''
	'''
	n = 6
	X = [0,1,1,0,1,1]
	probs = np.array([0.2,0.4,0.6,0.8])
	priors = np.array([0.2,0.4,0.2,0.2])
	L = np.array([ber_likelihood(p, n, X) for p in probs])
	posts = ber_post(priors, L)
	print(posts)
	print(np.sum(priors*probs), np.sum(posts*probs))
	print(np.argmax(priors), np.argmax(posts))
	print(np.cumsum(priors), np.cumsum(posts))
	theta = 4
	n = 10**6
	T = 1000
	x = np.random.normal(loc=0, scale=np.sqrt(theta), size=(n,T))
	x2 = np.mean(x**2, axis=1)
	plt.figure(figsize=(10,10))
	plt.hist(np.sqrt(n)*(x2-theta), alpha=0.2, label='2')
	plt.hist(np.random.normal(loc=0, scale=np.sqrt(2*theta**2), size=n), alpha=0.2, label='1')
	plt.legend()
	plt.show()
	'''
	'''
	xbar = 5
	n = 100
	a = 5
	mu = 10 #xbar - a/n
	sigma = 5 #1/np.sqrt(n)
	#print(mu, sigma, np.Inf)
	x = truncnorm.rvs(a=-mu/sigma, b=np.Inf, loc=mu, scale=sigma, size=100000)
	plt.hist(x)
	plt.axvline(np.median(x), color='red')
	plt.show()
	#print(np.median(x), (xbar-a/n)+norm.ppf(0.75)*(1/sqrt(n)))
	print(np.median(x), truncnorm.median(a=0, b=np.Inf, loc=mu, scale=sigma), mu+norm.ppf(0.75)*(sigma), mu+norm.ppf((1+norm.cdf(-mu/sigma))/2)*(sigma))
	print(truncnorm.median(a=-mu/sigma, b=np.Inf, loc=mu, scale=sigma), mu+norm.ppf(0.75)*(sigma), mu+norm.ppf((1+norm.cdf(-mu/sigma))/2)*(sigma))
	'''
	'''
	u = np.array([[1],[3]])
	v = np.array([[-1],[1]])
	w = np.array([[0],[1]])
	x = np.array([[1],[1]])
	A = u@(v.T)
	B = v@(v.T)
	C = w@w.T
	D = x@x.T
	print(A, B, C, D)
	Ms = [A+A, A+B, A+C, A@B, A@C, B@D]
	for M in Ms:
		print(np.linalg.matrix_rank(M))
	'''
	
#Unit5()

def gradient_descent(Y, X, beta, b, phi, t, n):
	for i in range(n):
		#print(X.shape, Y.shape, beta.shape, b(X@beta).shape, Y-b(X@beta), X)
		beta = beta + t*X.T@(Y-b(X@beta))/phi
		print(i, beta)
	return beta

def Unit6():
	n, p = 10, 3
	X = np.ones((n, p))
	for i in range(1, p):
		X[:,i] = X[:,i-1]*np.array(range(1,n+1))
	y = np.array([1,3,5,8,11,14,18,21,25,28])
	#print(X)
	#print((X.T@X).astype(int))
	print(np.linalg.inv(X.T@X)@(X.T@y))
	X = np.array([[0.1],[0.2]])
	Y = np.array([1,2]).reshape((X.shape[0],1))
	phi = 1
	b = np.exp
	beta = np.zeros((1,1))
	#print(X, beta)
	t = 0.01
	n = 2
	gradient_descent(Y, X, beta, b, phi, t, n)
	print(np.exp(np.array([1.1723,0.0939])@np.array([1,22])))
	
Unit6()