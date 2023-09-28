###############################################################################
# IntroToCSE
# mylinsolver.py

"""
This Python module implements Gaussian elimination to solve Ku=f
    where:
        K: 2D NumPy array that is an mxm square matrix
        f: NumPy array of length m
        u: is calculated and will be a NumPy array of length m
"""

import numpy as np

def myGE(K, f):
    """
    Gaussian elimination (without vectorization)
    """
    m,n = K.shape
    assert m == n, "Non-square matrix"

    u = np.zeros(n)

    # Extended matrix with the right-hand side as last column
    A = np.zeros((n,n+1))
    A[:,0:n] = K
    A[:,n] = f

    # Elimination of nonzero elements below the diagonal
    for i in range(n):
        assert A[i,i] != 0.0, "Zero pivot detected"

        for j in range(i+1,n):
            Lji = A[j,i] / A[i,i]

            for k in range(i+1,n+1):
                A[j,k] = A[j,k] - Lji * A[i,k]

    # Back substitution
    u[n-1] = A[n-1,n]/A[n-1,n-1]

    for i in range(n-2,-1,-1):
        u[i] = A[i,n]

        for j in range(i+1,n):
            u[i] = u[i] -  A[i,j]*u[j]

        u[i] = u[i] / A[i,i]

    return u


def myGE_vec(K, f):
    """
    Gaussian elimination (with vectorization)
    """
    m,n = K.shape
    assert m == n, "Non-square matrix"

    u = np.zeros(n)

    # Extended matrix with the right-hand side as last column
    A = np.zeros((n,n+1))
    A[:,0:n] = K
    A[:,n] = f

    # Elimination of nonzero elements below the diagonal
    for i in range(n):
        assert A[i,i] != 0.0, "Zero pivot detected"

        # Calculate Li which is the vector of all Lji values (for all values of j)
        # TODO
        raise NotImplementedError("Vectorized calculation of Li not implemented")

        # Update A[i+1:n,i+1:]
        # Hint: consider using an outer product of Li and the relevant
        #       portion of the A matrix (np.outer is the NumPy command)
        # TODO
        raise NotImplementedError("Vectorized update of A[i+1:n,i+1:] not implemented")


    # Back substitution
    u[n-1] = A[n-1,n]/A[n-1,n-1]

    for i in range(n-2,-1,-1):
        # Calculate u[i].
        # Hint: the np.dot command will be useful
        # TODO
        raise NotImplementedError("Vectorized calculation of u[i] not implemented")

    return u

if __name__ == "__main__":
    # Test myGE
    K = np.array([
        [-6.,  2.,  1.,  0.,  1.],
        [ 1., -4.,  1.,  1.,  0.],
        [ 2.,  0., -5., -1.,  2.],
        [ 0.,  1.,  3., -6.,  1.],
        [-1.,  2.,  0.,  1., -6.],
        ])

    u = np.array([-1.,-2.,1.,2.,0.5])

    f = K@u

    uGE = myGE(K, f)

    print(f"u   = {u}")
    print(f"uGE = {uGE}")
    print(f"Check if uGE = u: {np.allclose(u,uGE)}")

