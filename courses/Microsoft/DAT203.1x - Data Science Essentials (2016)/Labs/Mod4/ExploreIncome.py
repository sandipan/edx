def read_income(pathName = "c:\dat203.1x\mod4", fileName = "Adult Census Income Binary Classification dataset.csv"):
    ## Load the data  
    import pandas as pd
    import os

    ## Read the .csv file
    filePath = os.path.join(pathName, fileName)
    return pd.read_csv(filePath)

## Plot categorical variables as bar plots
def income_barplot(df):
    import numpy as np
    import matplotlib.pyplot as plt
    
    cols = df.columns.tolist()[:-1]
    for col in cols:
        if(df.ix[:, col].dtype not in [np.int64, np.int32, np.float64]):
            temp1 = df.ix[df[' income'] == ' <=50K', col].value_counts()
            temp0 = df.ix[df[' income'] == ' >50K', col].value_counts() 
            
            ylim = [0, max(max(temp1), max(temp0))]
            fig = plt.figure(figsize = (12,6))
            fig.clf()
            ax1 = fig.add_subplot(1, 2, 1)
            ax0 = fig.add_subplot(1, 2, 2) 
            temp1.plot(kind = 'bar', ax = ax1, ylim = ylim)
            ax1.set_title('Values of ' + col + '\n for income <= 50K')
            temp0.plot(kind = 'bar', ax = ax0, ylim = ylim)
            ax0.set_title('Values of ' + col + '\n for income > 50K')
    return('Done')            
            
            
## Plot categorical variables as box plots
def income_boxplot(df):
    import numpy as np
    import matplotlib.pyplot as plt
    
    cols = df.columns.tolist()[:-1]
    for col in cols:
        if(df[col].dtype in [np.int64, np.int32, np.float64]):                  
            fig = plt.figure(figsize = (6,6))
            fig.clf()
            ax = fig.gca() 
            df.boxplot(column = [col], ax = ax, by = [' income'])          
    return('Done')        
    
import os
os.chdir('C:/courses/Edx/Current/Microsoft DAT203.1x Data Science Essentials/MicrosoftLearning-Data-Science-Essentials-91ddbff/Labs/Mod4/')
import ExploreIncome as ei
Income = ei.read_income('.')
Income.dtypes

ei.income_barplot(Income)
ei.income_boxplot(Income)
