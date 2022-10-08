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
# TODO: Create a slice of your dataframe (call it s1)
# that only includes the 'area' and 'perimeter' features
# 
# .. your code here ..
s1 = df[['area', 'perimeter']]
s1.head()

#
# TODO: Create another slice of your dataframe (call it s2)
# that only includes the 'groove' and 'asymmetry' features
# 
# .. your code here ..
s2 = df[['groove', 'asymmetry']]
s2.head()


#
# TODO: Create a histogram plot using the first slice,
# and another histogram plot using the second slice.
# Be sure to set alpha=0.75
# 
# .. your code here ..
s1.hist(alpha=0.75)
s2.hist(alpha=0.75)

s2.describe()

plt.show()

