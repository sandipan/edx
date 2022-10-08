library(rmutil)

y = rexp(1000, 1)
qqnorm(y)
qqline(y)

qt(1-0.025, 5-1)

x = rlaplace(1000)
y = rep(0, length(x))
for (i in 1:length(x)) {
  y[i] = mean(abs(x-x[i]))
}
plot(x,y)
abline(v=median(x))
abline(v=mean(x), col='red')
print(mean(abs(x-mean(x))))
print(mean(abs(x-median(x))))


t.test2 <- function(m1,m2,s1,s2,n1,n2,m0=0,equal.variance=FALSE)
{
  if( equal.variance==FALSE ) 
  {
    se <- sqrt( (s1^2/n1) + (s2^2/n2) )
    # welch-satterthwaite df
    df <- ( (s1^2/n1 + s2^2/n2)^2 )/( (s1^2/n1)^2/(n1-1) + (s2^2/n2)^2/(n2-1) )
    print(df)
  } else
  {
    # pooled standard deviation, scaled by the sample sizes
    se <- sqrt( (1/n1 + 1/n2) * ((n1-1)*s1^2 + (n2-1)*s2^2)/(n1+n2-2) ) 
    df <- n1+n2-2
  }      
  t <- (m1-m2-m0)/se 
  dat <- c(m1-m2, se, t, 2*pt(-abs(t),df))    
  names(dat) <- c("Difference of means", "Std Error", "t", "p-value")
  return(dat) 
}
# you'll find this output agrees with that of t.test when you input x1,x2
t.test2(1.2, 1.0, sqrt(0.5), sqrt(0.5), 5, 5)


W = 5*(0.90 - 0)^2 / (1.31-0.90^2)
print(W)
print(1-pchisq(W, df=1))
T = sqrt(5)*(0.90-0) / sqrt(5*(1.31-0.90^2)/4)
print(T^2)
print(1-pt(T, df=4))

S = 0.625
T = 0.9 / sqrt(0.625)
2*(1-pt(T, df=4))
print(0.9-qt(0.025, df=4)*sqrt(5*(1.31-0.90^2)/4)/sqrt(5))
print(0.9+qt(0.025, df=4)*sqrt(5*(1.31-0.90^2)/4)/sqrt(5))
print(0.90-2.776445*sqrt(S)/sqrt(5))
print(0.90+2.776445*sqrt(S)/sqrt(5))

theta=3
integrate(function(x)(x^3/theta)*exp(-x^2/(2*theta)), 0, Inf)
qchisq(1-0.07, df=1)

th = (1.09+0.86^2)/2
1-pchisq(500*(th-1)^2/th^2, df=1) 
1-pchisq(2*500*(th-1-log(th)), df=1) 

x <- matrix(c(0,1,0,1,0,0,3,0), ncol=2, byrow=T)
y <- c(10,9,7,-1)
print(solve(t(x)%*%x)%*%(t(x)%*%y))
plot(x[,1],x[,2], col=y-min(y), pch=19)