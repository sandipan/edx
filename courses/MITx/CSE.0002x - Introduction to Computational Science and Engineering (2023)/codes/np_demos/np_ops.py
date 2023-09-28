# Some examples of ndarray math operations, highlighting vectorization

import numpy as np

a    = np.array([ 0., 1., -2.,  3.])
acol = a.reshape((4,1))
b    = np.array([2., 4., 3., -4.])
c    = 3.
K    = np.array([[2., 3., -1., 0.],[-1., 2., 4., 0.5]])

print(f'a   = {a}')
print(f'acol = \n{acol}')
print(f'b   = {b}')
print(f'c   = {c}')
print(f'K   = \n{K}\n')

print(f'a+b  = {a+b}\n')
print(f'a*b  = {a*b}\n')
print(f'a**b = {a**b}\n')

print(f'c+b  = {c+b}\n')
print(f'c*b  = {c*b}\n')
print(f'c**b = {c**b}\n')
print(f'b**c = {b**c}\n')

print(f'a.min() = {a.min()}\n')
print(f'a.max() = {a.max()}\n')

print(f'K.min()        = {K.min()}\n')
print(f'K.max(axis=0)  = {K.max(axis=0)}\n')
print(f'K.sum(axis=1)  = {K.sum(axis=1)}\n')
print(f'K.prod(axis=0) = {K.prod(axis=0)}\n')

print(f'K@a = \n{K@a}\n')

print(f'K@acol = \n{K@acol}\n')