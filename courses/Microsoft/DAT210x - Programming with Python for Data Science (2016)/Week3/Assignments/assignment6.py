import pandas as pd
import matplotlib.pyplot as plt
import matplotlib

# cd 'C:/courses/Edx/Current/Microsoft DAT210x Programming with Python for Data Science/Week3/Assignments/Datasets/'

# Look pretty...
matplotlib.style.use('ggplot')

#
# TODO: Load up the Seeds Dataset into a Dataframe
# It's located at 'Datasets/wheat.data'
# 
# .. your code here ..
df = pd.read_csv('wheat.data')
df.head()


#
# TODO: Drop the 'id' feature
# 
# .. your code here ..
df = df.drop(['id'], axis=1)
df.head()


#
# TODO: Compute the correlation matrix of your dataframe
# 
# .. your code here ..
cor = df.corr()
cor

#
# TODO: Graph the correlation matrix using imshow or matshow
# 
# .. your code here ..
plt.matshow(df.corr(), cmap=plt.cm.Blues, interpolation='nearest')
plt.colorbar()
tick_marks = [i for i in range(len(df.columns))]
plt.xticks(tick_marks, df.columns, rotation='vertical')
plt.yticks(tick_marks, df.columns)

plt.show()


