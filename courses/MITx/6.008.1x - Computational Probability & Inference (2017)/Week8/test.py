# Homework

x = [5, 10, 14, 42]
n = len(x)
print sum(x) / (1.0*n)

from math import log

lmbda = 12
print lmbda, sum(x) * log(lmbda) - n * lmbda

lmbda = 19
print lmbda, sum(x) * log(lmbda) - n * lmbda

lmbda = 15
print lmbda, sum(x) * log(lmbda) - n * lmbda

lmbda = 16
print lmbda, sum(x) * log(lmbda) - n * lmbda