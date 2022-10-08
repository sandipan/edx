import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib

# cd 'C:/courses/Edx/Current/Microsoft DAT210x Programming with Python for Data Science/Week5/Assignments/Datasets/'

matplotlib.style.use('ggplot') # Look Pretty


def plotDecisionBoundary(model, X, y):
  fig = plt.figure()
  ax = fig.add_subplot(111)

  padding = 0.6
  resolution = 0.0025
  colors = ['royalblue','forestgreen','ghostwhite']

  # Calculate the boundaries
  x_min, x_max = X[:, 0].min(), X[:, 0].max()
  y_min, y_max = X[:, 1].min(), X[:, 1].max()
  x_range = x_max - x_min
  y_range = y_max - y_min
  x_min -= x_range * padding
  y_min -= y_range * padding
  x_max += x_range * padding
  y_max += y_range * padding

  # Create a 2D Grid Matrix. The values stored in the matrix
  # are the predictions of the class at said location
  xx, yy = np.meshgrid(np.arange(x_min, x_max, resolution),
                       np.arange(y_min, y_max, resolution))

  # What class does the classifier say?
  Z = model.predict(np.c_[xx.ravel(), yy.ravel()])
  Z = Z.reshape(xx.shape)

  # Plot the contour map
  plt.contourf(xx, yy, Z, cmap=plt.cm.terrain)
  plt.axis('tight')

  # Plot our original points as well...
  for label in range(len(np.unique(y))):
    indices = np.where(y == label)
    plt.scatter(X[indices, 0], X[indices, 1], c=colors[label], label=str(label), alpha=0.8)

  p = model.get_params()
  plt.title('K = ' + str(p['n_neighbors']))


# 
# TODO: Load up the dataset into a variable called X. Check the .head and
# compare it to the file you loaded in a text editor. Make sure you're
# loading your data properly--don't fail on the 1st step!
#
# .. your code here ..
X = pd.read_csv('wheat.data')
X.head()


#
# TODO: Copy the 'wheat_type' series slice out of X, and into a series
# called 'y'. Then drop the original 'wheat_type' column from the X
#
# .. your code here ..

#y = X['wheat_type']
#X = X.drop('wheat_type', axis=1)
y = X['wheat_type'].copy()
X.drop(labels=['wheat_type', 'id'], inplace=True, axis=1)


# TODO: Do a quick, "nominal" conversion of 'y' by encoding it to a SINGLE
# variable (e.g. 0, 1, 2). This is covered in the Feature Representation
# reading as "Method 1)". In actuality the classification isn't nominal,
# but this is the fastest way to encode you 3 possible wheat types into a
# label that you can plot distinctly. More notes about this on the bottom
# of the assignment.
#
# .. your code here ..
y = y.astype("category").cat.codes


#
# TODO: Basic nan munging. Fill each row's nans with the mean of the feature
#
# .. your code here ..
X = X.fillna(X.mean(axis=0))
#print X[pd.isnull(X).any(axis=1)]

# 
# TODO: Use SKLearn's regular "normalize" preprocessor to normalize X's feature data
#
# .. your code here ..
from sklearn import preprocessing
X = preprocessing.normalize(X) #, norm='l2')

#
# TODO: Project both your X_train and X_test features into PCA space.
# This has to be done because the only way to visualize the decision
# boundary in 2D, would be if your KNN algo ran in 2D as well
#
# .. your code here ..

from sklearn.decomposition import PCA
pca = PCA(n_components=2)
pca.fit(X)
PCA(copy=True, n_components=2, whiten=False)
T = pca.transform(X)
X.shape
T.shape


#
# TODO: Split out your training and testing data.
# INFO: Use 0.33 test size, and use random_state=1. This is important
# so that your answers are verifiable. In the real world, you wouldn't
# specify a random_state.
#
# .. your code here ..
from sklearn.cross_validation import train_test_split
X_train,X_test,y_train,y_test = train_test_split(T,y,test_size=0.33, random_state=1)

#
# TODO: Run KNeighborsClassifier. Start out with K=7 neighbors. NOTE:
# Be sure train your classifier against the PCA transformed feature
# data above! You do not, however, need to transform your labels.
#
# .. your code here ..
from sklearn.neighbors import KNeighborsClassifier

k = 1 # 9
knn = KNeighborsClassifier(n_neighbors=k)
knn.fit(X_train, y_train) 

# HINT: Ensure your KNeighbors classifier object from earlier is called 'knn'.
# This method plots your TEST points against the boundary learned from your
# training data:
plotDecisionBoundary(knn, X_test, y_test)


#
# TODO: Display the accuracy score.
#
# NOTE: You don't have to run .predict before calling .score, since
# .score will take care of running your predictions for the params
# you provided.
#
# .. your code here ..
# You can pass in a dframe or an ndarray
#pred = model.predict(X_test)
#pred = model.predict_proba(X_test)
knn.score(X_test, y_test)

accuracies = []
for k in range(1, 11):
    knn = KNeighborsClassifier(n_neighbors=k)
    knn.fit(X_train, y_train) 
    acc = knn.score(X_test, y_test)
    accuracies.append(acc)
    print(k, acc)
print(accuracies)

#
# BONUS: Instead of the ordinal conversion, try and get this assignment
# working with a proper Pandas get_dummies for feature encoding. HINT:
# You might have to update some of the plotDecisionBoundary code.
X_train,X_test,y_train,y_test = train_test_split(X,y,test_size=0.33, random_state=1)
accuracies2 = []
for k in range(1, 11):
    knn = KNeighborsClassifier(n_neighbors=k)
    knn.fit(X_train, y_train) 
    acc = knn.score(X_test, y_test)
    accuracies2.append(acc)
    print(k, acc)

plt.plot(range(1, 11), accuracies, range(1, 11), accuracies2)
plt.xlabel('k')
plt.ylabel('accuracy')
#plt.legend(loc='upper right')
plt.legend(('PCA Feature space', 'Original Space'),
           scatterpoints=1,
           loc='upper right',
           fontsize=8)

plt.show()

