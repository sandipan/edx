import pandas as pd
import matplotlib.pyplot as plt
import matplotlib

# cd 'C:/courses/Edx/Current/Microsoft DAT210x Programming with Python for Data Science/Week3/Assignments/Datasets/'

from pandas.tools.plotting import parallel_coordinates

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
# TODO: Drop the 'id', 'area', and 'perimeter' feature
# 
# .. your code here ..
df = df.drop(['id', 'area', 'perimeter'], axis=1)
df.head()

#
# TODO: Plot a parallel coordinates chart grouped by
# the 'wheat_type' feature. Be sure to set the optional
# display parameter alpha to 0.4
# 
# .. your code here ..

# Parallel Coordinates Start Here:
plt.figure()
parallel_coordinates(df, 'wheat_type')
plt.show()


