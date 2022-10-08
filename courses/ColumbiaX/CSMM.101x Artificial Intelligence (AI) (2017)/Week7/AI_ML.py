
# coding: utf-8

# #Some Machine Learning in Python

# The following problems appeared as part of a project in the *edX course ColumbiaX: CSMM.101x Artificial Intelligence (AI)*. 

# ##I. Perceptron Learning Algorithm
# 
# In this question, the perceptron learning algorithm ("PLA") will be implemented for a linearly separable 2-D dataset. The dataset contains a series of data points. Each point is a comma-separated ordered triple, representing feature_1, feature_2, and the label for the point. The values of the features can be though of as the x- and y-coordinates of each point. The label takes on a value of positive or negative one. The label can be thought of as separating the points into two categories.
# Implement your PLA in a file called problem1.py, which will be executed like so:
# 
# With each iteration of the PLA, your program must print a new line to the output file, containing a comma-separated list of the weights w_1, w_2, and b in that order. Upon convergence, the program will stop, and the final values of w_1, w_2, and b will be printed to the output file. This defines the decision boundary that your PLA has computed for the given dataset.

# In[5]:

#ipython nbconvert pcaiso.ipynb
get_ipython().magic(u'matplotlib inline')

from IPython.display import HTML

HTML('''<script>
code_show=true; 
function code_toggle() {
 if (code_show){
 $('div.input').hide();
 } else {
 $('div.input').show();
 }
 code_show = !code_show
} 
$( document ).ready(code_toggle);
</script>
<form action="javascript:code_toggle()"><input type="submit" value="Click here to toggle on/off the raw code."></form>''')


# Here are first few rows of the sample dataset and the scatter plot of the dataset

# In[8]:

import pandas as pd
df = pd.read_csv('C:/courses/Edx/Current/AI/Week7/input1.csv', header=None, names=['x1','x2','y'])
df.head()


# In[25]:

get_ipython().magic(u'matplotlib inline')
import matplotlib.pyplot as plt
df1 = df[df.y==1]
plt.scatter(df1.x1, df1.x2, s=150, c='blue', marker='+')
df1 = df[df.y==-1]
plt.scatter(df1.x1, df1.x2, s=25, c='red', marker='x')


# The following animation video shows how the perceptron algorithm converges to find the 2-D hyperplane (line) that separates two classes.

# In[23]:

from IPython.display import Image
import io
import base64
from IPython.display import HTML

video = io.open('C:/courses/Edx/Current/AI/Week7/pyPLA.mp4', 'r+b').read()
encoded = base64.b64encode(video)
HTML(data='''<video alt="test" controls>
                <source src="data:video/mp4;base64,{0}" type="video/mp4" />
             </video>'''.format(encoded.decode('ascii')))
#%%HTML
#<video width="320" height="240" controls>
#  <source src="C:/courses/Edx/Current/AI/Week7/pyPLA.mp4" type="video/mp4">
#</video>


# ##II. Linear Regression
# 
# In this problem, multiple linear regression will be implemented using gradient descent on a dataset with multiple features. Again, the dataset contains a series of data points. Each point is a comma-separated ordered triple, representing age, weight, and height (derived from CDC growth charts data). A few rows of the sample dataset is shown  below.

# In[26]:

df = pd.read_csv('C:/courses/Edx/Current/AI/Week7/input2.csv', header=None, names=['age','weight','height'])
df.head()


# **Data Preparation and Normalization**. Once the dataset is loaded, the content needs to be explored to identify each feature. The intercept is needed to be added ahead of the data matrix. Since the features are not on the same scale, e.g., they represent age (years), and weight (kilograms), they need to normalized. What is the mean and standard deviation of each feature? The last column is the label, and represents the height (meters). Each feature (i.e. age and weight, except the intercept) has to be scaled by its standard deviation, and its mean has to be set to zero, using the following formula (for z-score normalization):

# In[32]:

Image(filename='C:\\courses\\Edx\\Current\\AI\\Week7\\scale.png', width=200, height=150)


# **Gradient Descent**: Gradient descent is to be implemented to find a regression model. The β’s are to be initialized to zero. The empirical risk and gradient descent rule are as follows:

# In[34]:

Image(filename='C:\\courses\\Edx\\Current\\AI\\Week7\\grd.png', width=400, height=300)


# The gradient descent algorithm is to be run using the following learning rates: α ∈ {0.001, 0.005, 0.01, 0.05, 0.1, 0.5, 1, 5, 10}. For each value of α, the algorithm is to be run for exactly 100 iterations and the convergence rates to be compared when α is small versus large. Also, the ideal learning rate to obtain an accurate model has to be computed.

# The animation below shows how the regression plane is learnt with gradient descent.  

# In[42]:

get_ipython().system(u'[](C:\\\\courses\\\\Edx\\\\Current\\\\AI\\\\Week7\\\\problem2.gif "")')


# ##III. Classification
# 
# In this problem the support vector classifiers in the sklearn package is to be used to learn a classification model for a chessboard-like dataset. Again, the input dataset containins a series of data points as shown below.

# In[52]:

df = pd.read_csv('C:/courses/Edx/Current/AI/Week7/input3.csv')
df.head()


# In[53]:

Image(filename='C:\\courses\\Edx\\Current\\AI\\Week7\\problems3_1.png')


# SVM with different kernels is to be used to build a classifier. The dataset is to be splitted into training (60%) and testing (40%), using stratified sampling (i.e. same ratio of positive to negative in both the training and testing datasets). K-Fold Cross validation (with the number of folds k = 5) is to be used instead of a validation set. 
# SVM with Linear Kernel. The performance of the SVM with linear kernel is to be observed. A good setting of parameters is to be searched to obtain high classification accuracy. Specifically, the values of C = [0.1, 0.5, 1, 5, 10, 50, 100] are to be tried. After locating the optimal parameter value by using the training data, the corresponding best score (accuracy) achieved needs to e recorded Then by applying the testing data to the model, and the actual test score is to be recored. Both scores will be a number between zero and one.
# 
# **SVM with Polynomial Kernel**. (Similar to above).
# Try values of C = [0.1, 1, 3], degree = [4, 5, 6], and gamma = [0.1, 1].
# 
# **SVM with RBF Kernel**. (Similar to above).
# Try values of C = [0.1, 0.5, 1, 5, 10, 50, 100] and gamma = [0.1, 0.5, 1, 3, 6, 10].
# 
# **Logistic Regression**. (Similar to above).
# Try values of C = [0.1, 0.5, 1, 5, 10, 50, 100].
# 
# **k-Nearest Neighbors**. (Similar to above).
# Try values of n_neighbors = [1, 2, 3, ..., 50] and leaf_size = [5, 10, 15, ..., 60].
# 
# **Decision Trees**. (Similar to above).
# Try values of max_depth = [1, 2, 3, ..., 50] and min_samples_split = [1, 2, 3, ..., 10].
# 
# **Random Forest**. (Similar to above).
# Try values of max_depth = [1, 2, 3, ..., 50] and min_samples_split = [1, 2, 3, ..., 10].

# The following plots show the cross validation accuracies for a few different classifiers with different values of the hyper-parameters.

# In[45]:

Image(filename='C:\\courses\\Edx\\Current\\AI\\Week7\\problems3_2.png')


# In[46]:

Image(filename='C:\\courses\\Edx\\Current\\AI\\Week7\\problems3_3.png')


# Here are the decision boundaries learnt with different classfiers using the best-fit models:

# In[48]:

Image(filename='C:\\courses\\Edx\\Current\\AI\\Week7\\problem3_4.png')


# In[ ]:



