import pandas as pd


# TODO: Load up the table, and extract the dataset
# out of it. If you're having issues with this, look
# carefully at the sample code provided in the reading
#
# .. your code here ..
df = pd.read_html('http://espn.go.com/nhl/statistics/player/_/stat/points/sort/points/year/2015/seasontype/2', header=1)[0]
#df.columns = ['RK',	'PLAYER',	'TEAM',	'GP', 'G', 'A', 'PTS', '+/-',	'PIM', 'PTS/G', 'SOG', 'PCT',	'GWG', 'PP.G',	'PP.A', 'SH.G', 'SH.A']

# TODO: Rename the columns so that they match the
# column definitions provided to you on the website
#
# .. your code here ..


# TODO: Get rid of any row that has at least 4 NANs in it
#
# .. your code here ..
df = df.dropna(axis=0, thresh=df.shape[1]-4+1)

# TODO: At this point, look through your dataset by printing
# it. There probably still are some erroneous rows in there.
# What indexing command(s) can you use to select all rows
# EXCEPT those rows?
#
# .. your code here ..
print(df)
df = df[df.PLAYER != 'PLAYER']
#df = df.drop_duplicates()
print(df)

# TODO: Get rid of the 'RK' column
#
# .. your code here ..
df = df.drop(labels=['RK'], axis=1)
df.head()

# TODO: Ensure there are no holes in your index by resetting
# it. By the way, don't store the original index
#
# .. your code here ..
print(df)
df = df.reset_index(drop=True)
print(df)

# TODO: Check the data type of all columns, and ensure those
# that should be numeric are numeric
df.dtypes
df.head()
for col in list(df.columns)[2:]:
    df[col] = pd.to_numeric(df[col], errors='coerce')
#df.GP = pd.to_numeric(df.GP, errors='coerce')
#df.G = pd.to_numeric(df.G, errors='coerce')
#df.A = pd.to_numeric(df.A, errors='coerce')
#df.PTS = pd.to_numeric(df.PTS, errors='coerce')
#df['+/-'] = pd.to_numeric(df['+/-'], errors='coerce')
df.head()
df.dtypes

# TODO: Your dataframe is now ready! Use the appropriate 
# commands to answer the questions on the course lab page.
df.shape
len(df.PCT.unique())
sum(df[15:17]['GP'])