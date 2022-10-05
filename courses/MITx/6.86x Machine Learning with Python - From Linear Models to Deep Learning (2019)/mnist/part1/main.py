import sys
import numpy as np
import matplotlib.pyplot as plt
sys.path.append("..")
from utils import *
from linear_regression import *
from svm import *
from softmax import *
from features import *
from kernel import *

#######################################################################
# 1. Introduction
#######################################################################

# Load MNIST data:
train_x, train_y, test_x, test_y = get_MNIST_data()
# Plot the first 20 images of the training set.
#plot_images(train_x[0:20, :])

#######################################################################
# 2. Linear Regression with Closed Form Solution
#######################################################################

# TODO: first fill out functions in linear_regression.py, or the below functions will not work

def run_linear_regression_on_MNIST(lambda_factor=1):
    """
    Trains linear regression, classifies test data, computes test error on test set

    Returns:
        Final test error
    """
    train_x, train_y, test_x, test_y = get_MNIST_data()
    train_x_bias = np.hstack([np.ones([train_x.shape[0], 1]), train_x])
    test_x_bias = np.hstack([np.ones([test_x.shape[0], 1]), test_x])
    theta = closed_form(train_x, train_y, lambda_factor)
    test_error = compute_test_error_linear(test_x, test_y, theta)
    return test_error


# Don't run this until the relevant functions in linear_regression.py have been fully implemented.
#print('Linear Regression test_error =', run_linear_regression_on_MNIST(lambda_factor=1))
#print('Linear Regression test_error =', run_linear_regression_on_MNIST(lambda_factor=0.1))
#print('Linear Regression test_error =', run_linear_regression_on_MNIST(lambda_factor=0.01))


#######################################################################
# 3. Support Vector Machine
#######################################################################

# TODO: first fill out functions in svm.py, or the below functions will not work

def run_svm_one_vs_rest_on_MNIST():
    """
    Trains svm, classifies test data, computes test error on test set

    Returns:
        Test error for the binary svm
    """
    train_x, train_y, test_x, test_y = get_MNIST_data()
    train_y[train_y != 0] = 1
    test_y[test_y != 0] = 1
    pred_test_y = one_vs_rest_svm(train_x, train_y, test_x)
    test_error = compute_test_error_svm(test_y, pred_test_y)
    return test_error


#print('SVM one vs. rest test_error:', run_svm_one_vs_rest_on_MNIST())


def run_multiclass_svm_on_MNIST():
    """
    Trains svm, classifies test data, computes test error on test set

    Returns:
        Test error for the binary svm
    """
    train_x, train_y, test_x, test_y = get_MNIST_data()
    pred_test_y = multi_class_svm(train_x, train_y, test_x)
    test_error = compute_test_error_svm(test_y, pred_test_y)
    return test_error


#print('Multiclass SVM test_error:', run_multiclass_svm_on_MNIST())

#######################################################################
# 4. Multinomial (Softmax) Regression and Gradient Descent
#######################################################################

# TODO: first fill out functions in softmax.py, or run_softmax_on_MNIST will not work

def run_softmax_on_MNIST(temp_parameter=1):
    """
    Trains softmax, classifies test data, computes test error, and plots cost function

    Runs softmax_regression on the MNIST training set and computes the test error using
    the test set. It uses the following values for parameters:
    alpha = 0.3
    lambda = 1e-4
    num_iterations = 150

    Saves the final theta to ./theta.pkl.gz

    Returns:
        Final test error
    """
    train_x, train_y, test_x, test_y = get_MNIST_data()
    theta, cost_function_history = softmax_regression(train_x, train_y, temp_parameter, alpha= 0.3, lambda_factor = 1.0e-4, k = 10, num_iterations = 150)
    plot_cost_function_over_time(cost_function_history)
    test_error = compute_test_error(test_x, test_y, theta, temp_parameter)
    # Save the model parameters theta obtained from calling softmax_regression to disk.
    write_pickle_data(theta, "./theta.pkl.gz")

    # TODO: add your code here for the "Using the Current Model" question in tab 4.
    #      and print the test_error_mod3
    pred_y = get_classification(test_x, theta, temp_parameter)
    (pred_y, test_y) = update_y(pred_y, test_y)
    test_error = 1 - np.mean(pred_y == test_y)
    return test_error

#print('softmax test_error=', run_softmax_on_MNIST(temp_parameter=1))

# TODO: Find the error rate for temp_parameter = [.5, 1.0, 2.0]
#      Remember to return the tempParameter to 1, and re-run run_softmax_on_MNIST
#print('softmax test_error=', run_softmax_on_MNIST(temp_parameter=0.5))
#print('softmax test_error=', run_softmax_on_MNIST(temp_parameter=2.0))
#print('softmax test_error=', run_softmax_on_MNIST(temp_parameter=1.0))

#######################################################################
# 6. Changing Labels
#######################################################################

#pragma: coderesponse template
def run_softmax_on_MNIST_mod3(temp_parameter=1):
    """
    Trains Softmax regression on digit (mod 3) classifications.

    See run_softmax_on_MNIST for more info.
    """
    #YOUR CODE HERE
    train_x, train_y, test_x, test_y = get_MNIST_data()
    (train_y, test_y) = update_y(train_y, test_y)
    theta, cost_function_history = softmax_regression(train_x, train_y, temp_parameter, alpha= 0.3, lambda_factor = 1.0e-4, k = 10, num_iterations = 150)
    plot_cost_function_over_time(cost_function_history)
    test_error = compute_test_error(test_x, test_y, theta, temp_parameter)
    return test_error
   #pragma: coderesponse end


# TODO: Run run_softmax_on_MNIST_mod3(), report the error rate
#print('softmax test_error mod3=', run_softmax_on_MNIST_mod3(temp_parameter=1.0))



#######################################################################
# 7. Classification Using Manually Crafted Features
#######################################################################

## Dimensionality reduction via PCA ##

# TODO: First fill out the PCA functions in features.py as the below code depends on them.
'''
n_components = 18
pcs = principal_components(train_x)
train_pca = project_onto_PC(train_x, pcs, n_components)
test_pca = project_onto_PC(test_x, pcs, n_components)
# train_pca (and test_pca) is a representation of our training (and test) data
# after projecting each example onto the first 18 principal components.
temp_parameter = 1.0
# TODO: Train your softmax regression model using (train_pca, train_y)
#       and evaluate its accuracy on (test_pca, test_y).
theta, cost_function_history = softmax_regression(train_pca, train_y, temp_parameter, alpha= 0.3, lambda_factor = 1.0e-4, k = 10, num_iterations = 150)
plot_cost_function_over_time(cost_function_history)
test_error = compute_test_error(test_pca, test_y, theta, temp_parameter)
print('softmax test_error PCA=', test_error)


# TODO: Use the plot_PC function in features.py to produce scatterplot
#       of the first 100 MNIST images, as represented in the space spanned by the
#       first 2 principal components found above.
plot_PC(train_x[range(100),], pcs, train_y[range(100)])


# TODO: Use the reconstruct_PC function in features.py to show
#       the first and second MNIST images as reconstructed solely from
#       their 18-dimensional principal component representation.
#       Compare the reconstructed images with the originals.
firstimage_reconstructed = reconstruct_PC(train_pca[0, ], pcs, n_components, train_x)
plot_images(firstimage_reconstructed)
plot_images(train_x[0,])

secondimage_reconstructed = reconstruct_PC(train_pca[1, ], pcs, n_components, train_x)
plot_images(secondimage_reconstructed)
plot_images(train_x[1,])
'''

'''

## Cubic Kernel ##
# TODO: Find the 10-dimensional PCA representation of the training and test set
n_components = 10
pcs = principal_components(train_x)
train_pca10 = project_onto_PC(train_x, pcs, n_components)
test_pca10 = project_onto_PC(test_x, pcs, n_components)
# train_pca (and test_pca) is a representation of our training (and test) data
# after projecting each example onto the first 18 principal components.


# TODO: First fill out cubicFeatures() function in features.py as the below code requires it.

train_cube = cubic_features(train_pca10)
test_cube = cubic_features(test_pca10)
# train_cube (and test_cube) is a representation of our training (and test) data
# after applying the cubic kernel feature mapping to the 10-dimensional PCA representations.


# TODO: Train your softmax regression model using (train_cube, train_y)
#       and evaluate its accuracy on (test_cube, test_y).
temp_parameter = 1.0
theta, cost_function_history = softmax_regression(train_cube, train_y, temp_parameter, alpha= 0.3, lambda_factor = 1.0e-4, k = 10, num_iterations = 150)
plot_cost_function_over_time(cost_function_history)
test_error = compute_test_error(test_cube, test_y, theta, temp_parameter)
print('softmax test_error PCA feature cube=', test_error)
'''

import matplotlib.pylab as plt
import seaborn as sns
k = 10
d = 784
t = []
v = []
plt.figure(figsize=(20,15))
#plt.subplots_adjust(0,0,1,1,0.05,0.05)
theta = np.random.random((k, d))
i = 1
for temp_parameter in range(1, 20, 2):
	probs = compute_probabilities(test_x, theta, temp_parameter)
	classes = np.argmax(probs, axis=0)
	#print(classes)
	probs = probs[1,np.where(classes==4)].ravel()
	#labels = test_y[np.where(classes==2)]
	#print(probs)
	plt.subplot(3,4,i), 
	#plt.bar(range(len(probs)), probs), 
	sns.kdeplot(probs, shade=True, color="r")
	#plt.hist(labels)
	plt.xlabel('class label=3'), plt.ylabel('prob'), plt.title('temp_parameter={}'.format(temp_parameter))
	t.append(temp_parameter)
	v.append(np.var(probs))
	#v.append(np.var(labels))
	i += 1
plt.subplot(3,4,12), plt.plot(t, v, 'r.-'), plt.xlabel('temperature'), plt.ylabel('variance')
plt.savefig('temp.png', bbox_in='tight', pad_in=0, dpi=100)
#plt.show()