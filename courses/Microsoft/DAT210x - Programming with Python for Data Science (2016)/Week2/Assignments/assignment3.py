import pandas as pd

# cd 'C:/courses/Edx/Current/Microsoft DAT210x Programming with Python for Data Science/Week2/Assignments/Datasets/'

# TODO: Load up the dataset
# Ensuring you set the appropriate header column names
#
# .. your code here ..
df = pd.read_csv('servo.data', header=None)
df.columns = ['motor', 'screw', 'pgain', 'vgain', 'class']
df.head()

# TODO: Create a slice that contains all entries
# having a vgain equal to 5. Then print the 
# length of (# of samples in) that slice:
#
# .. your code here ..
df[df.vgain==5].shape

# TODO: Create a slice that contains all entries
# having a motor equal to E and screw equal
# to E. Then print the length of (# of
# samples in) that slice:
#
# .. your code here ..
df[(df.motor == 'E') & (df.screw == 'E')].shape


# TODO: Create a slice that contains all entries
# having a pgain equal to 4. Use one of the
# various methods of finding the mean vgain
# value for the samples in that slice. Once
# you've found it, print it:
#
# .. your code here ..
df[df.pgain==4].describe()



# TODO: (Bonus) See what happens when you run
# the .dtypes method on your dataframe!



