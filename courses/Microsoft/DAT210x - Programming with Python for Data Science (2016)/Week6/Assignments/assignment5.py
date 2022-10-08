import pandas as pd

# cd 'C:/courses/Edx/Current/Microsoft DAT210x Programming with Python for Data Science/Week6/Assignments/Datasets/'

#https://archive.ics.uci.edu/ml/machine-learning-databases/mushroom/agaricus-lepiota.names

# 
# TODO: Load up the mushroom dataset into dataframe 'X'
# Verify you did it properly.
# Indices shouldn't be doubled.
# Header information is on the dataset's website at the UCI ML Repo
# Check NA Encoding
#
# .. your code here ..

# INFO: An easy way to show which rows have nans in them
#print X[pd.isnull(X).any(axis=1)]
X = pd.read_csv('agaricus-lepiota.data', header=None)
X.head()
print X[pd.isnull(X).any(axis=1)]

# 
# TODO: Go ahead and drop any row with a nan
#
# .. your code here ..
print X.shape


#
# TODO: Copy the labels out of the dset into variable 'y' then Remove
# them from X. Encode the labels, using the .map() trick we showed
# you in Module 5 -- canadian:0, kama:1, and rosa:2
#
# .. your code here ..
y = X[0].copy()
X.drop(labels=[0], inplace=True, axis=1)
y = y.map({'p':0, 'e':1})


#
# TODO: Encode the entire dataset using dummies
#
# .. your code here ..
X = pd.get_dummies(X,columns=X.columns)
X.head()


# 
# TODO: Split your data into test / train sets
# Your test size can be 30% with random_state 7
# Use variable names: X_train, X_test, y_train, y_test
#
# .. your code here ..
from sklearn.cross_validation import train_test_split
data_train, data_test, label_train, label_test = train_test_split(X, y, test_size=0.3, random_state=7)



#
# TODO: Create an DT classifier. No need to specify any parameters
#
# .. your code here ..
from sklearn import tree
dtree = tree.DecisionTreeClassifier() #, criterion="entropy")

 
#
# TODO: train the classifier on the training data / labels:
# TODO: score the classifier on the testing data / labels:
#
# .. your code here ..
dtree.fit(data_train, label_train)
score = dtree.score(data_test, label_test)
  
print "High-Dimensionality Score: ", round((score*100), 3)


#
# TODO: Use the code on the courses SciKit-Learn page to output a .DOT file
# Then render the .DOT to .PNGs. Ensure you have graphviz installed.
# If not, `brew install graphviz`.
#
# .. your code here ..
# .DOT files can be rendered to .PNGs, if you've already `brew install graphviz`.
tree.export_graphviz(dtree.tree_, out_file='tree.dot', feature_names=X.columns)
from subprocess import call
call(['dot', '-T', 'png', 'tree.dot', '-o', 'tree.png'])

import pydot

graph = pydot.graph_from_dot_file('tree.dot')
graph.write_png('tree.png')

