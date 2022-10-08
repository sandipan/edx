#Preliminaries
#---------------------------------------------------------
rm(list = ls())
library("mvtnorm")
setwd('C:\\courses\\Edx\\Current\\MITx 14.310x Data Analysis for Social Scientists\\Week6')

real_theta <- 5
sample_size <- 100
number_simulations <- 100000

simulations1 <- matrix(runif(sample_size*number_simulations, max = real_theta), 
                       nrow = number_simulations)

xbar <- mean(apply(simulations1, 1, mean))

estimator_mean <- 2*apply(simulations1, 1, mean)
estimator_median <- 2*apply(simulations1, 1, median)

var(estimator_mean)
4*(5^2/12) / 100

p1 <- hist(estimator_mean, breaks = 100)
p2 <- hist(estimator_median, breaks = 100)
range <- range(p1$mids, p2$mids )
p1$counts = p1$density
p2$counts = p2$density

pdf("histogram1.pdf")
plot( p1, col=rgb(1,0,0,1/4), xlim = range, xlab = "values", ylab = "density")
plot( p2, col=rgb(0,0,1,1/4), add = TRUE)  
dev.off()

sample_size2 <- 1000
simulations2 <- matrix(runif(sample_size2*number_simulations, max = real_theta), 
                       nrow = number_simulations)
estimator_mean2 <- 2*apply(simulations2, 1, mean)
var(estimator_mean2)
4*(5^2/12) / 1000
p1 <- hist(estimator_mean, breaks = 100)
p2 <- hist(estimator_mean2, breaks = 100)
range <- range(p1$mids, p2$mids )
p1$counts = p1$density
p2$counts = p2$density
pdf("histogram2.pdf")
plot( p2, col=rgb(0,0,1,1/4), xlim = range, xlab = "values", ylab = "density")
plot( p1, col=rgb(1,0,0,1/4), add = TRUE)  
dev.off()
