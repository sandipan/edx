#A first session

set.seed(476)
x<-rnorm(100)
head(x)
mean(x)
sd(x)
min(x)
max(x)

#Basic operations

2+2
7*17
sqrt(9)
3^3
log(7)
log10(7)

#Precision

sin(pi/2)
pi
options(digits=22)
pi

#Infinity or not defined, and missings

1/0  
2*Inf
-1/0
0/0
c(1,2,3,NA,5)
mean(c(1,2,3,NA,5))

#Assignments to variables

rm(list=ls())
options(digits=7)
x <- 5
x
# x=5 can be used; not recommended
x*x
y <- x+5
ls()
rm(x)
ls()

#Internal help function

?mean    # shorthand for help(mean)
example(mean)
??"fitting linear model"   # shorthand for 
# help.search("fitting linear model")
#Manuals

help.start()