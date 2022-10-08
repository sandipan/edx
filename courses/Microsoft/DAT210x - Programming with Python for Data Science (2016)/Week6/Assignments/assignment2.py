import pandas as pd

# cd 'C:/courses/Edx/Current/Microsoft DAT210x Programming with Python for Data Science/Week6/Assignments/Datasets/'

# The Dataset comes from:
# https://archive.ics.uci.edu/ml/datasets/Optical+Recognition+of+Handwritten+Digits


# At face value, this looks like an easy lab;
# But it has many parts to it, so prepare yourself before starting...


def load(path_test, path_train):
  # Load up the data.
  # You probably could have written this..
  with open(path_test, 'r')  as f: testing  = pd.read_csv(f)
  with open(path_train, 'r') as f: training = pd.read_csv(f)

  # The number of samples between training and testing can vary
  # But the number of features better remain the same!
  n_features = testing.shape[1]

  X_test  = testing.ix[:,:n_features-1]
  X_train = training.ix[:,:n_features-1]
  y_test  = testing.ix[:,n_features-1:].values.ravel()
  y_train = training.ix[:,n_features-1:].values.ravel()

  #
  # Special:
  num_train = int(round(0.04*X_train.shape[0]))
  print num_train
  X_train = X_train.ix[:(num_train-1),:]
  y_train = y_train[:num_train]
  
  return X_train, X_test, y_train, y_test


def peekData():
  # The 'targets' or labels are stored in y. The 'samples' or data is stored in X
  print "Peeking your data..."
  fig = plt.figure()

  cnt = 0
  for col in range(5):
    for row in range(10):
      plt.subplot(5, 10, cnt + 1)
      plt.imshow(X_train.ix[cnt,:].reshape(8,8), cmap=plt.cm.gray_r, interpolation='nearest')
      plt.axis('off')
      cnt += 1
  fig.set_tight_layout(True)
  plt.show()


def drawPredictions():
  fig = plt.figure()

  # Make some guesses
  y_guess = model.predict(X_test)


  #
  # INFO: This is the second lab we're demonstrating how to
  # do multi-plots using matplot lab. In the next assignment(s),
  # it'll be your responsibility to use this and assignment #1
  # as tutorials to add in the plotting code yourself!
  num_rows = 10
  num_cols = 5

  index = 0
  for col in range(num_cols):
    for row in range(num_rows):
      plt.subplot(num_cols, num_rows, index + 1)

      # 8x8 is the size of the image, 64 pixels
      plt.imshow(X_test.ix[index,:].reshape(8,8), cmap=plt.cm.gray_r, interpolation='nearest')

      # Green = Guessed right
      # Red = Fail!
      fontcolor = 'g' if y_test[index] == y_guess[index] else 'r'
      plt.title('Label: %i' % y_guess[index], fontsize=6, color=fontcolor)
      plt.axis('off')
      index += 1
  fig.set_tight_layout(True)
  plt.show()

#
# TODO: Pass in the file paths to the .tes and the .tra files
X_train, X_test, y_train, y_test = load('optdigits.tes', 'optdigits.tra')

import matplotlib.pyplot as plt
from sklearn import svm

# 
# Get to know your data. It seems its already well organized in
# [n_samples, n_features] form. Our dataset looks like (4389, 784).
# Also your labels are already shaped as [n_samples].
peekData()


#
# TODO: Create an SVC classifier. Leave C=1, but set gamma to 0.001
# and set the kernel to linear. Then train the model on the testing
# data / labels:
print "Training SVC Classifier..."
#
# .. your code here ..
C = 1 #1
gamma = 0.1
#kernel = 'linear'
#kernel = 'poly'
kernel = 'rbf'
from sklearn.svm import SVC
model = SVC(kernel=kernel)

from sklearn.grid_search import GridSearchCV
params = {"C":[0.1, 1, 10], "gamma": [0.1, 0.01, 0.001]}
grid_search = GridSearchCV(model, params)
grid_search.fit(X_train, y_train)
grid_search.score(X_test, y_test)
grid_search.best_params_

SVC(C=C, cache_size=200, class_weight=None, coef0=0.0,
  #decision_function_shape=None, 
  degree=3, kernel=kernel,
  max_iter=-1, probability=False, random_state=None, shrinking=True,
  tol=0.001, verbose=False)
model.fit(X_train, y_train)


# TODO: Calculate the score of your SVC against the testing data
print "Scoring SVC Classifier..."
#
# .. your code here ..
score = model.score(X_test, y_test)
print "Score:\n", score


# Visual Confirmation of accuracy
drawPredictions()


#
# TODO: Print out the TRUE value of the 1000th digit in the test set
#
# .. your code here ..
true_1000th_test_value = y_test[1000]
print "1000th test label: ", true_1000th_test_value


#
# TODO: Predict the value of the 1000th digit in the test set.
# Was your model's prediction correct?
# INFO: If you get a warning on your predict line, look at the
# notes from the previous module's labs.
#
# .. your code here ..
guess_1000th_test_value = model.predict(X_test.iloc[1000])
print "1000th test prediction: ", guess_1000th_test_value


#
# TODO: Use IMSHOW to display the 1000th test image, so you can
# visually check if it was a hard image, or an easy image
#
# .. your code here ..
fig = plt.figure()
ax1 = fig.add_subplot(111)
ax1.imshow(X_test.iloc[1000].reshape(8,8), cmap=plt.cm.gray, interpolation='nearest', origin='lower', extent=[0,1,0,1])


#
# TODO: Were you able to beat the USPS advertised accuracy score
# of 98%? If so, STOP and answer the lab questions. But if you
# weren't able to get that high of an accuracy score, go back
# and change your SVC's kernel to 'poly' and re-run your lab
# again.



#
# TODO: Were you able to beat the USPS advertised accuracy score
# of 98%? If so, STOP and answer the lab questions. But if you
# weren't able to get that high of an accuracy score, go back
# and change your SVC's kernel to 'rbf' and re-run your lab
# again.



#
# TODO: Were you able to beat the USPS advertised accuracy score
# of 98%? If so, STOP and answer the lab questions. But if you
# weren't able to get that high of an accuracy score, go back
# and tinker with your gamma value and C value until you're able
# to beat the USPS. Don't stop tinkering until you do. =).


#################################################

#
# TODO: Once you're able to beat the +98% accuracy score of the
# USPS, go back into the load() method. Look for the line that
# reads "# Special:"
#
# Immediately under that line, alter X_train and y_train ONLY.
# Keep just the ___FIRST___ 4% of the samples. In other words,
# for every 100 samples found, throw away 96 of them. Make sure
# all the samples (and labels) you keep come from the start of
# X_train and y_train.

# If the first 4% is a decimal number, then use int + ceil to
# round up to the nearest whole integer.

# That operation might require some Pandas indexing skills, or
# perhaps some numpy indexing skills if you'd like to go that
# route. Feel free to ask on the class forum if you want; but
# try to exercise your own muscles first, for at least 30
# minutes, by reviewing the Pandas documentation and stack
# overflow. Through that, in the process, you'll pick up a lot.
# Part of being a machine learning practitioner is know what
# questions to ask and where to ask them, so this is a great
# time to start!

# Re-Run your application after throwing away 96% your training
# data. What accuracy score do you get now?




#
# TODO: Lastly, change your kernel back to linear and run your
# assignment one last time. What's the accuracy score this time?
# Surprised?

