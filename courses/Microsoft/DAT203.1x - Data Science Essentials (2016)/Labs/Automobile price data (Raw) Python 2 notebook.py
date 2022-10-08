
# coding: utf-8

# In[1]:

from azureml import Workspace

ws = Workspace()
ds = ws.datasets['Automobile price data (Raw)']
frame = ds.to_dataframe()


# In[2]:

frame


# In[3]:

cols = ['price', 'bore', 'stroke', 'horsepower', 'peak-rpm']
frame[cols] = frame[cols].convert_objects(convert_numeric = True)
frame.dropna(axis = 0, inplace = True)
frame.dtypes


# In[5]:

def describe(df, col):
    ## Compute the summary stats
    desc = df[col].describe()
    ## Change the name of the 50% index to median
    idx = desc.index.tolist()
    idx[5] = 'median'
    desc.index = idx
    return desc


# In[6]:

describe(frame, 'price')


# In[7]:

def plotstats(df, col):
    import matplotlib.pyplot as plt
    ## Setup for ploting two charts one over the other
    fig, ax = plt.subplots(2, 1, figsize = (12,8))
    ## First a box plot
    df.dropna().boxplot(col, ax = ax[0], vert=False,
    return_type='dict')
    ## Plot the histogram
    temp = df[col].as_matrix()
    ax[1].hist(temp, bins = 30, alpha = 0.7)
    plt.ylabel('Number of Cars')
    plt.xlabel(col)
    return [col]


# In[8]:

plotstats(frame, 'price')


# In[9]:

plotstats(frame, 'horsepower')


# In[10]:

describe(frame, 'horsepower')


# In[ ]:



