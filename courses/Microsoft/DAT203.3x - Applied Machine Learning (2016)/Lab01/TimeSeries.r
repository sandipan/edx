
to.POSIXct <- function(year, monthNumber){
  ## Function to create a POSIXct time series 
  ## object from a year.month format
  
  ## Create a character vector from the numeric input
  dateStr <- paste(as.character(year), "-",
                   as.character(monthNumber), "-",
                   "01", sep = "")
  ## Return the POSIXct time series object
  as.POSIXct( strptime(dateStr, "%Y-%m-%d"))
}

order.month <- function(x){
  ## Function to make Month column an ordered factor.
  x <- substr(x, 1, 3) ## Use just the first three letters
  factor(x, 
         levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
                    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"),
         ordered = TRUE)
}

read.dairy <- function(dataSet = 'cadairydata.csv'){
  library("AzureML")
  ws <- workspace()
  df <- download.datasets(ws, dataSet)
  df$dateTime <- to.POSIXct(df$Year, df$Month.Number)
  dropCols <- c("X","Year.Month", "Month.Number")
  df$Month <- order.month(df$Month)
  df[ , !(names(df) %in% dropCols)]
}

dairy <- read.dairy()

head(dairy)

class(dairy$dateTime)

dairy$dateTime[1:20]

dairy[dairy$dateTime > '2012-12-01',]

dairy.plot <- function(df, col = 'Milk.Prod'){
  require(ggplot2)
  ggplot(df, aes_string('dateTime', col)) +
    geom_line() +
    ggtitle(paste('Time series of', col)) +
    xlab('Time in years')
}
dairy.plot(dairy)

dairy.acf <- function(df, col = 'remainder', is.df =TRUE){
  if(is.df) temp <- df[, col]
  else temp <- df
  #print(temp)
  temp = ts(temp, start = 1995, frequency = 12)
  #par(mfrow = c(2,1))
  acf(temp, main = paste('ACF of', col))
  pacf(temp, main = paste('PACF of', col))
  #par(mfrow = c(1,1))
}
#dairy
#is.df(dairy)
dairy.acf(dairy, col = 'Milk.Prod')

hist.ts = function(df, col = 'Milk.Prod', bins = 40){
    temp = df[,col]
    breaks = seq(min(temp), max(temp), length.out = (bins + 1))
    hist(temp, breaks = breaks, main = paste('Distribution of ', col), xlab = col)
}
hist.ts(dairy)

dairy.plot(dairy, col = 'Icecream.Prod')
dairy.acf(dairy, col = 'Icecream.Prod')

dairy.ma <- function(df, col = 'Milk.Prod', order = 12){
  temp = df[, col]
  end = length(temp) - 1
  out = rep(0, length(temp))
  out[1] = temp[1]
  for(i in 1:end){
    if(i - order <= 1) j = 1 
    else j = j + 1
    out[i + 1] = sum(temp[j:i])/(i - j + 1)
  }
  out
}

dairy.seasons <- function(df, col = 'Milk.Prod'){
  df$y = df[, col]
  fit = lm(y ~ 0 + Month, data = df)
  predict(fit, newdata = df)
}

decomp.dairy <- function(df,  col = 'Milk.Prod', multiplicative = TRUE, order = 12){
  if(multiplicative) {
    temp = log(df[, col])
    df[, col] = temp
  } else { 
    temp = df[, col] 
  }
  trend = dairy.ma(df, col = col, order = order)
  temp = temp - trend
  df[, col] = temp
  seasonal = dairy.seasons(df, col = col)
  remainder = temp - seasonal
  data.frame(trend = trend, seasonal = seasonal, remainder = remainder)
}
decomp <- decomp.dairy(dairy, order = 12)
head(decomp)

decomp.plot <- function(df){
  require(ggplot2)
  install.packages("gridExtra")
  require(gridExtra)
  df$x = 1:nrow(df)
  ycols = c('trend', 'seasonal', 'remainder')
  p <- lapply(ycols, function(y){
               ggplot(df, aes_string('x', y)) + 
                         geom_line() +
                         ylab(y)
            })
  grid.arrange(p[[1]], p[[2]], p[[3]], nrow = 3)
}
decomp.plot(decomp)

dairy.acf(decomp)

dairy.decomp <- function(df, col = 'Milk.diff', span = 0.5, Mult = TRUE){
  if(Mult) {temp <- ts(log(df[, col]), frequency=12, start=1)
  } else {temp <- ts(df[, col], frequency=24, start=1)}
  span = span * length(temp)  
  dairyFit <- stl(temp, s.window = "periodic", t.window = span)
  plot(dairyFit, main = 'Decompositon of dairy produciton')
  cbind(df, as.data.frame(dairyFit$time.series))
}
dairyMult = dairy.decomp(dairy, col = 'Milk.Prod', span = 0.2)

dairy.acf(dairyMult)

hist.ts(dairyMult, col = 'remainder')

dairy.box <- function(df, col = 'remainder'){
  require(ggplot2)
  p <- ggplot(df, aes_string('Month', col)) +
    geom_boxplot() +
    ggtitle('Variation of remainder component of dairy production by month')
  print(p)
}
dairy.box(dairyMult)

dairyMult2 = dairy.decomp(dairy, col = 'Icecream.Prod', span = 0.2)
dairy.acf(dairyMult2) 
hist.ts(dairyMult2, col = 'remainder') 
dairy.box(dairyMult2)

model.dairy = function(df, col = 'remainder', order = c(0,0,1)){
  ts = ts(df[, col], frequency = 12, start = 1995)
  dairy.mod = arima(ts, order = order, include.mean = FALSE)
  print(dairy.mod)
  dairy.mod
}
ma1 = model.dairy(dairyMult, order = c(0,0,4))

ma1 = model.dairy(dairyMult, order = c(0,0,3))

dairy.acf(ma1$resid[-1], is.df = FALSE)

ar1 = model.dairy(dairyMult, order = c(2,0,0))

ar1 = model.dairy(dairyMult, order = c(1,0,0))

dairy.acf(ar1$resid[-1], is.df = FALSE)

arma1 = model.dairy(dairyMult, order = c(1,0,3))
dairy.acf(arma1$resid[-1], is.df = FALSE)

arma1 = model.dairy(dairyMult, order = c(1,0,1))

dairy.diff <- function(df, col = 'Milk.Prod', out = 'Milk.Diff'){
  ln <- nrow(df)
  temp <- ts(df[, col], frequency = 12, start = 1995)
  df[2:ln, out] <- diff(temp)
  df <- df[2:ln, ]
  df
}
dairyDiff <- dairy.diff(dairy)

dairyDiff = dairy.decomp(dairyDiff, col = 'Milk.Diff', span = 0.5, Mult = FALSE)

#dairyDiff
dairy.acf(dairyDiff$remainder, is.df = FALSE)
hist.ts(dairyDiff, col = 'remainder') 
dairy.box(dairyDiff)

arima1 = model.dairy(dairyMult, order = c(1,1,1))

dairy.acf(arima1$resid[-1], is.df = FALSE)

temp <- ts(log(dairy[, 'Milk.Prod']), frequency=12, start=1995)
install.packages("forecast")
library(forecast)
fit.dairy = auto.arima(temp, max.p=3, max.q=3,
      max.P=2, max.Q=2, max.order=5, max.d=2, max.D=1,
      start.p=0, start.q=0, start.P=0, start.Q=0)
summary(fit.dairy)

dairy.fit = forecast(fit.dairy, h=12)
summary(dairy.fit)

plot(dairy.fit)

temp <- ts(log(dairy[, 'Icecream.Prod']), frequency=12, start=1995)
#library(forecast)
fit.dairy = auto.arima(temp, max.p=3, max.q=3,
      max.P=2, max.Q=2, max.order=5, max.d=2, max.D=1,
      start.p=0, start.q=0, start.P=0, start.Q=0)
summary(fit.dairy)
dairy.fit = forecast(fit.dairy, h=12)
summary(dairy.fit)
plot(dairy.fit)
