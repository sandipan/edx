require(multtest)
data(golub)
class(golub)

dim(golub)
head(golub)
dim(golub.gnames)
golub.gnames[1:4, ]

golub[1,]

golub.cl
teststat = mt.teststat(golub, golub.cl)
welch_t<-mt.teststat(golub,golub.cl,test="t")
raw_p_t<-2*(1-pnorm(abs(welch_t)))
length(raw_p_t[raw_p_t<0.05])
fdr.p <- p.adjust(raw_p_t,"BH")
head(fdr.p)
length(fdr.p[fdr.p < 0.05])

BiocManager::install("qvalue")
BiocManager::install("fdrtool")

library(qvalue)
fdr.q <- qvalue(raw_p_t)
names(fdr.q)
length(fdr.q$pvalues[fdr.q$pvalues < 0.05])
length(fdr.q$qvalues[fdr.q$qvalues < 0.05])


require(ggplot2)
plt = ggplot(data.frame(teststat), aes(sample = teststat)) + stat_qq() + theme_bw()
plt
parts = mt.teststat.num.denum(golub, golub.cl)
names(parts)
head(parts$teststat.num)
head(parts$teststat.denum)
teststatNew = parts$teststat.num/parts$teststat.denum
plt = ggplot(data.frame(teststat, teststatNew), aes(x = teststat, y = teststatNew)) + 
  geom_line() + geom_abline(colour = "red", linetype = "dotted", size = 2) + 
  theme_bw()
plt

identical(2^100, 2^100 - 1)
identical(2^20, 2^20 - 1)

teststat
rawp = 2 * (1 - pnorm(abs(teststat)))
procedures = c("Bonferroni", "Holm", "Hochberg", "SidakSS", "SidakSD", "BH", 
               "BY")
adjusted = mt.rawp2adjp(rawp, procedures)
adjusted$adjp[1:10, ]

sum(rawp <= 0.05)

apply(adjusted$adjp, 2, function(x) sum(x <= 0.05))


n.ALL <- 27
n.AML <- 11
cancer.type <- c(rep("ALL", n.ALL), rep("AML", n.AML))
sample.ALL <- golub[1,cancer.type=="ALL"]
sample.AML <- golub[1,cancer.type=="AML"]
dim(sample.ALL)
dim(sample.AML)

## Estimate the population means
mean.est.ALL <- mean(sample.ALL)
mean.est.AML <- mean(sample.AML)

## Compute the sample sd
## Don't forget that the sd() function automatically computes the
## estimate corrected with sqrt(n-1)
sample.sd.ALL <- sd(sample.ALL) * sqrt((n.ALL-1)/n.ALL)
sample.sd.AML <- sd(sample.AML) * sqrt((n.AML-1)/n.AML)

## Es timate the population standard deviations 
## D(1on't fo 0rget that the sd() function automatically computes the
## estimate corrected with sqrt(n-1)
sd.est.ALL <- sd(sample.ALL)
sd.est.AML <- sd(sample.AML)

## Estimate the standard errors on the means
sd.err.est.ALL <- sd(sample.ALL) / sqrt(n.ALL)
sd.err.est.AML <- sd(sample.AML) / sqrt(n.AML)

## Estimate the standard deviation of the difference between two means, 
## according to Student's formula
diff.sd.est <- sqrt((n.ALL*sample.sd.ALL^2 + n.AML*sample.sd.AML^2) * (1/n.ALL + 1/n.AML) /(n.ALL+n.AML-2))

## Compute t.obs
d <- abs(mean.est.ALL - mean.est.AML)
t.obs.Student <- d/diff.sd.est

## Compute the P-value.
## Since we perform the two-tail test, the single-tail probability has
## to be multiplied by 2 in order to obtain the alpha risk.
P.val.Student <- 2*pt(q=t.obs.Student, df=n.ALL+n.AML-2,lower.tail=F)

setwd('C:/courses/edX/Current/MIT Stat Data Analysis/Module1')
load('alon.Rdata')
m=62
dat = alon
summary(dat)
y = as.factor(alon$y)
y
nrow(alon$x)
pval = numeric(m)
for (i in 1:m) {
  pval[i] = t.test(alon$x[i,1:5], alon$x[i,-(1:5)])$p.value
}

t.test(alon$x[,1:5], alon$x[,-(1:5)])

require(multtest)
#teststat = mt.teststat(alon$x, alon$y)
cl <- rep(0, ncol(alon$x))
cl[-(1:5)] <- 1
welch_t<-mt.teststat(alon$x,cl,test="t")
#raw_p_t<-2*(1-pnorm(abs(welch_t)))


df <- as.data.frame(t(as.matrix(dummy)))
X <- apply(as.matrix.noquote(df[2:nrow(df),]),2,as.numeric)
cl <- ifelse(df[1,] == 'A', 1, 0)
welch_t_stat = mt.teststat(X, cl, test='t')

rawp <- 2 * (1 - pnorm(abs(welch_t_stat)))
procedures <- c("Bonferroni", "Holm", "BH")
adjusted = mt.rawp2adjp(rawp, procedures)

welch_t<-mt.teststat(golub,golub.cl,test="t")
raw_p_t<-2*(1-pnorm(abs(welch_t)))
length(raw_p_t[raw_p_t<0.05])
fdr.p <- p.adjust(raw_p_t,"BH")
head(fdr.p)
length(fdr.p[fdr.p < 0.05])


data <- dummy
# remove the columns which only contain NA:
data$Lipid.4 <- NULL
data$Lipid.7 <- NULL
data$Lipid.9 <- NULL

# convert from string to numeric (I do it now manually with each column. You could use a for-loop)
data$Lipid.10 <- gsub(",", ".", data$Lipid.10)  # convert comma to dot
data$Lipid.10 <- as.numeric(data$Lipid.10) # convert from string to numeric
data$Lipid.11 <- gsub(",", ".", data$Lipid.11)
data$Lipid.11 <- as.numeric(data$Lipid.11)
data$Lipid.17 <- gsub(",", ".", data$Lipid.17)
data$Lipid.17 <- as.numeric(data$Lipid.17)

# get the lipid column names
all_lipids <- colnames(data)
all_lipids <-  all_lipids[all_lipids != "ID"] # we don't need the ID column for the loop

# now loop over each column an perform a t-test
for (column in all_lipids) {
  print(column)
  print(t.test(data[,column] ~ data$ID))
}

#library(lmtest)
set.seed(123)
n <- 1000
df <- data.frame(
    Rm.Rf = runif(n), 
    SMB = rnorm(n),
    HML = runif(n),
    MOM = rnorm(n),
    mom_to_add = runif(n)
)
df$ff4f_actual_excess_return_month1 <- 2*df$Rm.Rf - 36*df$SMB + 5*df$HML + 20*df$MOM + 0.5*df$mom_to_add + rnorm(n)
nested <- lm(formula = ff4f_actual_excess_return_month1 ~ 
                      Rm.Rf + 
                      SMB + 
                      HML + 
                      MOM,
                    data = df,
                    na.action=na.omit)
complex <- lm(formula = ff4f_actual_excess_return_month1 ~ 
                   Rm.Rf + 
                   SMB + 
                   HML + 
                   MOM +
                   mom_to_add,
                 data = df,
                 na.action=na.omit)

teststat <- -2 * (as.numeric(logLik(nested))-as.numeric(logLik(complex)))
p.val <- pchisq(teststat, df = 1, lower.tail = FALSE)

alpha <- 0.05
x <- seq(0, 6, 0.01)
plot(x, dchisq(x, df=1), type='l', lwd=2, xlab='', ylab='')
abline(v = qchisq(1-alpha, df=1), col='red', lwd=2, lty=2)
points(teststat, 0, col='green', pch=19, cex=2)
legend('topright', c("??2(1)", "??=0.05", "tstat"), col = c('black', 'red', 'green'),
       pch = c(NA, NA, 19), lwd = c(2, 2, NA), lty = c(1, 2, NA))


d <- 3
n <- 100
m <- rep(0, n)
s <- rep(0, n)
r <- d/(d-1)
m0 <- 2
m[1] <- m0*r
s[1] <- 1/(m[1] + d)
for (i in 2:n) {
  m[i] <- m[i-1]*r
  s[i] <- 1/(m[i] + d)
}

p <- 1
for (i in 1:n) {
  p <- p * (1 - s[i])
  print(p)
}

S <- 0
for (i in 1:(n-2)) {
  S <- S +  s[i]*prod(1 - s[(i+1):(n-1)])
  print(S)
}

S <- 0
for (i in 1:(n-2)) {
  S <- S +  s[i]*s[i+1]*m[i+1]
  print(S)
}

x <- matrix(c(-0.97, -0.69,-1.14,-0.93,0.26,1.14,0.76,1.32,- 0.79,1.04,-.80,-.97,-1.09,-1.09,0.63,1.09,0.92,1.49,-0.52,0.34),10,2)
colnames(x) <- c("X1","X2")
y <- c(-1,-1,-1,-1,1,1,1,1,1,-1)
df <- as.data.frame(x)
df$y <- y
m <- svm(y ~ ., data = df, kernel = "linear", cost = 10, scale = FALSE) 
plot(m, data = df, formula = y ~.)
#svm(y~., data=df, type="C-classification", kernel="linear", cost=10, scale=FALSE)

library(kernlab)
library(animation)

saveGIF({
  for (kernel in c('vanilladot', 'polydot', 'rbfdot')) {
    for (C in 10^c(-5:5)) {
      m <- ksvm(y~.,data=df,type="C-svc",
                kernel=kernel,C=C,prob.model=TRUE)
      plot(m,data=df, xlim=c(-1.2,1.2), ylim=c(-1.2,1.2))
      title(main=paste('\n\nwith kernel', kernel, 'C =', C), cex=0.8)
      
    }
  }
}
)

pchisq(1, 6.52/5)

set.seed(10111)
x = matrix(rnorm(40), 20, 2)
y = rep(c(-1, 1), c(10, 10))
x[y == 1,] = x[y == 1,] + 1
plot(x, col = y + 3, pch = 19)
dat = data.frame(x, y = as.factor(y))
svmfit = svm(y ~ ., data = dat, kernel = "linear", cost = 10, scale = FALSE)
print(svmfit)
plot(svmfit, dat)
integrate(function(y) exp(-y/10)/sqrt(y), 0, 6.52)$value / (2*sqrt(5)*sqrt(2*pi))



library(arules)
library(arulesViz)
df <- read.transactions(
  'C:\\Users\\Sandipan.Dey\\Downloads\\Market_Basket_Optimisation.csv',
  sep = ",",
  rm.duplicates = TRUE
)

set.seed(250)

rules1 <- apriori(df,
                  parameter = list(supp = 0.004,conf = 0.2))

arules::itemFrequencyPlot(df,
                          topN = 20,
                          col=brewer.pal(8,'Pastel2'),
                          main = 'Relative Item Frequency Plot',
                          type = 'relative',
                          ylab = 'Item Frequency'
)

plot(
  rules1[1:10],
  method = 'matrix',
  control = list(reorder='none') #lift
)




library(ggplot2)
size_n <- 2000
Wood_pile <- data.frame(ID = 1:size_n, DOB = runif(size_n, 15, 25), DUB = runif(size_n, 15, 25), Bark_thickness=runif(size_n))
#Wood_pile <- Wood_pile[sample(1:size_n, size = size_n),]
y <- Wood_pile$DUB 
nsamples <- 200
indices <- sample(1:size_n, nsamples, replace=TRUE)
y <- y[indices]
df <- data.frame(
  x = seq(1:nsamples), 
  y = y, 
  cu_y = cumsum(y),
  avg = mean(y)) %>%
  transform(cu_mean = cu_y/x) 

ggplot(df, aes(x, cu_mean)) + 
  geom_point(aes(color='sample mean')) + 
  geom_line(aes(y=avg, col='population mean'), lwd=2) + 
  xlab('#samples') +
  ylab('mean')
df$se <- mean((df$avg - df$cu_mean)^2)
df$ae <- abs(df$avg - df$cu_mean)

ggplot(df, aes(x, ae)) + geom_line(col='red', lwd=2) + xlab('#samples') + ylab('Absolute Error')
geom_line(data=df, aes(x, mse), col='orange', lty=2, lwd=2) + xlab('error')

mu_y <- mean(y)
sigma_y <- sd(y)
y_bars <- c()
for (i in 1:1000) {
  y_s <- sample(y, nsamples, replace=TRUE)
  y_bars <- c(y_bars, mean(y_s))
}

ggplot() + geom_histogram(aes((y_bars - mu_y)/(sigma_y/sqrt(nsamples)), y = ..density..)) + 
  geom_line(aes(seq(-4,4, 0.01), dnorm(seq(-4,4, 0.01)), color='N(0,1)'), lwd=2) + xlab('(ybar-??)/(??/???n)') 



denran6 <-  structure(list(Breeding_S = c("2011-2012", "2013-2014", "2013-2014", 
                                          "2014-2015", "2015-2016", "2016-2017"), Pack = c("ALA", "QUA", 
                                                                                           "BAT", "BBC", "BAT", "TAR"), vegcat = c("tall_bushy", "medium_bushy", 
                                                                                                                                   "short", "medium_bushy", "medium_bushy", "tall_bushy"), annual_grp = c(6L, 
                                                                                                                                                                                                          8L, 7L, 9L, 8L, 11L), category = structure(c(1L, 1L, 1L, 1L, 
                                                                                                                                                                                                                                                       1L, 1L), .Label = c("0", "1"), class = "factor"), HubDist = c(0.4987901777, 
                                                                                                                                                                                                                                                                                                                     4.748448273, 4.929173785, 5.172532752, 3.697064525, 2.630531764)), row.names = c(NA, 6L), class = "data.frame") 

justdistmodel <- glmer(category~HubDist + (1|Pack),
                       family = "binomial"(link="logit"),
                       data = denran6)


df<-structure(list(Survey = structure(c(1L, 1L, 3L, 3L, 2L, 2L, 1L, 
                                        5L, 1L, 2L, NA, 1L, 4L, 4L, 3L, 2L, 2L, 5L, 1L, 4L, 1L, 1L, 1L, 
                                        1L, 1L, 4L, 3L, 4L), .Label = c("Never", "Rarely", "Sometimes", 
                                                                        "Often", "Always"), class = "factor"), Score = c(2.27272727272727, 
                                                                                                                         18.1818181818182, 29.5454545454545, 22.7272727272727, 43.1818181818182, 
                                                                                                                         25, 75, 61.3636363636364, 29.5454545454545, 6.81818181818182, 
                                                                                                                         54.5454545454545, 36.3636363636364, 36.3636363636364, 70.4545454545455, 
                                                                                                                         22.7272727272727, 45.4545454545455, 31.8181818181818, 61.3636363636364, 
                                                                                                                         15.9090909090909, 47.5, 11.3636363636364, 52.5, 22.7272727272727, 
                                                                                                                         22.7272727272727, 4.54545454545455, 37.5, 35, 65.9090909090909
                                                                        )), row.names = c(NA, -28L), groups = structure(list(.rows = structure(list(
                                                                          1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L, 12L, 13L, 14L, 
                                                                          15L, 16L, 17L, 18L, 19L, 20L, 21L, 22L, 23L, 24L, 25L, 26L, 
                                                                          27L, 28L), ptype = integer(0), class = c("vctrs_list_of", 
                                                                                                                   "vctrs_vctr", "list"))), row.names = c(NA, -28L), class = c("tbl_df", 
                                                                                                                                                                               "tbl", "data.frame")), class = c("rowwise_df", "tbl_df", "tbl", 
                                                                                                                                                                                                                "data.frame"))

library(MASS)
m <- polr(Survey ~ Score, data = df, Hess=TRUE)
summary(m)
(ctable <- coef(summary(m)))
p <- pnorm(abs(ctable[, "t value"]), lower.tail = FALSE) * 2
(ctable <- cbind(ctable, "p value" = p))
confint.default(m)

Z <- ctable[,'Value'] / ctable[,'Std. Error']
pnorm(Z)

library(bestNormalize)
# NOT RUN {
x <- sort(rgamma(100, 1, 1))
BN_obj <- bestNormalize(x)
x.t <- BN_obj$x.t #predict(BN_obj, x)
plot(pgamma(x,1,1), pch=19, xlab='index', ylab='probability')
points(pnorm(x.t), pch=19, col='red')
legend('top', c("P(X<=x)", "P(Xt<=xt)"), col = c(1, 2),
       text.col = "green4", pch = c(19, 19),
       merge = TRUE, bg = "gray90")

x_test <- 1.2345
x.t_test <- predict(BN_obj, newdata = x_test)
all.equal(pnorm(x.t_test), pgamma(x_test, 1, 1), tolerance=0.03)

# }
# NOT RUN {
# With Repeated CV
BN_obj <- bestNormalize(x)
BN_obj
p <- predict(BN_obj)
x2 <- predict(BN_obj, newdata = p, inverse = TRUE)

all.equal(x2, x)
# }
# NOT RUN {

# }
# NOT RUN {
# With leave-one-out CV
BN_obj <- bestNormalize(x, loo = TRUE)
BN_obj
p <- predict(BN_obj)
x2 <- predict(BN_obj, newdata = p, inverse = TRUE)

all.equal(x2, x)
# }
# NOT RUN {
# Without CV
BN_obj <- bestNormalize(x, allow_orderNorm = FALSE, out_of_sample = FALSE)
BN_obj
p <- predict(BN_obj)
x2 <- predict(BN_obj, newdata = p, inverse = TRUE)

all.equal(x2, x)

# }

data("Italy")
attach(Italy)
bw <- npregbw(formula=gdp~ordered(year))
model <- npreg(bws = bw, gradients = TRUE)
summary(model)
plot(bw, plot.errors.method="bootstrap")
points(ordered(year), gdp, cex=.2, col="red")

xtrain <- data.frame(x1 = runif(100),
                     x2 = rnorm(100),
                     x3 = runif(100),
                     x4 = rnorm(100))
ytrain <- xtrain$x1^6 - 2*xtrain$x2^4 - 3*xtrain$x3^3 + 5*xtrain$x4 + rnorm(100)

library(np)
modcv= npregbw(ytrain ~ x1 + x2 + x3 + x4, data = xtrain, regtype= 'lc') 
fit= npreg(modcv)
summary(fit)

plot(xtrain$x1, ytrain, type = 'p', main = "kernel regression", xlab = '', ylab = '')
sortedx1= sort(fit$eval$x1, index.return= T)
yhat= fit$mean[sortedx1$ix]
lines(sortedx1$x, yhat, col = 'red')

print(mean((fit$mean- ytrain)^2))

library(animation)
saveGIF({
  x <- seq(-3,3,0.01)
  ?? <- 10
  for (n in 2^(1:30)) {
    plot(x, dnorm(x, sd = ??/sqrt(n)), ylab='pdf', type='l', 
         main=paste('normal pdf with variance \u03C3^2/n, \u03C3 = 10, n =', n))
    }  
})

fib <- c(1, 1)
for (i in 3:20) {
  fib <- c(fib, fib[i-1] + fib[i-2])
}
fib


df <- NULL
for (i in 1:10) {
  df <- rbind(df, data.frame(x1=fib[i], x2=fib[i+1], y=fib[i+2])) 
}


S <- c(1, 1,  2,  3,  5,  8,  13, 21, 34, 55, 89)
df <- NULL
for (i in 1:10) {
  df <- rbind(df, data.frame(x1=S[i], x2=S[i+1], y=S[i+2])) 
}


m <- lm(y~., df)
predict(m, newdata=data.frame(x1=55, x2=89))


library(keras)
library(tensorflow)
library(ggplot2)

#devtools::install_github("rstudio/tensorflow")

df <- read.csv('C:\\Users\\Sandipan.Dey\\Downloads\\MEI_FIN_25092021230250310.csv')
#df[df$Country == 'United States',]
df1 <- df[df$Subject == "Long-term interest rates, Per cent per annum",]
df1$TIME <- as.Date(paste0(df1$TIME, '-01'))
ggplot(df1, aes(TIME, Value)) + geom_line(col='blue', lwd=2)

Series <- df1$Value
diffed = diff(Series, differences = 1)
head(diffed)

lag_transform <- function(x, k= 1){
  
  lagged =  c(rep(NA, k), x[1:(length(x)-k)])
  DF = as.data.frame(cbind(lagged, x))
  colnames(DF) <- c( paste0('x-', k), 'x')
  DF[is.na(DF)] <- 0
  return(DF)
}
supervised = lag_transform(diffed, 1)
head(supervised)

N = nrow(supervised)
n = round(N *0.7, digits = 0)
train = supervised[1:n, ]
test  = supervised[(n+1):N,  ]

scale_data = function(train, test, feature_range = c(0, 1)) {
  x = train
  fr_min = feature_range[1]
  fr_max = feature_range[2]
  std_train = ((x - min(x) ) / (max(x) - min(x)  ))
  std_test  = ((test - min(x) ) / (max(x) - min(x)  ))
  
  scaled_train = std_train *(fr_max -fr_min) + fr_min
  scaled_test = std_test *(fr_max -fr_min) + fr_min
  
  return( list(scaled_train = as.vector(scaled_train), scaled_test = as.vector(scaled_test) ,scaler= c(min =min(x), max = max(x))) )
  
}

Scaled = scale_data(train, test, c(-1, 1))

y_train = Scaled$scaled_train[, 2]
x_train = Scaled$scaled_train[, 1]

y_test = Scaled$scaled_test[, 2]
x_test = Scaled$scaled_test[, 1]

invert_scaling = function(scaled, scaler, feature_range = c(0, 1)){
  min = scaler[1]
  max = scaler[2]
  t = length(scaled)
  mins = feature_range[1]
  maxs = feature_range[2]
  inverted_dfs = numeric(t)
  
  for( i in 1:t){
    X = (scaled[i]- mins)/(maxs - mins)
    rawValues = X *(max - min) + min
    inverted_dfs[i] <- rawValues
  }
  return(inverted_dfs)
}

# Reshape the input to 3-dim
dim(x_train) <- c(length(x_train), 1, 1)

# specify required arguments
X_shape2 = dim(x_train)[2]
X_shape3 = dim(x_train)[3]
batch_size = 1                # must be a common factor of both the train and test samples
units = 1                     # can adjust this, in model tuninig phase

#=========================================================================================

model <- keras_model_sequential() 
model%>%
  layer_lstm(units, batch_input_shape = c(batch_size, X_shape2, X_shape3), stateful= TRUE)%>%
  layer_dense(units = 1)

model %>% compile(
  loss = 'mean_squared_error',
  optimizer = optimizer_adam( lr= 0.02, decay = 1e-6 ),  
  metrics = c('accuracy')
)
summary(model)

Epochs = 50   
for(i in 1:Epochs ){
  model %>% fit(x_train, y_train, epochs=1, batch_size=batch_size, verbose=1, shuffle=FALSE)
  model %>% reset_states()
}

L = length(x_test)
scaler = Scaled$scaler
predictions = numeric(L)

for(i in 1:L){
  X = x_test[i]
  dim(X) = c(1,1,1)
  yhat = model %>% predict(X, batch_size=batch_size)
  # invert scaling
  yhat = invert_scaling(yhat, scaler,  c(-1, 1))
  # invert differencing
  yhat  = yhat + Series[(n+i)]
  # store
  predictions[i] <- yhat
}


data("AirPassengers")
plot(AirPassengers)
#install.packages("forecast")

S <- c(1, 2 , 10, 12, 3, 4, 13, 14, 5, 6, 15, 16, 7, 8, 17, 18, 9, 10, 19, 20)
Series <- S #fib
library(forecast)

model1=auto.arima(ts(Series, frequency=8)) #auto.arima(AirPassengers)
model1
plot(forecast(model1,24))

n <- 9
(n^2 - n - 6) / (n^2 - n - 4)
library(igraph)
g <- make_full_graph(n)
transitivity(g, type='global')
g1 <- g %>% delete.edges('1|2')
transitivity(g1, type='global')


library(igraph)
A <- matrix(c(0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0), nrow=10, byrow=TRUE)
g <- graph_from_adjacency_matrix(A)
membership <- rep(c(1,2),5)
modularity(g, membership)

df <- NULL
df <- rbind(df, data.frame(n = 100, T = .039))
df <- rbind(df, data.frame(n = 1000, T = .039))
df <- rbind(df, data.frame(n = 10000, T = .209))
df <- rbind(df, data.frame(n = 50000, T = .299))
df <- rbind(df, data.frame(n = 78498, T = .301))
df$logn <- log2(df$n)
fitmodel <- nls(T ~ a*(log(n))^2 + b*log(n) + c,
                data = df,
                start=list(a=1,b=1,c=1),      
                trace=TRUE)
summary(fitmodel)
params <- fitmodel$m$getAllPars()
n <- seq(100, 100000, 1)
fitmodel$m$predict(newdata = n)
pred <- params[1]*(log(n))^2 + params[2]*(log(n)) + params[3]
df1 <- data.frame(n = n, pred = pred)
df %>% ggplot(aes(n, T)) + geom_point() + geom_line() +
       geom_line(data=df1, aes(n, pred, col='pred'), lty=2) +
       theme_bw()

library(glmnet)

p=50
betas.true=c(rep(0.5, 10),rep(0,p-10))

train <- matrix(rnorm(1000*20), nrow=1000)
test <- matrix(rnorm(100*20), nrow=100)

n <- 100

res <- replicate(n, {
  cv.rr <- cv.glmnet(x=as.matrix(train[,-1]),y=as.numeric(train[,1]),alpha=0,nfolds=10,nlambda=100, intercept=FALSE)
  
  lambda.rr=cv.rr$lambda.min
  
  mse.rr <- mean((coef(cv.rr)[-1] - betas.true)^2)

  yhat.rr <- predict(cv.rr,s="lambda.min",newx=as.matrix(test[,-1]))
  mspe.rr <- mean((test[,1]-yhat.rr)^2)
  
  list(mse=mse.rr, mspe=mspe.rr)  
})

res_df <- as.data.frame(apply(res, 1, function(x) unlist(x)))
names(res_df) <- c('mse', 'mspe')
res_df[,1] <- res_df[,1] + 0.1*rnorm(100)
res_df[,2] <- res_df[,2] + 0.1*rnorm(100)
res_df %>% gather(key='metric', value='value') %>% ggplot(aes(value, fill=metric)) + geom_boxplot()



forestcov <- rnorm(1000, 50, 10) #c(45, 67, 35, 67, 12, 43, 75, 8, 34, 46)  #
numspecies <- sample(1:10, 1000, replace=TRUE) #c(3, 6, 4, 7, 2, 5, 8, 5, 3, 4) #  #
outcome <- as.factor(sample(c('yes', 'no'), 100, replace=TRUE)) #as.factor(c('no','no','yes','yes','no','yes',
                                    # 'no', 'yes', 'yes','no')) # #

df <- data.frame(outcome, forestcov, numspecies)
library(caret)
library(MLmetrics)

#partition data
set.seed(123) 
index <- createDataPartition(df$outcome, p = .5, list = FALSE, times = 1) 
train_df <- df[index,] 
test_df <- df[-index,] 

f1 <- function(data, lev = NULL, model = NULL) {
  
  f1_val <- F1_Score(y_pred = data$pred, y_true = data$obs)
  c(F1 = f1_val)
}

cfm <- function(data, lev = NULL, model = NULL) {
  
  cm <- confusionMatrix(table(data$pred, data$obs))
  print(cm)
  cm$byClass
}

#specify training methods
specifications <- trainControl(method = "cv", number = 5, 
                               savePredictions = "all", 
                               returnResamp = 'all',
                               classProbs = TRUE,
                               #verboseIter = TRUE,
                               summaryFunction = twoClassSummary #cfm #f1 #twoClassSummary
                               ) 

#specify logistic regression model
set.seed(1234) 
model1 <- train(outcome ~ ., #forestcov + numspecies, 
                data=train_df,
                method = 'glm', #"glmnet",
                #family = binomial, 
                #tuneLength = 15, 
                trControl = specifications #, 
                #metric='ROC'
                )
model1$resample


#produce confusion matrix
predictions <- predict(model1, newdata = test_df)
confusionMatrix(data = predictions, test_df$outcome)

### Loop Caret ###
results_caret <- data.frame(matrix(NA, nrow = 0, ncol = 1))  #store results
for (i in 1:500) {
  fit <- train(Sepal.Width ~ ., method = "lm", data = iris, trControl = trainControl(method = "repeatedcv", number=10, repeats=1))
  results_caret <- rbind (results_caret, fit$results$Rsquared)
}
mean (results_caret[,1])

library(fitdistrplus)
data <- rnorm(1000, 0.01, 1.01)  # original distribution N(0,01, 1.01)

fit_and_draw_sample <- function(data, nsamples, distr='norm') {
  if (distr == 'norm') {
    fitg <- fitdist(data, distr)   
    params <- fitg$estimate
    print(params)
    #      mean        sd 
    # 0.0398281 0.9876068 
    mu <- params[1]
    sigma <- params[2]
    return (rnorm(nsamples, mu, sigma))
  }
  # handle other distributions here
  return (NULL)
}

samples <- fit_and_draw_sample(data, 1000)
hist(data, col=scales::alpha('blue',.2), border=FALSE, main='samples from original and fitted distribution')
hist(samples, col=scales::alpha('red',.2), add=TRUE, border=FALSE)
legend('topright', c("original", "fitted"), col = c(rgb(0,0,1,0.2), rgb(1,0,0,0.2)), lwd=c(2,2))

library(microbenchmark)
v <- 1:1000
mbm <- microbenchmark("outer" = { outer(v, v, '*') },
                      "matprod" = { v%*%t(v)   },
                      "tcrossprod" = { tcrossprod(v)})
library(ggplot2)
autoplot(mbm)

library(quanteda)
human_data = data.frame(sequence=c('abcdefghijkl', 'xxxxyyxxyzz'))
human_data$words <- apply(human_data, 1, function(x) char_ngrams(unlist(tokens(x['sequence'], 'character')), n=6, concatenator = ''))

### Resampled Loop Manual ###
results_outer <- data.frame(matrix(NA, nrow = 0, ncol = 1)) 


for (loop in 1:500) {
  results <- data.frame(matrix(NA, nrow = 0, ncol = 1)) 
  iris <-iris[sample(nrow(iris)),]
  folds <- cut(seq(1,nrow(iris)),breaks=10,labels=FALSE)
  
  #10 fold
  for(i in 1:10){
    testIndexes <- which(folds==i,arr.ind=TRUE)
    testData <- iris[testIndexes, ]
    trainData <- iris[-testIndexes, ]
    
    OLS <- lm (Sepal.Width ~ ., data=trainData)
    Predicted <- as.data.frame (predict (OLS, newdata = testData))
    results <- rbind (results, corr.test(cbind (dplyr::select(testData, Sepal.Width), Predicted))$r[2,1])
  }
  print (results)
  results_outer <- rbind (results_outer, mean (results[,1]))
}
results_outer
mean (results_outer[,1])^2


library(caret)
library(mlbench)
data(Sonar)

set.seed(107)
inTrain <- createDataPartition(
  y = Sonar$Class,
  ## the outcome data are needed
  p = .75,
  ## The percentage of data in the
  ## training set
  list = FALSE
)
training <- Sonar[ inTrain,]
testing  <- Sonar[-inTrain,]

nrow(training)
#> [1] 157
nrow(testing)

ctrl <- trainControl(
  method = "repeatedcv", 
  repeats = 3,
  classProbs = TRUE, 
  summaryFunction = twoClassSummary
)

set.seed(123)
plsFit <- train(
  outcome ~ .,
  data=train_df,
  #Class ~ .,
  #data = training,
  method = "glmnet",
  #preProc = c("center", "scale"),
  tuneLength = 15,
  trControl = ctrl,
  tuneGrid=expand.grid(parameter=c(0.001, 0.01, 0.1, 1,10,100, 1000))
)
plsFit

modelLookup('glmnet')



set.seed(363)
n <- 10
x <- runif(n, min = 0, max = 80)
y <- 1000 + 15*x - 0.3*x^2 + rnorm(n, mean = 0, sd = 100)
dat <- data.frame(y = y, x = x, x2 = x^2)
M1 <- lm(y ~ 1, data = dat)
M2 <- lm(y ~ 1 + x, data = dat)
M3 <- lm(y ~ 1 + x + x2, data = dat)
anv <- anova(M1, M2, M3)


t <- seq(-10, 10, 0.01)
t <- seq(0, 10, 0.01)
fg <- 2*exp(-t*(1+t/2))/sqrt(2*pi) 
plot(t, fg, type='l')
abline(h=exp(1/2)*2/sqrt(2*pi), col='red')
abline(v=-1, col='red')
abline(h=2/sqrt(2*pi), col='red')
abline(v=0, col='red')

n <- seq(10^2, 10^7, 10^2)
plot(n, (log(n))^2-n*log(log(n)))

n <- 3
mean(replicate(100000, {
  days <- sample(1:365, n, replace=TRUE)
  length(unique(days)) == 2
}))
choose(365, 2)*(2^n-2)/365^n

A <- matrix(c(3,0,0,-2), nrow=2)
#A <- matrix(c(3,1,2,-2), nrow=2)
prcomp(A)
lres <- eigen(A%*%t(A))
D <- diag(lres$values)
U <- lres$vectors
rres <- eigen(t(A)%*%A)
V <- rres$vectors
res <- svd(A)
D <- diag(res$d)
U <- res$u
V <- res$v
r <- 2
matrix(U[,1:r], ncol=r) %*%sqrt(D[1:r,1:r])%*%t(V[,1:r])


library(dplyr)
set.seed(123)
pop = rnorm(100000,5,5)
i = 1
population = data.frame(i,pop)

mean(population$pop)
sample_1 <- population %>% sample_frac(0.01)
n <- length(sample_1$pop)
x_bar <- mean(sample_1$pop)
c(x_bar - qnorm(0.975)*5/sqrt(n), x_bar + qnorm(0.975)*5/sqrt(n))

library(animation)
library(ggplot2)
library(latex2exp)
saveGIF({
  #for (n in c(10, 100, 500, 1000, 2000, 5000)) {
  #for (n in seq(500, 2000, 100)) {
  n <- 10
  for (i in 1:50) {
      samples <- replicate(n,
                       {
                         mean(sample(pop, n, replace=TRUE))
                       })
    #print(n)
    #print(ggplot() + geom_histogram(aes(samples)) + xlab('x_bar') + geom_vline(aes(xintercept = 5, col='mu')) + guides(color=guide_legend(title="")) +
    #  ggtitle(paste('sample size', n)))
    xbar <- mean(samples)
    alpha <- 0.8 # 0.975
    lcl <- xbar - qnorm(alpha)*5/sqrt(n)
    ucl <- xbar + qnorm(alpha)*5/sqrt(n)
    print(c(xbar, lcl, ucl))
    df <- data.frame(x=xbar, y=2.5)
    print(df %>% ggplot(aes(x, y)) + 
            geom_point(color='red') +
            geom_text(aes(x+0.025, y-0.2), label=TeX(r'($\bar{X}_n$)')) + 
            geom_errorbarh(aes(y=2.5, xmin=lcl, xmax=ucl), 
                          colour="black", position=position_dodge(0.1)) + 
            geom_vline(xintercept = 5, color='green') +
            geom_text(aes(5+0.015, 4), label=TeX(r'($\mu$)')) + 
            ggtitle(TeX(sprintf(r'(%d%% Confidence Interval of $\mu$ constructed with a sample of size n = %d)', as.integer(alpha*100), n))) + 
            xlab('') + 
            #xlim(4.5, 5.5) +
            xlim(2, 8) +
            ylim(0, 5) +
            guides(color=guide_legend(title="")) +
            theme_bw() +
            theme(axis.title.y=element_blank(),
                  axis.text.y=element_blank(),
                  axis.ticks.y=element_blank())
    )
    
  }
  
})

library(plot3D)
M <- mesh(seq(-1, 1, length.out = 100),seq(-1, 1, length.out = 100))
x <- M$x  
y <- M$y
contour2D(x*y,x=seq(-1, 1, length.out = 100),y=seq(-1, 1, length.out = 100), levels=seq(-1.0,1.0,0.1))
contour2D(x^2+y^2,x=seq(-1, 1, length.out = 100),y=seq(-1, 1, length.out = 100), levels=c(1), add=TRUE)

M <- mesh(seq(-1, 1, length.out = 10),seq(-1, 1, length.out = 10))
x <- M$x  
y <- M$y
plot.new()
contour2D(x^2+y^2,x=seq(-1, 1, length.out = 10),y=seq(-1, 1, length.out = 10), levels=c(1), lwd=2, col='red')
arrows(x, y, x+0.25*y, y+0.25*x, length=0.1, lwd=2)

df <- read.csv('dataset_00_with_header.csv')
dim(unique(df))



library(plot3D)
M <- mesh(seq(-1, 1, length.out = 100),seq(-1, 1, length.out = 100))
x <- M$x  
y <- M$y
a <- b <- 1
c <- 0
contour2D(2*x^2-3*y^2-1,x=seq(-1, 1, length.out = 100),y=seq(-1, 1, length.out = 100), levels=seq(-1.0,1.0,0.1))
contour2D(a*x+b*y-c,x=seq(-1, 1, length.out = 100),y=seq(-1, 1, length.out = 100), levels=c(0), add=TRUE)
points(3*a*c/(3*a^2+2*b^2),2*b*c/(3*a^2+2*b^2),pch=19, col='red', cex=2)

M <- mesh(seq(-1, 1, length.out = 10),seq(-1, 1, length.out = 10))
x <- M$x  
y <- M$y
plot.new()
contour2D(2*x^2-3*y^2,x=seq(-1, 1, length.out = 10),y=seq(-1, 1, length.out = 10), levels=c(1), lwd=2, col='red')
arrows(x, y, x+0.25*a, y+0.25*b, length=0.1, lwd=2)

library(animation)
saveGIF({
  c <- 0
  a <- b <- 1
  for (a in seq(-1,1,0.05)){
    for (b in seq(-1,1,0.05)) {
      M <- mesh(seq(-1.5, 1.5, length.out = 100),seq(-1.2, 1.2, length.out = 100))
      x <- M$x  
      y <- M$y
      z <- 3*a/sqrt(2)/sqrt(9*a^2-6*b^2)
      w <- sqrt(2)*b/sqrt(9*a^2-6*b^2)
      print(paste(z,w))
      x1 <- (c*a+5*a*b^2/sqrt(2)/sqrt(9*a^2-6*b^2)) / (a^2+b^2)
      y1 <- (b*c-5*a^2*b/sqrt(2)/sqrt(9*a^2-6*b^2)) / (a^2+b^2)
      if (!is.nan(sqrt((z-x1)^2+(-w-y1)^2)) & (z >= 0)) {
        contour2D(2*x^2-3*y^2-1,x=seq(-1.5, 1.5, length.out = 100),y=seq(-1.2, 1.2, length.out = 100), levels=c(0), 
                  main=paste('dist:', sqrt((z-x1)^2+(-w-y1)^2)), col='green')
        contour2D(a*x+b*y-c,x=seq(-1.5, 1.5, length.out = 100),y=seq(-1.2, 1.2, length.out = 100), levels=c(0), add=TRUE, col='blue')
        points(z, -w, pch=19, cex=2, col='red')
        points(x1, y1, pch=19, cex=2, col='red')
      }
    }
  }
}
)

library(plot3D)
M <- mesh(seq(-1.2, 1.2, length.out = 100),seq(-1.2, 1.2, length.out = 100))
x <- M$x  
y <- M$y
contour2D(x^2+y^2,x=seq(-1.2, 1.2, length.out = 100),y=seq(-1.2, 1.2, length.out = 100), levels=c(1))
contour2D(x+y,x=seq(-1.2, 1.2, length.out = 100),y=seq(-1.2, 1.2, length.out = 100), levels=seq(1,2,0.05), add=TRUE)

M <- mesh(seq(-1, 1, length.out = 100),seq(-1, 1, length.out = 100))
x <- M$x  
y <- M$y
plot.new()
contour2D(x^2+y^2,x=seq(-1, 1, length.out = 100),y=seq(-1, 1, length.out = 100), levels=c(1), lwd=2, col='red')
M <- mesh(seq(-1, 1, length.out = 10),seq(-1, 1, length.out = 10))
x <- M$x  
y <- M$y
arrows(x, y, x+0.25*1, y+0.25*1, length=0.1, lwd=2)

alpha <- 0.1
x0 <- 1
y0 <- 1
library(plot3D)
M <- mesh(seq(-1.2, 1.2, length.out = 100),seq(-1.2, 1.2, length.out = 100))
x <- M$x  
y <- M$y
saveGIF(
  {
    for (i in 1:10) {
      contour2D(x^2+y^2,x=seq(-1.2, 1.2, length.out = 100),y=seq(-1.2, 1.2, length.out = 100), levels=c(1), 
                main=paste0('iteration', i, ' (x0=', x0, ', y0=', y0, ')'))
      contour2D(x+y,x=seq(-1.2, 1.2, length.out = 100),y=seq(-1.2, 1.2, length.out = 100), levels=seq(1,2,0.05), add=TRUE)
      x1 <- x0 - alpha*2*x0
      y1 <- y0 - alpha*2*y0
      lines(c(x0,x1), c(y0,y1), col='red')
      x0 <- x1
      y0 <- y1
    }
  }
)

plot(rnorm(1000), type='l')
plot(cos(rnorm(1000)), type='l')
plot(cumsum(cos(rnorm(1000))), type='l')

x <- -4:4
x <- rep(c(-1,0,1,0), 2)
ac <- acf(x, type = "covariance")

mu <- mean(x)
n <- length(x)

ghs <- rep(1, n)
for (h in 0:(n-1)) {
  gh <- 0
  for (t in 1:(n-h)) {
    gh <- gh + (x[t]-mu)*(x[t+h]-mu)
  }
  ghs[1+h] <- gh / n
}

for (n in 1:4)
 print(prod(n:4)/factorial(5-n)/6^n)
c(1/6,1/9,1/36,1/324)

trials <- 'HTTTHHTTT'
X <- c(0)
for (t in 1:nchar(trials)){
  X <- c(X, X[t] + ifelse(substring(trials, t, t)=='H', 1, -1))
}

res <- replicate(10000, {X[t]+ifelse(sample(0:1,1, prob=c(1/4,3/4))==1, 1, -1)})

t <- 10
res <- replicate(10000, {x <- X[t]
                  for (i in 1:11)      
                    x <- x+ifelse(sample(0:1,1, prob=c(1/4,3/4))==1, 1, -1)
                  x})


res <- replicate(10000, {x <- X[t]
for (i in 1:11)      
  x <- x+ifelse(sample(0:1,1, prob=c(1/2,1/2))==1, 1, -1)
x})

n <- 1000
k <- 10
L <- 10
aic <- 2*k - 2*log(L)
bic <- k*log(n) - 2*log(L)
print(paste(aic, bic))
k <- 20
L <- 10^6
aic <- 2*k - 2*log(L)
bic <- k*log(n) - 2*log(L)
print(paste(aic, bic))


for (n in 1:10) {
  s <- 0
  for (i in 1:n) {
    s <- s + 1/sqrt(4*n^2-i^2)
  }
  print(paste(n, s))
}


library(igraph)
set.seed(2)
n <- 5   #  n=5
m <- 6   #  m=6
g <- erdos.renyi.game(n, p.or.m=m, type="gnm" , directed=FALSE, loops=FALSE)

lap_mat <- laplacian_matrix(g)   
print(paste("number of spanning trees by cofactor = ", det(as.matrix(lap_mat[-1,-1]))))

par(mfrow=c(2, 3))
layout <- layout.fruchterman.reingold(g)
plot(g, main="Original graph", vertex.size = 40, layout = layout)

cycle_edges <- c()
E <- list()
for (path in all_simple_paths(g, 1, 2, mode="out")) {
  pn <- length(path)
  if (pn > 2) {
    cycle <- c(as.vector(path), 1)
    name <- paste(cycle, collapse='')
    E[[name]] <- c()
    for (i in 1:pn) {
      E[[name]] <- c(E[[name]], paste(cycle[i],cycle[i+1],sep='|'))    
    }
  } 
}

par(mfrow=c(4,3))
count <- 1
for (e1 in E[[1]]) {
  for (e2 in E[[2]]) {
    if (e1 != e2) {
      g1 <- g %>% delete_edges(c(e1, e2))
      plot(g1, main=paste("spanning tree", count), vertex.size = 40, layout = layout)
      count <- count + 1
    }
  }
}

g1 <- g %>% delete_edges(c('5|2', '5|1'))
plot(g1, main=paste("spanning tree", count), vertex.size = 40, layout = layout)


mean(replicate(100000, 
          {
            x1 <- sample(1:6, 1)
            if (x1 %% 2 == 0) {
              x2 <- sample(c(1,3,5),1)
            } else {
              x2 <- sample(1:6, 1)
            }
            x1*x2
          }))

set.seed(1)
cuts <- replicate(100000, 
               {
                 x <- 1
                 i <- 0
                 while (x >= 1/2) {
                   x <- runif(1, 0, x) # keep the left part
                   i <- i + 1                   
                 }
                 i
               }
               )
mean(cuts)


d <- c(1,1,3,3,3,4,4,2,4,2,2)

tr <- NULL
for (i in 1:(length(d)-1)) {
  tr <- rbind(tr, data.frame(x=d[i], y=d[i+1]))
}

trans <- as(tr, "transactions") 
itemsets <- eclat(trans)
support(items(itemsets), trans)
rules <- apriori(trans, parameter = list(supp = 0.0001, conf = 0.0001))


d <- c(1,1,3,3,3,4,4,2,4,2,2)
tr <- NULL
for (i in 1:(length(d)-1)) {
  tr <- rbind(tr, data.frame(x=d[i], y=d[i+1]))
}
tr
tbl <- table(tr)
tbl / rowSums(tbl)


n <- 101
p <- seq(0, 1,0.01)
plot(p, 1-p - exp(-n/(2*p)*(p-1/2)^2), type='l')

n <- 101
p <- seq(0, 1,0.01)
plot(p, pbinom(n/2, n, p, lower.tail=FALSE)-p, pch=19)
abline(h=0)
abline(v=0.5)

n <- seq(3,201,2)
plot(n, pbinom(n/2, n, 0.51, lower.tail=FALSE), type='l')
for (p in seq(0.6,1,0.1)) {
  lines(n, pbinom(n/2, n, p, lower.tail=FALSE))
}

x1 = 1:20
x2 = x1
x2[10] = x2[15] = NA
y = 5 + 10*x1 + runif()
cor(x1, y)
cor(x1, x2)
cor(x2, y)

x <- rnorm(1000)
var(x)
x1 <- sample(x, 10)
var(x1)

z <- -2.940594
#z-z^3/6+z^5/40-z^7/336+z^9/3456-z^11/42240-
s <- z
for (i in 1:20) {
  #print((-1)^i*((2*i+1)*2^i*factorial(i)))
  s <- s + (-1)^i*z^(2*i+1)/((2*i+1)*2^i*factorial(i))
}