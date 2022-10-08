import pandas as pd
import numpy as np

# cd 'C:/courses/Edx/Current/Microsoft DAT210x Programming with Python for Data Science/Week2/Assignments/Datasets/'


# TODO:
# Load up the dataset, setting correct header labels
# Use basic pandas commands to look through the dataset...
# get a feel for it before proceeding!
# Find out what value the dataset creators used to
# represent "nan" and ensure it's properly encoded as np.nan
#
# .. your code here ..
#df = pd.read_csv('census.data', header=None) #, index_col=0)
#df.columns=['','education', 'age', 'capital-gain', 'race', 'capital-loss', 'hours-per-week', 'sex', 'classification']
df = pd.read_csv('census.data', header=None, names=['education', 'age', 'capital-gain', 'race', 'capital-loss', 'hours-per-week', 'sex', 'classification'])
df.head()
df = df.replace(0, np.nan)
df.head()

# TODO:
# Figure out which features should be continuous + numeric
# Conert these to the appropriate data type as needed,
# that is, float64 or int64
#
# .. your code here ..
df.dtypes

# TODO:
# Look through your data and identify any potential categorical
# features. Ensure you properly encode any ordinal types using
# the method discussed in the chapter.
#
# .. your code here ..
df.education.unique()
df.education = df.education.astype("category", \
  ordered=True, \
  categories=['Preschool', '1st-4th', '5th-6th', '7th-8th', '9th', '10th', '11th', '12th', \
              'HS-grad', 'Some-college', 'Bachelors', 'Masters', 'Doctorate']
).cat.codes
#df.classification.unique()
#df.classification = df.classification.astype("category", \
#  ordered=True, \
#  categories=['<=50K', '>50K']
#).cat.codes
df.head()
df.dtypes

# TODO:
# Look through your data and identify any potential categorical
# features. Ensure you properly encode any nominal types by
# exploding them out to new, separate, boolean fatures.
#
# .. your code here ..
#df = pd.get_dummies(df,columns=['race', 'sex'])
df = pd.get_dummies(df,columns=['race', 'sex', 'classification'])
df.head()
df.dtypes

# TODO:
# Print out your dataframe
df.head()