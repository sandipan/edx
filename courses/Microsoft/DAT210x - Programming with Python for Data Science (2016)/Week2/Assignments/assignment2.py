import pandas as pd

# cd 'C:/courses/Edx/Current/Microsoft DAT210x Programming with Python for Data Science/Assignments/Datasets/'

# TODO: Load up the 'tutorial.csv' dataset
#
# .. your code here ..

df = pd.read_csv('tutorial.csv')
df


# TODO: Print the results of the .describe() method
#
# .. your code here ..
df.describe()


# TODO: Figure out which indexing method you need to
# use in order to index your dataframe with: [2:4,'col3']
# And print the results
#
# .. your code here ..

df.loc[2:4,'col3']
