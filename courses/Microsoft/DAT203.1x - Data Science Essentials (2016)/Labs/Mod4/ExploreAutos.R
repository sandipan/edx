## Numeric columns to plot
num.cols <- c("wheel.base",
              "width",
              "height",
              "curb.weight",
              "engine.size",
              "bore",
              "compression.ratio",
              "city.mpg",
              "price",
              "lnprice")

## Define columns for making a conditioned histogram
plot.cols2 <- c("length",
               "curb.weight",
               "engine.size",
               "city.mpg",
               "price")

## Function to plot conditioned histograms
auto.hist <- function(x) {
  library(ggplot2)
  library(gridExtra)
  ## Compute the bin width
  rg = range(auto.price[,x])
  bw = (rg[2] - rg[1])/30
  ## Define the title
  title <- paste("Histogram of", x, "conditioned on type of drive wheels")
  ## Create the histogram
  ggplot(auto.price, aes_string(x)) +
    geom_histogram(aes(y = ..count..), binwidth = bw) +
    facet_grid(. ~ drive.wheels) +
    ggtitle(title) 
}

## Function to create conditioned box plots
auto.box <- function(x) {
  title <- paste("Box plot of", x, "by type of drive wheels")
  ggplot(auto.price, aes_string('drive.wheels', x)) +
    geom_boxplot() +
    ggtitle(title)
}


## Define columns for making scatter plots
plot.cols3 <- c("length",
                "curb.weight",
                "engine.size",
                "city.mpg")

## Scatter plot using color to differentiate points
scatter.auto <- function(x){
  require(ggplot2)
  title <- paste("price vs.", x, 'with color by num.cylinders')
  ggplot(auto.price, aes_string(x, 'price')) +
    geom_point(aes(color = factor(num.cylinders))) +
    ggtitle(title)
}


## Conditioned scatter plots
scatter.auto.cond <- function(x){
  require(ggplot2)
  library(gridExtra)
  title <- paste("price vs.", x, 'with color by num.cylinders and body style')
  ggplot(auto.price, aes_string(x, 'price')) +
    geom_point(aes(color = factor(fuel.type))) +
    facet_grid(body.style ~ num.cylinders) +
    ggtitle(title)
}

lapply(plot.cols2, auto.hist)
lapply(plot.cols2, auto.box)
lapply(plot.cols3, scatter.auto)
scatter.auto.cond(plot.cols3)