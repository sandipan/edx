
def read_auto(pathName = "c:\dat203.1x\mod4", fileName = "Automobile price data _Raw_.csv"):
    ## Load the data  
    import pandas as pd
    import numpy as np
    import os

    ## Read the .csv file
    pathName = pathName
    fileName = fileName
    filePath = os.path.join(pathName, fileName)
    auto_price = pd.read_csv(filePath)

    ## Convert some columns to numeric values
    cols = ['price', 'bore', 'stroke', 
          'horsepower', 'peak-rpm']
    auto_price[cols] = auto_price[cols].convert_objects(convert_numeric = True)
    
    ## Remove rows with missing values
    auto_price.dropna(axis = 0, inplace = True)

    ## Compute the log of the auto price
    auto_price['lnprice'] = np.log(auto_price.price)

    ## Create a column with new levels for the number of cylinders
    auto_price['num-cylinders'] = ['four-or-less' if x in ['two', 'three', 'four'] else 
                                 ('five-six' if x in ['five', 'six'] else 
                                 'eight-twelve') for x in auto_price['num-of-cylinders']]
    return auto_price

import os
os.chdir('C:/courses/Edx/Current/Microsoft DAT203.1x Data Science Essentials/MicrosoftLearning-Data-Science-Essentials-91ddbff/Labs/Mod4/')
import LoadAutos as au
auto_price = au.read_auto('.')
auto_price.dtypes

import ExploreAutos as ea
ea.auto_pairs(ea.plot_cols, auto_price)

ea.cond_hists(auto_price, ea.plot_cols2, 'drive-wheels')
ea.auto_boxplot(auto_price, ea.plot_cols2, 'drive-wheels')
ea.auto_scatter(auto_price, ea.plot_cols3)
ea.auto_scatter_cond(auto_price, ea.plot_cols3, 'price', 'body-style', 'num-cylinders')