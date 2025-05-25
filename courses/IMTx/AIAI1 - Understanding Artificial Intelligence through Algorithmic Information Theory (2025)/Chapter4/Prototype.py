################################################################################
# Understanding Artificial Intelligence through Algorithmic Information Theory #
# MOOC "AIAI" on EdX            -        see:   https://aiai.telecom-paris.fr/ #
# Institut Mines Telecom  2021  - J.-L. Dessalles with Pierre-Alexandre Murena #
################################################################################

# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt
from sklearn.neighbors import KNeighborsClassifier
from sklearn.cluster import KMeans
from scipy.optimize import fmin_bfgs
from collections import Counter

from sklearn.datasets import load_iris, load_diabetes, make_moons

___Correction = 1

###############################################################################
# Datasets
###############################################################################

def Load_dataset(DatasetName):
	if DatasetName == 'Iris':
		# Iris dataset
		data = load_iris(return_X_y=True)
		Dataset = {	'Name':'Iris',
					'X': data[0],
					'y': data[1],
				}
	elif DatasetName == 'Diabetes':
		# Diabetes dataset
		data = load_diabetes(return_X_y=True)
		Dataset = {	'Name':'Diabetes',
					'X': data[0],
					'y': data[1],
				}
	elif DatasetName == 'Half moons':
		# Half-moons dataset
		Dataset = {'Name': 'Half moons'}
		Dataset['X'], Dataset['y']  = make_moons(n_samples=2000, noise=.05, random_state=0)
	else:
		raise ValueError('Unknown dataset name: %s' % DatasetName)
	return Dataset

###############################################################################
# UTILS
###############################################################################

def abs_app(x, rho=1e-5):
	""" absolute value with a slight deviation """
	return np.sqrt(x**2 + rho)


def associatePointToPrototype(X, P):
	""" finds the closest prototype """
	classifier = KNeighborsClassifier(n_neighbors=1, algorithm='ball_tree')
	nn = classifier.fit(P, range(P.shape[0]))
	return nn.predict(X)

def initializePrototypes(X, Y, K):
	""" selects K prototypes """
	i0 = np.where(Y == 0)[0]	# indices for which Y == 0
	i1 = np.where(Y == 1)[0]	# indices for which Y == 1
	Proportion_0 = len(i0) / (len(i0) + len(i1))
	# n0 = int(max(1, (len(i1) * K) / (len(i0) + len(i1))))
	n0 = int(max(1, K * Proportion_0))
	n1 = K - n0
	p0 = np.random.permutation(i0)[:n0]	# indices of selected 0-prototypes
	p1 = np.random.permutation(i1)[:n1]	# indices of selected 1-prototypes
	Prototypes = np.vstack((X[p0,:], X[p1,:]))	# putting prototypes together 
	Prototype_signature = np.hstack((np.zeros((n0)), np.ones((n1))))	# [0,0,..0,1,...1]
	return Prototypes, Prototype_signature

def changePrototypeClasses(K, NearestPrototype, Y):
	Yp = np.zeros(K)
	for k in range(K):
		ik = np.where(NearestPrototype == k)
		yk = Y[ik]
		Yp[k], _ = Counter(yk).most_common(1)[0]
	return Yp

def classifyWithModel(X, P, Yp):
	NearestPrototype = associatePointToPrototype(X, P)
	return Yp[NearestPrototype]
	
###############################################################################
# BASIC COMPLEXITIES
###############################################################################

def Cmatrix(M):
	""" Complexity = sum of complexities of components """
	return np.sum(np.log2(1 + abs_app(M)))

def gradCmatrix(M):
	return np.sign(M) / (1.0 + abs_app(M))

def C_prototypes(M):
	return Cmatrix(M) + np.log2(M.shape[0])

def C_data_knowing_prototypes(D, P):
	NearestPrototype = associatePointToPrototype(D, P)
	return Cmatrix(D - P[NearestPrototype,:])

def globalComplexity_clustering(X, P):
	return C_prototypes(P) + C_data_knowing_prototypes(X, P)

###############################################################################
# UNSUPERVISED LEARNING
###############################################################################

###### Clustering

def runKMeans(X, K, seed=42):
	""" Runs K-Means algorithm with K clusters """
	kmeans = KMeans(n_clusters=K, random_state=seed).fit(X)
	return kmeans.cluster_centers_

def compareComplexitiesWithKMeans(X, K):
	""" Outputs the global complexity after K-Means and before compression """
	M = runKMeans(X, K)
	return Cmatrix(X), globalComplexity_clustering(X, M)


###### Anomaly Detection

def getCompressionRates(X, P):
	NearestPrototype = associatePointToPrototype(X, P)
	XminusP = X - P[NearestPrototype,:]
	C_after_clustering = np.apply_along_axis(Cmatrix, 1, XminusP)
	C_before_clustering = np.apply_along_axis(Cmatrix, 1, X)
	return C_after_clustering / C_before_clustering

def plotRateHistogram(RateValues):
	plt.hist(RateValues, bins='auto')
	plt.figtext(0.6, 0.6, 'Press [Enter]', fontsize=16)
	plt.title('Distribution of compression rates\n(0 = best compression  --  1 = no compression)')
	# plt.show()
	try:
		plt.waitforbuttonpress(0)
		plt.close() 
	except Exception:	pass

def anomalyDetection(X, K, threshold, visualize=False):
	""" Outputs index of abnormal input points """
	M = runKMeans(X, K)
	compressionRates = getCompressionRates(X, M)
	if visualize:
		plotRateHistogram(compressionRates)
	if True:
		# ........  To be changed ........
		# Replace the return line below.
		# To do so, use the numpy function 'where' to select suitable points in compressionRates
		# (note: np.where is used several times in this program)
		return np.where(compressionRates > threshold)
		# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


	
###############################################################################
# SUPERVISED LEARNING
###############################################################################

def trainModel(X, Y, K, eps=1e-3, n_max = 10):
	P, Yp = initializePrototypes(X, Y, K)
	P_line = np.reshape(P, (1, -1))[0]
	complexities = []
	n = 0
	
	# Associate point to prototype
	NearestPrototype = associatePointToPrototype(X, P)
	
	while True:
		# Define complexity
		def complexity(P):
			PP = np.reshape(P, (K, -1))
			XminusP = X - PP[NearestPrototype,:]
			return C_prototypes(PP) + Cmatrix(XminusP)
		
		# Optimization
		P_line = fmin_bfgs(complexity, P_line)
		P = np.reshape(P_line, (K, -1))
		complexities.append(complexity(P_line))
		
		# Change prototype classes
		NearestPrototype = associatePointToPrototype(X, P)
		Yp = changePrototypeClasses(K, NearestPrototype, Y)
		
		# Count errors (correction term)
		n_errors = sum(Y != Yp[NearestPrototype])
		complexities[n-1] = complexities[n-1] + n_errors * (1 + np.log2(K))
		
		# Checking for convergence
		n = n + 1
		if n > 1:
			deltaC = np.abs(complexities[n - 1] - complexities[n - 2])
		if (n > n_max or (n > 1 and deltaC / complexities[n - 2] < eps)):
			return P, Yp, complexities



def trainAndTestModel(X_train, Y_train, X_test, Y_test, K_max=10):
	n_errors_train = []
	n_errors_test = []
	complexities = []
	for k in range(K_max):
		P, Yp, c_k = trainModel(X_train, Y_train, k, eps=1e-3, n_max = 10)
		complexities.append(c_k[len(c_k)-1]) # Stores global complexity for the model k
		
		# TODO: Apply learned classifier on test and train data ()
		# You can use the function classifyWithModel
		Y_train_predict = 0 
		Y_test_predict = 0
		
		# TODO: Count number of errors between Y_train and Y_train_predict
		# and between Y_test and Y_test_predict
		n_errors_train.append(0)
		n_errors_test.append(0)
	
	plt.figure()
	plt.plot(n_errors_train)
	plt.title("Number of errors (training)")
	plt.show()
	
	plt.figure()
	plt.plot(n_errors_test)
	plt.title("Number of errors (test)")
	plt.show()
	return 0


###############################################################################
# TRANSDUCTION
###############################################################################
	

def transduction(Xs, Ys, Xt, C, seed=42):
	np.random.seed(seed)
	P, Yp = initializePrototypes(Xs, Ys, C)
	
	# Build network
	nn = KNeighborsClassifier(n_neighbors=1, algorithm='ball_tree').fit(P)
	nearestProto = nn.predict(Xs)
	
	return P

	
if __name__ == "__main__":	
	
	import warnings
	warnings.filterwarnings('ignore')

	# Choosing dataset
	# ================
	# DatasetName = 'Iris'
	DatasetName = 'Diabetes'
	# DatasetName = 'Half moons'
	Dataset = Load_dataset(DatasetName)
	
	K = 42 #3 #7	# number of prototypes
	
	# Running K-Means
	# ================
	if True: #False: #True:
		print("%s dataset (%d points) with %d prototypes:" % (Dataset['Name'], len(Dataset['X']), K))
		print("-------------------------------")
		print(">> prototypes found by K-Means:")
		print(runKMeans(Dataset['X'], K))
		print("\n>> Complexity reduction when using K-Means:")
		print("Dataset complexity:\t\t%d\nComplexity after K-Means:\t%d" \
			% compareComplexitiesWithKMeans(Dataset['X'], K))
	else:
		L = []
		for K in range(1, 100, 1):
			L.append((K, compareComplexitiesWithKMeans(Dataset['X'], K)))
			print(L[-1])
		print()
		print(min(L, key=lambda x: x[1][1]))
		

	print('Anomalies (indices):', end='\t')
	print(anomalyDetection(Dataset['X'], K, threshold=0.9, visualize=True)[0])

__author__ = 'Murena'
