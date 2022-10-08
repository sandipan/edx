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
# TODO: Create a 2d scatter plot that graphs the
# area and perimeter features
# 
# .. your code here ..
plt.scatter(df['area'], df['perimeter'])

#
# TODO: Create a 2d scatter plot that graphs the
# groove and asymmetry features
# 
# .. your code here ..
plt.scatter(df['groove'], df['asymmetry'])

#
# TODO: Create a 2d scatter plot that graphs the
# compactness and width features
# 
# .. your code here ..
plt.scatter(df['compactness'], df['width'])


# BONUS TODO:
# After completing the above, go ahead and run your program
# Check out the results, and see what happens when you add
# in the optional display parameter marker with values of
# either '^', '.', or 'o'.


plt.show()


