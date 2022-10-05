import numpy as np

def theta(labels, coords, mistakes):
	return np.sum([mistakes[i]*labels[i]*coords[i] for i in range(len(labels))], axis=0)

def theta_0(labels, coords, mistakes):
	return np.sum([mistakes[i]*labels[i] for i in range(len(labels))])

labels = np.array([-1,-1,-1,-1,-1,+1,+1,+1,+1,+1])
coords = np.array([[0,0],[2,0],[3,0],[0,2],[2,2],[5,1],[5,2],[2,4],[4,4],[5,5]])
mistakes = np.array([1,9,10,5,9,11,0,3,1,1])
#print(theta(labels, coords, mistakes))
#print(theta_0(labels, coords, mistakes))

def pegasos_single_step_update(
        feature_vector,
        label,
        L,
        eta,
        current_theta,
        current_theta_0):
    return ((1-eta*L)*current_theta + eta*label*feature_vector, current_theta_0 + eta*label) if label*(current_theta@feature_vector + current_theta_0) <= 1 else ((1-eta*L)*current_theta, current_theta_0)

def pegasos(feature_matrix, labels, T, L):
    theta, theta_0 = np.zeros(feature_matrix.shape[1]), 0
    t1 = 1
    for t in range(T):
        for i in range(feature_matrix.shape[0]):
            eta = 1 / np.sqrt(t1)
            (theta, theta_0) = pegasos_single_step_update(feature_matrix[i,:], labels[i], L, eta, theta, theta_0)
            t1 += 1
    return (theta, theta_0)
	
#th, th_0 = pegasos(coords, labels, 10000, 0)
#print(th, th_0)

def hinge_loss_single(feature_vector, label, theta, theta_0):
    return max(0, 1-label*(theta@feature_vector + theta_0))

#theta, theta_0 = [1,1], -5
#theta, theta_0 = [1/2,1/2], -5/2
#losses = [hinge_loss_single(coords[i], labels[i], theta, theta_0) for i in range(len(labels))]
#print(losses, sum(losses))

def feature_map(X):
	return np.array([[x[0]**2, np.sqrt(2)*x[0]*x[1], x[1]**2] for x in X])
	
coords = np.array([[0,0],[2,0],[1,1],[0,2],[3,3],[4,1],[5,2],[1,4],[4,4],[5,5]])
coords = feature_map(coords)
labels = np.array([-1,-1,-1,-1,-1,+1,+1,+1,+1,+1])
mistakes = np.array([1,65,11,31,72,30,0,21,4,15])
#theta = theta(labels, coords, mistakes)
#theta_0 = theta_0(labels, coords, mistakes)
#print(theta, theta_0)
#print(coords@theta+theta_0)
#print(labels)

import matplotlib.pyplot as plt 
import numpy as np    

def abline(slope, intercept, lty='--', col='r'):
    """Plot a line from slope and intercept"""
    plt.xlim(-4,4)
    plt.ylim(-4,4)
    axes = plt.gca()
    x_vals = np.array(axes.get_xlim())
    y_vals = intercept + slope * x_vals
    plt.plot(x_vals, y_vals, lty, color=col)

theta = np.array([1,1])
theta_0 = 0	
x = [-0.05,0.85]
#x = [0.1,1.1]
eta, etalam = 1, 0.3
plt.plot(x[0], x[1], '.b')
abline(-theta[0]/theta[1], -theta_0/theta[1], '-')
abline(-theta[0]/theta[1], (-theta_0-1)/theta[1])
abline(-theta[0]/theta[1], (-theta_0+1)/theta[1])
#theta = etalam*theta
theta = etalam*theta + eta*x
abline(-theta[0]/theta[1], -theta_0/theta[1], '-', 'g')
abline(-theta[0]/theta[1], (-theta_0-1)/theta[1], '--', 'g')
abline(-theta[0]/theta[1], (-theta_0+1)/theta[1], '--', 'g')
plt.grid()
plt.gca().xaxis.set_major_locator(plt.MultipleLocator(1))
plt.gca().yaxis.set_major_locator(plt.MultipleLocator(1))
plt.show()