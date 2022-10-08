# -*- coding: utf-8 -*-
"""
Created on Sun Jul 17 12:23:26 2016

@author: Sandipan.Dey
"""

# cd 'C:/courses/Edx/Current/Microsoft DAT210x Programming with Python for Data Science/Week2/Assignments/Datasets/'

# Week 2

# manipulating data
from sqlalchemy import create_engine
engine = create_engine('sqlite:///:memory:')

sql_dataframe  = pd.read_sql_table('my_table', engine, columns=['ColA', 'ColB'])
xls_dataframe  = pd.read_excel('my_dataset.xlsx', 'Sheet1', na_values=['NA', '?'])
json_dataframe = pd.read_json('my_dataset.json', orient='columns')
csv_dataframe  = pd.read_csv('my_dataset.csv', sep=',')
table_dataframe= pd.read_html('http://page.com/with/table.html')[0]
my_dataframe.to_sql('table', engine)
my_dataframe.to_excel('dataset.xlsx')
my_dataframe.to_json('dataset.json')
my_dataframe.to_csv('dataset.csv')
my_dataframe.columns = ['new', 'column', 'header', 'labels']
df.head(5)
df.describe()
df.columns
df.index

import pandas as pd
df = pd.read_csv('tutorial.csv')
df
df.col0
df['col0']
df[['col0']]
df.loc[:, 'col0']
df.loc[:, ['col0']]
df.iloc[:, 0]
df.iloc[:, [0]]
df.ix[:, 0]
df[0:1]
df.iloc[0:1, :]
df.col0 < 0
df[ df.col0 < 0 ]
df[ (df.col0<0) | (df.col1<0) ]
df[df < 0] = -100
df

df[['col0', 'col1']][0:2]
df.loc[0:5, ['col0', 'col1']]

animals = pd.read_csv('animals.csv', sep='\t')
animals.columns


# feature representation
ordered_satisfaction = ['Very Unhappy', 'Unhappy', 'Neutral', 'Happy', 'Very Happy']
df = pd.DataFrame({'satisfaction':['Mad', 'Happy', 'Unhappy', 'Neutral']})
df.satisfaction = df.satisfaction.astype("category",
  ordered=True,
  categories=ordered_satisfaction
).cat.codes

df
df = pd.DataFrame({'vertebrates':[ \
'Bird', \
'Bird', \
'Mammal', \
'Fish', \
'Amphibian', \
'Reptile', \
'Mammal', \
]})

# Method 1)
df['vertebrates'] = df.vertebrates.astype("category").cat.codes
df
# Method 2)
df = pd.get_dummies(df,columns=['vertebrates'])
df

from sklearn.feature_extraction.text import CountVectorizer
corpus = [ \
"Authman ran faster than Harry because he is an athlete.", \
"Authman and Harry ran faster and faster.", \
]

bow = CountVectorizer()
X = bow.fit_transform(corpus) # Sparse Matrix
bow.get_feature_names()
X.toarray()
bow.get_feature_names()

# Uses the Image module (PIL)
from scipy import misc
# Load the image up
img = misc.imread('image.png')
# Is the image too big? Shrink it by an order of magnitude
img = img[::2, ::2]
# Scale colors from (0-255) to (0-1), then reshape to 1D Array
X = (img / 255.0).reshape(-1, 3)
# To-Do: Machine Learning with X!
#
#Audio Features
#Audio can be encoded with similar methods as graphical features, with the caveat that your 'audio-image' is already a one-dimensional waveform data type instead of a two-dimensional array of pixels. Rather than looking for graphical gradients, you would look for auditory ones, such as the length of sounds, power and noise ratios, and histogram counts after applying filters.
import scipy.io.wavfile as wavfile
sample_rate, audio_data = wavfile.read('sound.wav')
print audio_data

# wrangling data
df.my_feature.fillna( df.my_feature.mean() )
df.fillna(0)
df.fillna(method='ffill')  # fill the values forward
df.fillna(method='bfill')  # fill the values in reverse
df.fillna(limit=5)
df.interpolate(method='polynomial', order=2)

df = df.dropna(axis=0)  # row 
df = df.dropna(axis=1)  # column
# Drop any row that has at least 4 NON-NaNs within it:
df = df.dropna(axis=0, thresh=4)
# Axis=1 for columns
df = df.drop(labels=['Features', 'To', 'Delete'], axis=1)
df = df.drop_duplicates(subset=['Feature_1', 'Feature_2'])
df = df.reset_index(drop=True)
df = df.dropna(axis=0, thresh=2).drop(labels=['ColA', axis=1]).drop_duplicates(subset=['ColB', 'ColC']).reset_index()
df.dtypes
df.Date = pd.to_datetime(df.Date, errors='coerce')
df.Height = pd.to_numeric(df.Height, errors='coerce')
df.Weight = pd.to_numeric(df.Weight, errors='coerce')
df.Age = pd.to_numeric(df.Age, errors='coerce')
df.dtypes
df.Age.unique()
df.Age.value_counts()

# Week3

# basic plots
import pandas as pd
import matplotlib
matplotlib.style.use('ggplot') # Look Pretty
# If the above line throws an error, use plt.style.use('ggplot') instead
student_dataset = pd.read_csv("/Datasets/students.data", index_col=0)
my_series = student_dataset.G3
my_dataframe = student_dataset[['G3', 'G2', 'G1']] 
my_series.plot.hist(alpha=0.5)
my_dataframe.plot.hist(alpha=0.5)

import pandas as pd
import matplotlib
matplotlib.style.use('ggplot') # Look Pretty
# If the above line throws an error, use plt.style.use('ggplot') instead
student_dataset = pd.read_csv("/Datasets/students.data", index_col=0) student_dataset.plot.scatter(x='G1', y='G3'

import matplotlib
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import pandas as pd
matplotlib.style.use('ggplot') # Look Pretty
student_dataset = pd.read_csv("/Datasets/students.data", index_col=0)
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.set_xlabel('Final Grade')
ax.set_ylabel('First Grade')
ax.set_zlabel('Daily Alcohol')
ax.scatter(student_dataset['G1'], student_dataset['G3'], student_dataset['3Dalc'], c='r', marker='.')
plt.show()

# higher dimensionality
from sklearn.datasets import load_iris
from pandas.tools.plotting import parallel_coordinates
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib
# Look pretty...
matplotlib.style.use('ggplot')
# Load up SKLearn's Iris Dataset into a Pandas Dataframe
data = load_iris()
df = pd.DataFrame(data.data, columns=data.feature_names)
df['target_names'] = [data.target_names[i] for i in data.target]
# Parallel Coordinates Start Here:
plt.figure()
parallel_coordinates(df, 'target_names')
plt.show()

from sklearn.datasets import load_iris
from pandas.tools.plotting import andrews_curves
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib
# Look pretty...
matplotlib.style.use('ggplot')
# Load up SKLearn's Iris Dataset into a Pandas Dataframe
data = load_iris()
df = pd.DataFrame(data.data, columns=data.feature_names)
df['target_names'] = [data.target_names[i] for i in data.target]
# Andrews Curves Start Here:
plt.figure()
andrews_curves(df, 'target_names')
plt.show()

df = pd.DataFrame(np.random.randn(1000, 5), columns=['a', 'b', 'c', 'd', 'e'])
df.corr()
import matplotlib.pyplot as plt
plt.imshow(df.corr(), cmap=plt.cm.Blues, interpolation='nearest')
plt.colorbar()
tick_marks = [i for i in range(len(df.columns))]
plt.xticks(tick_marks, df.columns, rotation='vertical')
plt.yticks(tick_marks, df.columns)
plt.show()

# Week 4
# PCA
from sklearn.decomposition import PCA
pca = PCA(n_components=2)
pca.fit(df)
PCA(copy=True, n_components=2, whiten=False)
T = pca.transform(df)
df.shape
T.shape

# isomap
from sklearn import manifold
iso = manifold.Isomap(n_neighbors=4, n_components=2)
iso.fit(df)
Isomap(eigen_solver='auto', max_iter=None, n_components=2, n_neighbors=4,
    neighbors_algorithm='auto', path_method='auto', tol=0)
manifold = iso.transform(df)
df.shape
manifold.shape


# Week 5
# clustering
from sklearn.cluster import KMeans
kmeans = KMeans(n_clusters=5)
kmeans.fit(df)
KMeans(copy_x=True, init='k-means++', max_iter=300, n_clusters=5, n_init=10,
    n_jobs=1, precompute_distances='auto', random_state=None, tol=0.0001,
    verbose=0)
labels = kmeans.predict(df)
centroids = kmeans.cluster_centers_

# splitting data
from sklearn.cross_validation import train_test_split
data   = [0,1,2,3,4, 5,6,7,8,9]  # input dataframe samples
labels = [0,0,0,0,0, 1,1,1,1,1]  # the function we're training is " >4 "
data_train, data_test, label_train, label_test = train_test_split(data, labels, test_size=0.5, random_state=7)
data_train
label_train
data_test
label_test
from sklearn.metrics import accuracy_score
# Returns an array of predictions:
predictions = my_model.predict(data_test) 
predictions
# The actual answers:
label_train
accuracy_score(label_train, predictions)
accuracy_score(label_train, predictions, normalize=False)

# KNN
# From now on, you only train on a "portion" of your dset:
# Process:
# Load a dataset into a dataframe
X = pd.read_csv('data.set', index_col=0)
# Do basic wrangling, but no transformations
# ...
# Immediately copy out the classification / label / class / answer column
y = X['classification'].copy()
X.drop(labels=['classification'], inplace=True, axis=1)
# Feature scaling as necessary
# ...
# Machine Learning
# ...
# Evaluation
# ...
X_train = pd.DataFrame([ [0], [1], [2], [3] ])
y_train = [0, 0, 1, 1]
from sklearn.neighbors import KNeighborsClassifier
model = KNeighborsClassifier(n_neighbors=3)
model.fit(X_train, y_train) 
# You can pass in a dframe or an ndarray
model.predict([[1.1]])
model.predict_proba([[0.9]])

# Linear regression
from sklearn import linear_model
model = linear_model.LinearRegression()
model.fit(X_train, y_train)
LinearRegression(copy_X=True, fit_intercept=True, n_jobs=1, normalize=False)
# R2 Score
model.score(X_test, y_test)
# Sum of Squared Distances
np.sum(model.predict(X_test) - y_test) ** 2


# Week 6

# SVC
from sklearn.svm import SVC
model = SVC(kernel='linear')
model.fit(X, y) 
SVC(C=1.0, cache_size=200, class_weight=None, coef0=0.0,
  decision_function_shape=None, degree=3, gamma='auto', kernel='linear',
  max_iter=-1, probability=False, random_state=None, shrinking=True,
  tol=0.001, verbose=False)

# Decision Trees
# You know the drill...
from sklearn import tree
model = tree.DecisionTreeClassifier(max_depth=9, criterion="entropy")
model.fit(X,y)
DecisionTreeClassifier(class_weight=None, criterion='entropy', max_depth=9,
            max_features=None, max_leaf_nodes=None, min_samples_leaf=1,
            min_samples_split=2, min_weight_fraction_leaf=0.0,
            presort=False, random_state=None, splitter='best')
# .DOT files can be rendered to .PNGs, if you've already `brew install graphviz`.
tree.export_graphviz(model.tree_, out_file='tree.dot', feature_names=X.columns)
from subprocess import call
call(['dot', '-T', 'png', 'tree.dot', '-o', 'tree.png'])

# random Forest
from sklearn.ensemble import RandomForestClassifier
model = RandomForestClassifier(n_estimators=10, oob_score=True)
model.fit(X, y)
RandomForestClassifier(bootstrap=True, class_weight=None, criterion='gini',
            max_depth=None, max_features='auto', max_leaf_nodes=None,
            min_samples_leaf=1, min_samples_split=2,
            min_weight_fraction_leaf=0.0, n_estimators=10, n_jobs=1,
            oob_score=True, random_state=None, verbose=0, warm_start=False)
print model.oob_score_

# Week 7

# Confusion
import sklearn.metrics as metrics
y_true = [1, 1, 2, 2, 3, 3]  # Actual, observed testing dataset values
y_pred = [1, 1, 1, 3, 2, 3]  # Predicted values from your model
metrics.confusion_matrix(y_true, y_pred)
import matplotlib.pyplot as plt
columns = ['Cat', 'Dog', 'Monkey']
confusion = metrics.confusion_matrix(y_true, y_pred)
plt.imshow(confusion, cmap=plt.cm.Blues, interpolation='nearest')
plt.xticks([0,1,2], columns, rotation='vertical')
plt.yticks([0,1,2], columns)
plt.colorbar()
plt.show()

# Cross Validation
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.5, random_state=0)
# Test how well your model can recall its training data:
model.fit(X_train, y_train).score(X_train, y_train)
# Test how well your model can predict unseen data:
model.fit(X_test, y_test).score(X_test, y_test)
# 10-Fold Cross Validation on your training data
from sklearn import cross_validation as cval
cval.cross_val_score(model, X_train, y_train, cv=10)
cval.cross_val_score(model, X_train, y_train, cv=10).mean()

# Power Tuning
from sklearn import svm, grid_search, datasets
iris = datasets.load_iris()
parameters = {'kernel':('linear', 'rbf'), 'C':[1, 5, 10]}
model = svm.SVC()
classifier = grid_search.GridSearchCV(model, parameters)
classifier.fit(iris.data, iris.target)
GridSearchCV(cv=None, error_score='raise',
       estimator=SVC(C=1.0, cache_size=200, class_weight=None, coef0=0.0,
  decision_function_shape=None, degree=3, gamma='auto', kernel='rbf',
  max_iter=-1, probability=False, random_state=None, shrinking=True,
  tol=0.001, verbose=False),
       fit_params={}, iid=True, n_jobs=1,
       param_grid={'kernel': ('linear', 'rbf'), 'C': [1, 5, 10]},
       pre_dispatch='2*n_jobs', refit=True, scoring=None, verbose=0)
parameter_dist = {
  'C': scipy.stats.expon(scale=100),
  'kernel': ['linear'],
  'gamma': scipy.stats.expon(scale=.1),
}
classifier = grid_search.RandomizedSearchCV(model, parameter_dist)
classifier.fit(iris.data, iris.target)
RandomizedSearchCV(cv=None, error_score='raise',
          estimator=SVC(C=1.0, cache_size=200, class_weight=None, coef0=0.0,
  decision_function_shape=None, degree=3, gamma='auto', kernel='rbf',
  max_iter=-1, probability=False, random_state=None, shrinking=True,
  tol=0.001, verbose=False),
          fit_params={}, iid=True, n_iter=10, n_jobs=1,
          param_distributions={'kernel': ['linear'], 'C': <scipy.stats._distn_infrastructure.rv_frozen object at 0x110345c50>, 'gamma': <scipy.stats._distn_infrastructure.rv_frozen object at 0x110345d90>},
          pre_dispatch='2*n_jobs', random_state=None, refit=True,
          scoring=None, verbose=0)
          
from sklearn.pipeline import Pipeline
svc = svm.SVC(kernel='linear')
pca = RandomizedPCA()
pipeline = Pipeline([
  ('pca', pca),
  ('svc', svc)
])
pipeline.set_params(pca__n_components=5, svc__C=1, svc__gamma=0.0001)
pipeline.fit(X, y)




# kernel PCA 

from sklearn.datasets import make_moons
from sklearn.datasets import make_circles
from sklearn.datasets.samples_generator import make_swiss_roll

# Moons
import pandas as pd
X, y = make_moons(n_samples=100, random_state=123)
df = pd.DataFrame(X)
df['y'] = y
df.to_csv('C:/work/analytics/R/session.coord/moons.csv')

#Concentric circles
X, y = make_circles(n_samples=1000, random_state=123, noise=0.1, factor=0.2)
df = pd.DataFrame(X)
df['y'] = y
df.to_csv('C:/work/analytics/R/session.coord/circles.csv')

#Swiss roll
from mpl_toolkits.mplot3d import Axes3D
X, color = make_swiss_roll(n_samples=800, random_state=123)
df = pd.DataFrame(X)
df['y'] = color
df.to_csv('C:/work/analytics/R/session.coord/swiss_roll.csv')

