# Some examples of views vs copies with ndarrays

import numpy as np

a = np.array([ 0., 1., -2.,  3.])

r = a.reshape((2,2))

rc = (a.reshape((2,2))).copy()

K = np.array(
    [
     [2., 3., -1., 0.],
     [-1., 2., 4., 0.5],
     [10.2, 3.14, -2.1, 0.776]
     ])

V = K[1:3,0:4:2]

C = K[1:3,0:4:2].copy()
