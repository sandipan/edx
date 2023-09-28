# Some examples of creating of ndarrays

import numpy as np

def print_ndarray_info(x,xname='x'):
    print(f'{xname} =\n{x}')
    print(f'type({xname}) = {type(x)}')
    print(f'{xname}.dtype = {x.dtype}')
    print(f'{xname}.shape = {x.shape}')    

# #----------------------------------------------
# # Single dimensional arrays
# x = np.array([3, 1, 4, 1, 5])
# print_ndarray_info(x,'x')

# print()
# y = np.array([3, 1, 4., 1, 5])
# print_ndarray_info(y,'y')

# print()
# x[2] = 44.689153
# print_ndarray_info(x,'x')

# print()
# z = np.array([3, 1, 4, 1, 5],dtype=np.double)
# print_ndarray_info(z,'z')

# #----------------------------------------------
# # Multi-dimensional arrays
# print()
# A = np.array([[1,2,3],[10,11,12]],dtype=np.double)
# print_ndarray_info(A,'A')

# print()
# T = np.array([[[1,2,3,4],[5,6,7,8],[9,10,11,12]],[[20,21,22,23],[24,25,26,27],[28,29,30,31]]])
# print_ndarray_info(T,'T')

# #----------------------------------------------
# # Creating ndarrays of zeros or ones
# print()
# z1D = np.zeros(3)
# print_ndarray_info(z1D,'z1D')

# print()
# zcol = np.zeros((3,1))
# print_ndarray_info(zcol,'zcol')

# print()
# zrow = np.zeros((1,3))
# print_ndarray_info(zrow,'zrow')

# print()
# z2D = np.zeros((3,6))
# print_ndarray_info(z2D,'z2D')

# print()
# o2D = np.ones((6,3))
# print_ndarray_info(o2D,'o2D')

# #----------------------------------------------
# # Creating 1D ndarrays for sequences with equal spacing
# print()
# slin = np.linspace(0, 4, 17)
# print_ndarray_info(slin,'slin')

# print()
# sarange = np.arange(0, 4, 0.25)
# print_ndarray_info(sarange,'sarange')

# print()
# N = 12
# qlin = np.linspace(2.3, 5.7, N)
# print_ndarray_info(qlin,'qlin')

# print()
# qarange = np.arange(2.3, 5.7, 3.4/(N-1))
# print_ndarray_info(qarange,'qarange')
# print(f'qarange[-1] = {qarange[-1]:0.20e}')

# #----------------------------------------------
# # Creating 1D ndarrays for sequences with log10 spacing
# print()
# slog = np.logspace(-2, 1, 16)
# print_ndarray_info(slog,'slog')

# #----------------------------------------------
# # Creating ndarrays for sequences 
# print()
# qdlin = np.linspace([0,10,100],[1,20,200], 5)
# print_ndarray_info(qdlin,'qdlin')


