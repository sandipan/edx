#Singles

TRUE
1==2
1
1.2
sqrt(as.complex(-1))
"5"
"abc"

#Vectors

c(1,1.2,pi,exp(1))
c(TRUE,1==2)
c("a","ab","abc")
c("a",5,1==2)

#Factor

gl(2,10, labels=c("male", "female"))
as.factor(c(rep("male",10),rep("female",10)))

#Matrix and arrays

matrix(c(1,2,3,4,5,6)+pi,nrow=2)
matrix(c(1,2,3,4,5,6)+pi,nrow=2)<6

array(c(1:24), dim=c(4,3,2))

#Data frame

data.frame(treatment=c("active","active","placebo"), 
           bp=c(80,85,90))
cbind(treatment=c("active","active","placebo"), 
      bp=c(80,85,90))

#Lists

list(a=1,b="abc",c=c(1,2,3),d=list(e=matrix(1:4,2), f=function(x)x^2))

#Simple Functions

square<-function(x){
  return(x*x)
}
square(1:5)

power<-function(x,pow){
  return(x^pow)
}
power(1:5,3)

#Default arguments 

power<-function(x,pow=2){
  return(x^pow)
}
power(1:5)
power(1:5,4)

#Masking functions

c<-function(x,y) x*y
c(2,3)
rm(c)
c(2,3)

#Simple plotting

set.seed(333)
x<-seq(0,6, length=100)
y<-2*x+3+rnorm(100)
plot(x,y)

plot(sin,0,2*pi)

#Function source

source("C:/programdir/script.R")
