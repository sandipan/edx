## Numeric columns
plot_cols = ["wheel-base",
              "width",
              "height",
              "curb-weight",
              "engine-size",
              "bore",
              "compression-ratio",
              "city-mpg",
              "price",
              "lnprice"]
 
## Create pair-wise scatter plots         
def auto_pairs(plot_cols, df):
    import matplotlib.pyplot as plt
    from pandas.tools.plotting import scatter_matrix
    fig = plt.figure(figsize=(12, 12))
    fig.clf()
    ax = fig.gca()
    scatter_matrix(df[plot_cols], alpha=0.3, 
               diagonal='kde', ax = ax)
    return 'Done'           

## Define columns for making a conditioned histogram
plot_cols2 = ["length",
               "curb-weight",
               "engine-size",
               "city-mpg",
               "price"]

## Function to plot conditioned histograms
def cond_hists(df, plot_cols, grid_col):
    import matplotlib.pyplot as plt
    import pandas.tools.rplot as rplot
    ## Loop over the list of columns
    for col in plot_cols:
        ## Define figure
        fig = plt.figure(figsize=(14, 4))
        fig.clf()
        ax = fig.gca()
        ## Setup plot and grid and plot the data
        plot = rplot.RPlot(df, x = col, 
                                  y = '.') 
        plot.add(rplot.TrellisGrid(['.', grid_col]))
        plot.add(rplot.GeomHistogram())
        ax.set_title('Histograms of ' + col + ' conditioned by ' + grid_col + '\n')
        plot.render()
    return grid_col        


## Create boxplots of data
def auto_boxplot(df, plot_cols, by):
    import matplotlib.pyplot as plt
    for col in plot_cols:
        fig = plt.figure(figsize=(9, 6))
        ax = fig.gca()
        df.boxplot(column = col, by = by, ax = ax)
        ax.set_title('Box plots of ' + col + ' by ' + by)
        ax.set_ylabel(col)
    return by    

## Define columns for making scatter plots
plot_cols3 = ["length",
               "curb-weight",
               "engine-size",
               "city-mpg"] 
               
## Create scatter plot
def auto_scatter(df, plot_cols):
    import matplotlib.pyplot as plt
    for col in plot_cols:
        fig = plt.figure(figsize=(8, 8))
        ax = fig.gca()
        temp1 = df.ix[df['fuel-type'] == 'gas']       
        temp2 = df.ix[df['fuel-type'] == 'diesel']
        if temp1.shape[0] > 0:                    
            temp1.plot(kind = 'scatter', x = col, y = 'price' , 
                           ax = ax, color = 'DarkBlue')                          
        if temp2.shape[0] > 0:                    
            temp2.plot(kind = 'scatter', x = col, y = 'price' , 
                           ax = ax, color = 'Red') 
        ax.set_title('Scatter plot of price vs. ' + col)
    return plot_cols
 
               
## Create conditioned scatter plots
def auto_scatter_cond(df, plot_cols, y, cond_var1, cond_var2):
    for col in plot_cols:
        condPltsCol(df, col, y, cond_var1, cond_var2)
    return cond_var1, cond_var2

def condPltsCol(df, col1, col2, var1, var2):
    import matplotlib.pyplot as plt
    
    ## Find the levels of the conditioning variables
    levs1 = df[var1].unique().tolist()
    num1 = len(levs1)
    levs2 = df[var2].unique().tolist()
    num2 = len(levs2)   
    
    ## Determine the limits for the plots
    xlims = (df[col1].min(), df[col1].max())
    ylims = (df[col2].min(), df[col2].max())
    
    ## Define a figure and axes for the plot
    fig, ax = plt.subplots(num1, num2, figsize = (12, 8))

    ## Loop over conditioning variables subset the data
    ## and set create scatter plots for each conditioning
    ## variable pair and with data both gas and diesel cars    
    for i, val1 in enumerate(levs1):
        for j, val2 in enumerate(levs2):
            temp1 = df.ix[(df[var1] == val1) & (df[var2] == val2) & (df['fuel-type'] == 'gas')]       
            temp2 = df.ix[(df[var1] == val1) & (df[var2] == val2) & (df['fuel-type'] == 'diesel')]
            if temp1.shape[0] > 0:                    
                temp1.plot(kind = 'scatter', x = col1, y = col2 , ax = ax[i,j],
                          xlim = xlims, ylim = ylims, color = 'DarkBlue')                          
            if temp2.shape[0] > 0:                    
                temp2.plot(kind = 'scatter', x = col1, y = col2 , ax = ax[i,j],
                          xlim = xlims, ylim = ylims, color = 'Red')    
            ax[i,j].set_title(val1 + ' and ' + val2 )
            ax[i,j].set_xlabel('')
    
    ## Some lables for the x axis    
    ax[i,j].set_xlabel(col1)
    ax[i,(j-1)].set_xlabel(col1)
    return col1, col2
    
