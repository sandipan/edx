f <- function(t) {
  return(2*sin(3*t)-4*sin(2*t))
}

an <- function(t, n) {
  return (f(t)*cos(n*t) / pi)
}

bn <- function(t, n) {
  return (f(t)*sin(n*t) / pi) 
}

for (n in 0:4) {
  print(integrate(an, -pi, pi, n=n))  
}

for (n in 1:4) {
  print(integrate(bn, -pi, pi, n=n))  
}

#integrate(function(t) (2*sin(3*t)-4*sin(2*t))*sin(2*t)/pi, -pi, pi)

integrate(function(t) sqrt(pi^2 - t^2) / (2*pi), -pi, pi)

all.equal(integrate(function(t) t^2 / (2*pi), -pi, pi)$value, pi^2/3)

integrate(function(t) abs(t)*sin(7*t)/pi, -pi, pi)

integrate(function(t) ifelse((t < pi/3) & (t > -2*pi/3), -2*sin(5*t)/pi, 2*sin(5*t)/pi), -pi, pi)

library(rSymPy)  
t <- Var("t")
n <- Var("n")

sympy("integrate(t*sin(n*t)/pi,(t,0,pi))") 

sympy("integrate(2*sin(n*t)/pi,(t,0,pi))") 

require(pracma)
library(elliptic)
for (n in -2:2) {
  print(integral(function(t) sin(2*pi*t)*sin(2*pi*t)*exp(-1i*n*2*pi*t),-1/2, 1/2))
  #print(myintegrate(function(t) sin(2*pi*t)*sin(2*pi*t)*exp(-1i*n*2*pi*t),-1/2, 1/2))
}

sympy("integrate(2*t*cos(n*t)/pi,(t,0,pi))") 

sympy("integrate(t*sin(n*pi*t/2)/2,(t,0,2))") 

sympy("integrate(2*t*t*cos(n*pi*t),(t,0,1))") 

sympy("integrate(t*sin(n*t)/pi,(t,-pi,pi))")
sympy("integrate(t*cos(n*t)/pi,(t,-pi,pi))")
sympy("integrate(t/pi/2,(t,-pi,pi))")

sympy("integrate((t+5)*sin(n*pi*t),(t,-1,1))") 
sympy("integrate((t+5)*cos(n*pi*t),(t,-1,1))")
as.integer(sympy("integrate((t+5),(t,-1,1))")) /2

sympy("integrate((1+t*t)*sin(n*t)/pi,(t,0,pi))")
sympy("integrate((1+t*t)*cos(n*t)/pi,(t,0,pi))")
sympy("integrate((1+t*t)/2,(t,0,pi))")

sympy("integrate(2*1*sin(n*t)/pi,(t,0,pi))") # sq
sympy("integrate(2*t*cos(n*t)/pi,(t,0,pi))") # tr
sympy("integrate(2*t/pi,(t,0,pi))") # tr

sympy("integrate(4*sin(t)*cos(2*n*t)/pi,(t,0,pi/2))") # tr
sympy("integrate(4*sin(t)/pi,(t,0,pi/2))") # tr

library(rSymPy)  
t <- Var("t")
n <- Var("n")
S
simplify <- function(s) {
  sympy(paste0("simplify(", gsub("sin\\(pi\\*n\\)", "0", s), ")"))
}
Fourier_n_part <- function(fes1, fes2, Ls) {
  print(sympy(paste0("integrate((", fes1, ")/(", Ls,")/2, (t,-", Ls, ",0)) + ", 
                     "integrate((", fes2, ")/(", Ls,")/2, (t,0,", Ls, "))"))) # a0/2
  exp1 <- paste0(fes1, "*cos(n*pi/(", Ls, ")*t)/(", Ls, ")")
  exp1 <- sympy(paste0("simplify(", exp1, ")"))
  exp2 <- paste0(fes2, "*cos(n*pi/(", Ls, ")*t)/(", Ls, ")")
  exp2 <- sympy(paste0("simplify(", exp2, ")"))
  print(paste0(sympy("integrate(", exp1, ",(t,-", Ls, ",0))"), "+",
                        sympy("integrate(", exp2, ",(t,0,", Ls, "))"))) # an
  exp1 <- paste0(fes1, "*sin(n*pi/(", Ls, ")*t)/(", Ls, ")")
  exp1 <- sympy(paste0("simplify(", exp1, ")"))
  exp2 <- paste0(fes2, "*sin(n*pi/(", Ls, ")*t)/(", Ls, ")")
  exp2 <- sympy(paste0("simplify(", exp2, ")"))
  print(paste0(sympy("integrate(", exp1, ",(t,-", Ls, ",0))"), "+",
               sympy("integrate(", exp2, ",(t,0,", Ls, "))"), ")")) # bn
}
Fourier_n <- function(fes, Ls) {
  print(sympy(paste0("integrate((", fes, ")/(", Ls,"), (t,-", Ls, "," , Ls,"))"))) # a0/2
  exp <- paste0(fes, "*cos(n*pi/(", Ls, ")*t)/(", Ls, ")")
  exp <- sympy(paste0("simplify(", exp, ")"))
  print(simplify(sympy(paste0("integrate(", exp, ",(t,-", Ls, "," , Ls,"))")))) # an
  exp <- paste0(fes, "*sin(n*pi/(", Ls, ")*t)/(", Ls, ")")
  exp <- sympy(paste0("simplify(", exp, ")"))
  print(sympy(paste0("integrate(", exp, ",(t,-", Ls, "," , Ls,"))"))) # bn
  #print(simplify(sympy(paste0("integrate(", exp, ",(t,-", Ls, "," , Ls,"))")))) # bn
}
Fourier_e_n <- function(fes, Ls) {
  print(sympy(paste0("integrate((", fes, ")/(", Ls,"), (t,0,", Ls, "))"))) # a0/2
  exp <- paste0("2*", fes, "*cos(n*pi/(", Ls, ")*t)/(", Ls, ")")
  exp <- sympy(paste0("simplify(", exp, ")"))
  print(sympy(paste0("integrate(", exp, ",(t,0,", Ls, "))"))) # an
  #print(simplify(sympy(paste0("integrate(", exp, ",(t,0,", Ls, "))")))) # an
}
Fourier_o_n <- function(fos, Ls) {
  exp <- paste0("2*(", fos, ")*sin(n*pi/(", Ls, ")*t)/(", Ls, ")")
  exp <- sympy(paste0("simplify(", exp, ")"))
  print(sympy(paste0("integrate(", exp, ",(t,0,", Ls, "))"))) # bn
  #print(simplify(sympy(paste0("integrate(", exp, ",(t,0,", Ls, "))")))) # bn
}

sympy("integrate(2*t*sin(n*pi*t/2),(t,0,1))")

sympy("integrate(t*sin(n*pi*t/2),(t,0,1))")
sympy("integrate((2-t)*sin(n*pi*t/2),(t,1,2))")
sympy("integrate(t*cos(n*pi*t/2),(t,0,1))")
sympy("integrate((2-t)*cos(n*pi*t/2),(t,1,2))")

sympy("integrate(((t/2)*sin(n*pi*t/2)),(t,-1,1))")
sympy("integrate(((1-t/2)*sin(n*pi*t/2)),(t,1,2))")
sympy("integrate(((-1-t/2)*sin(n*pi*t/2)),(t,-2,-1))")

sympy("integrate(((t/2)*cos(n*pi*t/2)),(t,-1,1))")
sympy("integrate(((1-t/2)*cos(n*pi*t/2)),(t,1,2))")
sympy("integrate(((-1-t/2)*cos(n*pi*t/2)),(t,-2,-1))")

L <- Var("L")
Fourier_e_n("(2*t/L-1)", "L")

Fourier_e_n("sin(t)", "pi/2")
Fourier_o_n("1", "pi") # Sq(t)
Fourier_n_part("-1", "1", "pi") # Sq(t)
Fourier_e_n("t", "pi") # T(t)
Fourier_n_part("-t", "t", "pi") # T(t)
Fourier_o_n("pi*t-t*t", "pi") 
Fourier_o_n("t", "pi") # SawTooth(t)
Fourier_o_n("t", "1") # SawTooth(t)
Fourier_e_n("t", "1") # T(t)
Fourier_n_part("-t", "t", "1") # T(t)
Fourier_o_n("t", "1") # SawTooth(t)
Fourier_o_n("2*t-1", "1") 
Fourier_o_n("1", "pi") # Sq(t)
Fourier_o_n("10", "pi") # Sq(t)
Fourier_o_n("t", "2") # SawTooth(t)
Fourier_n("((t+1)*(t+1))", "1") 
Fourier_n_part("((t+2)*(t+2))", "(t*t)", "1")
Fourier_e_n("t*t", "1")

t <- 1
n <- 1:10
f <- -20*cos(pi*n)/(pi*n) + 20/(pi*n)
f[3] <- f[3] + 1
f[5] <- f[5] + 20
f[7] <- f[7] + 2
f <- f * exp(-n^2*t)
plot(n,f,pch=19, col='red')
lines(n,f)

w <- Var("w")
Fourier_e_n("sin(w*t)", "pi/(2*w)") # |sin(wt)|
Fourier_o_n("t", "pi/w") 

sum(1/(1:10000)^2)
pi^2/6

n <- 1:100000 #seq(1, 100000, 2)
5+sum(2*(-1)^(n+1)/(n*pi)*sin(n*pi/2))

integrate(function(t) abs(t)* (ifelse(t > 0, 1, -1)), -1, 1)

integrate(function(t) t*(abs(t)-1)*sin(3*pi*t)/1, -1, 1)


g <- function(x) {
  x <- abs(x)
  f <- ifelse(x > 0 & x < 1, x/2-1/2, ifelse(x > 1 & x < 2, 3*x-3, -3*x+9))
  f <- f * sign(x)
  return(f)
}

x <- seq(-3,3,0.01)
plot(x, g(x), type='l',las=1,xaxp  = c(0, 6, 6),xlim=c(-3,3), ylim=c(-3,3),
     xaxs="i", yaxs="i")
grid(6)

n <- 1:5
plot(n, 1/(100-(n*pi)^2)/n, type = 'l')


n <- seq(1,10,2)
f <- (4/pi)*(1/(9.1-n^2)/n)
plot(n, f, type = 'l')

n <- seq(1,8,2)
f <- (1/(sqrt((49-n^2)^2+(0.1*n)^2))/n)
plot(n, f, type = 'l')

n <- 1:5
2*(-1)^(n+1)/sqrt((1-n^2)^2+(0.1*n)^2)/n


n <- 3
(4/pi)*(1/(sqrt((8-n^2)^2+(n)^2))/n)



n <- seq(1,8,2)
f <- (4/(sqrt((9-n^2)^2+(2*n)^2))/(pi^2*n^2))
plot(c(0,n), c(pi/9, f), type = 'l')

211 * (1:12) #2^((1:12)/12)
117.1875 * 2^((1:30)/12) 
117.1875 * (1:15)
539.1 * (1:12) #2^((1:12)/12)

for (t in seq(0,0.5,0.01)) {
  print(t)
  sts <- 0
  for (x in seq(0,1,0.01)) {
    st <- 1/2-4/pi^2*cos(pi*x)*exp(-2*pi^2*t)-4/pi^2/9*cos(3*pi*x)*exp(-18*pi^2*t)-4/pi^2/25*cos(5*pi*x)*exp(-50*pi^2*t)
    sts <- sts + st
  }
  st <- sts / 101
  print(paste(t, st, 100*abs(st-1/2) / st))
}

T <- list()
for (x in seq(0,1,0.001)) {
  T[[as.character(x)]] <- NA
}
for (t in seq(0,0.5,0.01)) {
  print(t)
  for (x in seq(0,1,0.001)) {
    st <- 1/2-4/pi^2*cos(pi*x)*exp(-2*pi^2*t)-4/pi^2/9*cos(3*pi*x)*exp(-18*pi^2*t)-4/pi^2/25*cos(5*pi*x)*exp(-50*pi^2*t)
    if ((100*abs(st-1/2) / st <= 1) && (is.na(T[[as.character(x)]]))) {
      T[[as.character(x)]] <- t
    }
  }
}

data.frame(x=names(T), t=unlist(T)) %>% ggplot(aes(x, t)) + geom_bar(stat = 'identity') +
  ggtitle(paste('time taken to be within 1% of steady solution')) + 
  scale_x_discrete(breaks=seq(0,1,0.1)) +
  theme_bw()

setwd('C:/Courses/Edx/Current/Mitx Differential Equations Fourier Series')

library(tidyverse)
library(animation)
x <- 1/5
n <- 1:100
saveGIF({
  #df <- data.frame(t=rep(-0.005,101), x=seq(0,1,0.01), stdiffpercent = 100*abs(seq(0,1,0.01)-1/2) / st) #st=seq(0,1,0.01))
  df <- data.frame(t=rep(-0.005,101), x=seq(0,1,0.01), st=seq(0,1,0.01))
  df %>% ggplot(aes(x, st, group=t, col=t)) + geom_line() +
    scale_color_gradient(low = 'blue', high='red') +
    ylab('temp') + 
    ggtitle(paste('initial saline concentration')) +
    theme_bw()
  for (t in seq(0,0.5,0.01)) {
    print(t)
    for (x in seq(0,1,0.01)) {
      st <- 1/2-4/pi^2*cos(pi*x)*exp(-2*pi^2*t)-4/pi^2/9*cos(3*pi*x)*exp(-18*pi^2*t)-4/pi^2/25*cos(5*pi*x)*exp(-50*pi^2*t)
      #st <- 1/2-sum(4/(n^2*pi^2)*cos(n*pi*x)*exp(-2*n^2*pi^2*t))
      #print(paste(t, st, 100*abs(st-1/2) / st))
      df <- rbind(df, data.frame(t=t, x=x, st=st))
      #df <- rbind(df, data.frame(t=t, x=x, stdiffpercent=100*abs(st-1/2) / st))
    }
    print(df %>% ggplot(aes(x, st, group=t, col=t)) + geom_line() +
            scale_color_gradient(low = 'blue', high='red') +
            ylab('saline concentration') + 
            ggtitle(paste('saline concentration at different locations at time', round(t,2))) +
            theme_bw())
    #print(df %>% ggplot(aes(x, stdiffpercent, group=t, col=t)) + geom_line() +
    #        scale_color_gradient(low = 'blue', high='red') +
    #        ylab('temp') + 
    #        ggtitle(paste('saline concentration diff from steady state temp at different locations at time', round(t,2))) +
    #        theme_bw())
  }
})

Sq <- function(t) {
  ifelse(t > 0, ifelse(as.integer(t / pi) %% 2 == 0, 1, -1), 
                ifelse(as.integer(t / pi) %% 2 == 1, 1, -1))
}

Tr <- function(t) {
  i <- as.integer(t / pi)
  ifelse(t > 0, ifelse(i %% 2 == 0, t - i*pi, -t + (i+1)*pi), 
         ifelse(i %% 2 == 0, -t + i*pi, t - (i-1)*pi))
}

St <- function(t) {
  i <- floor((t + pi) / (2*pi))
  t - i*2*pi
}

t <- seq(-3*pi, 3*pi, 0.01)
t1 <- c(rep(c(rep(1,pi/0.01),rep(0,pi/0.01)),3),1)
t2 <- c(rep(c(rep(0,pi/0.01),rep(1,pi/0.01)),3),0)
ggplot() + 
  #geom_line(aes(t, Sq(t)+Sq(4*t)+St(2*t)), size=1.5, col='red') +
  geom_line(aes(t, t1*(2+Sq(t))+t2*Tr(t)), size=1.5, col='red') +
  scale_x_continuous(breaks=seq(-3*pi, 3*pi, pi),
                     labels=c(TeX('$-3\\pi$'),TeX('$-2\\pi$'),TeX('$-\\pi$'),0,TeX('$\\pi$'),TeX('$2\\pi$'),TeX('$3\\pi$'))) +
  #scale_y_continuous(breaks=-2:2, labels=-2:2) + 
  scale_y_continuous(breaks=0:4, labels=0:4) + 
  ylab('f(t)') +
  ggtitle(TeX(paste('An even function with period $2\\pi$'))) +
  theme(plot.title = element_text(hjust = 0.5)) #+
#theme_bw()

sympy("integrate((t*cos(n*t)/pi),(t,0,pi))")
sympy("integrate((1*cos(n*t)/pi),(t,pi,2*pi))")
sympy("integrate((t*sin(n*t)/pi),(t,0,pi))")
sympy("integrate((1*sin(n*t)/pi),(t,pi,2*pi))")

saveGIF({
  n <- seq(1,30,1) #seq(1,1000,1) #
  f <- 1/2 + pi/4
  t <- seq(-3*pi, 3*pi, 0.01)
  df1 <- data.frame(t=t, f=t1*(2+Sq(t))+t2*Tr(t), func='F')
  df <- rbind(df1, data.frame(t=t, f=rep(1/2 + pi/4,length(t)), func='f'))
  print(ggplot(df, aes(t, f, col=func)) + 
          geom_line() +
          scale_x_continuous(breaks=seq(-3*pi, 3*pi, pi),
                             labels=c(TeX('$-3\\pi$'),TeX('$-2\\pi$'),TeX('$-\\pi$'),0,TeX('$\\pi$'),TeX('$2\\pi$'),TeX('$3\\pi$'))) +
          scale_y_continuous(breaks=0:4, labels=0:4) + 
          theme_bw() + 
          ylab('f(t)') +
          ggtitle(TeX(paste('Fourier series: $\\frac{1}{2}+ \\frac{\\pi}{4} +\\frac{1}{\\pi}.\\sum_{n=1}^{\\infty} \\left(\\frac{(-1)^n-1}{n^2} \\right).cos(nt) + \\frac{(-1)^n(1-\\pi)-1}{n}.sin(nt) \\right)$,', 
                            '1st 1 term of the Fourier series'))))
  for (i in n) {
    print(i)
    f <- f + ((-1)^i-1)*cos(i*t)/i^2/pi + ((-1)^i-1-(-1)^i*pi)*sin(i*t)/i/pi  
    #if (i %% 50 == 0) {
      df <- rbind(df1, data.frame(t=t, f=f, func='f'))
      print(ggplot(df, aes(t, f, col=func)) + 
              geom_line() +
              scale_x_continuous(breaks=seq(-3*pi, 3*pi, pi),
                                 labels=c(TeX('$-3\\pi$'),TeX('$-2\\pi$'),TeX('$-\\pi$'),0,TeX('$\\pi$'),TeX('$2\\pi$'),TeX('$3\\pi$'))) +
              scale_y_continuous(breaks=0:4, labels=0:4) + 
              theme_bw() + 
              ylab('f(t)') +
              ggtitle(TeX(paste('Fourier series: $\\frac{1}{2}+ \\frac{\\pi}{4} +\\frac{1}{\\pi}.\\sum_{n=1}^{\\infty} \\left(\\frac{(-1)^n-1}{n^2} \\right).cos(nt) + \\frac{(-1)^n(1-\\pi)-1}{n}.sin(nt) \\right)$,', 
                                '1st ', i+1, 'terms'))))
    #}
  }
},'Ev.gif')

t <- seq(-3*pi, 3*pi, 0.01)
ggplot() + 
  geom_line(aes(t, Pr(t)), size=1.5, col='red') +
  scale_x_continuous(breaks=seq(-3*pi, 3*pi, pi),
                     labels=c(TeX('$-3\\pi$'),TeX('$-2\\pi$'),TeX('$-\\pi$'),0,TeX('$\\pi$'),TeX('$2\\pi$'),TeX('$3\\pi$'))) +
  scale_y_continuous(breaks=c(-pi,0,pi), labels=c(TeX('-$\\pi$'), '0', TeX('$\\pi$'))) + 
  ylab('f(t)') +
  ggtitle(TeX(paste('Sawtooth wave of period $2\\pi$'))) +
  theme(plot.title = element_text(hjust = 0.5)) #+
  #theme_bw()


Pr <- function(t) {
  i <- as.integer(abs(t-ifelse(t>0,-1,1)) / 2)
  ifelse(t > 0, (t-2*i)^2, 
                (t+2*i)^2)
}

t <- seq(-5, 5, 0.01)
ggplot() + 
  geom_line(aes(t, Pr(t)), size=1.5, col='red') +
  scale_x_continuous(breaks=-5:5,
                     labels=-5:5) +
  ylab('f(t)') +
  ggtitle(TeX(paste('Even periodic extension of the function $f(t) = t^2$, $-1\\leq t \\leq 1$'))) +
  theme(plot.title = element_text(hjust = 0.5)) #+
#theme_bw()

saveGIF({
  n <- seq(1,20,1)
  f <- 1/3
  t <- seq(-3, 3, 0.01)
  df1 <- data.frame(t=t, f=Pr(t), func='F')
  df <- rbind(df1, data.frame(t=t, f=rep(1/3,length(t)), func='f'))
  print(ggplot(df, aes(t, f, col=func)) + 
          geom_line() +
          scale_x_continuous(breaks=-3:3,
                             labels=-3:3) +
          theme_bw() + 
          ylab('f(t)') +
          ggtitle(TeX(paste('Even periodic extension of $f(t) = t^2$, $|t| \\leq 1$, $f(t)=\\frac{1}{3}+\\frac{4}{\\pi^2}.\\sum_{n=1}^{\\infty} \\frac{cos(n\\pi t)}{n^2}$,', 
                            '1st 1 term of the Fourier series'))))
  for (i in n) {
    print(i)
    f <- f + 4*(-1)^i*cos(pi*i*t)/i^2/pi^2
    df <- rbind(df1, data.frame(t=t, f=f, func='f'))
    print(ggplot(df, aes(t, f, col=func)) + 
            geom_line() +
            scale_x_continuous(breaks=-3:3,
                               labels=-3:3) +
            theme_bw() + 
            ylab('f(t)') +
            ggtitle(TeX(paste('Even periodic extension of $f(t) = t^2$, $|t| \\leq 1$, $f(t)=\\frac{1}{3}+\\frac{4}{\\pi^2}.\\sum_{n=1}^{\\infty} \\frac{cos(n\\pi t)}{n^2}$,', 
                              '1st ', i+1, 'terms'))))
  }
},'Pr.gif')


n <- seq(1,50,2)
f <- 0
t <- seq(-3*pi, 3*pi, 0.01)
df1 <- data.frame(t=t, f=Sq(t), func='F')
saveGIF({
  for (i in n) {
    print(i)
    f <- f + 4/pi*sin(i*t)/i
    df <- rbind(df1, data.frame(t=t, f=f, func='Sq'))
    print(ggplot(df, aes(t, f, col=func)) + 
            geom_line() +
            scale_x_continuous(breaks=seq(-3*pi, 3*pi, pi),
                               labels=c(TeX('$-3\\pi$'),TeX('$-2\\pi$'),TeX('$-\\pi$'),0,TeX('$\\pi$'),TeX('$2\\pi$'),TeX('$3\\pi$'))) +
            scale_y_continuous(breaks=c(-1,0,1), labels=c('-1', '0', '1')) + 
            theme_bw() + 
            ylab('f(t)') +
            ggtitle(TeX(paste('Square wave, $f(t)=\\frac{4}{\\pi}.\\sum_{n\\; odd} \\frac{sin(nt)}{n}$,', 
                              'first ', i, 'term(s) of the Fourier series'))))
  }
},'Sq.gif')

library(latex2exp)

n <- seq(1,20,1)
f <- 0
t <- seq(-3*pi, 3*pi, 0.01)
df1 <- data.frame(t=t, f=St(t), func='St')
saveGIF({
  for (i in n) {
    print(i)
    f <- f + 2*(-1)^(i+1)*sin(i*t)/i
    df <- rbind(df1, data.frame(t=t, f=f, func='F'))
    print(ggplot(df, aes(t, f, col=func)) + 
            geom_line() +
            scale_x_continuous(breaks=seq(-3*pi, 3*pi, pi),
                               labels=c(TeX('$-3\\pi$'),TeX('$-2\\pi$'),TeX('$-\\pi$'),0,TeX('$\\pi$'),TeX('$2\\pi$'),TeX('$3\\pi$'))) +
            scale_y_continuous(breaks=c(-pi,0,pi), labels=c(TeX('$-\\pi$'), '0', TeX('$\\pi$'))) + 
            theme_bw() + 
            ylab('f(t)') +
            ggtitle(TeX(paste('Sawtooth wave, $f(t)=2.\\sum_{n=1}^{\\infty} (-1)^{n+1} \\frac{sin(nt)}{n}$,', 
                              'first ', i, 'term(s) of the Fourier series'))))
  }
}, 'St.gif')

n <- c(0, seq(1,20,2))
f <- 0
t <- seq(-3*pi, 3*pi, 0.01)
df1 <- data.frame(t=t, f=Tr(t), func='Tr')
saveGIF({
  for (i in n) {
    print(i)
    if (i==0) {
      f <- rep(pi/2,length(t))
    } else {
      f <- f - 4/pi*cos(i*t)/i^2
    }
    df <- rbind(df1, data.frame(t=t, f=f, func='F'))
    print(ggplot(df, aes(t, f, col=func)) + 
            geom_line() +
            scale_x_continuous(breaks=seq(-3*pi, 3*pi, pi),
                               labels=c(TeX('$-3\\pi$'),TeX('$-2\\pi$'),TeX('$-\\pi$'),0,TeX('$\\pi$'),TeX('$2\\pi$'),TeX('$3\\pi$'))) +
            scale_y_continuous(breaks=c(-1,0,1), labels=c('-1', '0', '1')) + 
            theme_bw() + 
            ylab('f(t)') +
            ggtitle(TeX(paste('Triangle wave, $f(t)=\\pi/2 - \\frac{4}{\\pi}.\\sum_{n \\; odd} \\frac{cos(nt)}{n^2}$,', 
                              'first ', i+1, 'term(s) of the Fourier series'))))
  }
}, 'Tr.gif')


n <- seq(1,15,2)
f <- (1/sqrt((49-n^2)^2 + (0.1*n)^2)/n)
ggplot() + geom_point(aes(n, f))  +
  geom_line(aes(n, f)) + ylab('c_n') +
  scale_x_continuous(breaks=seq(1,15,2),
                     labels=as.character(seq(1,15,2)))

n <- 10


### beam bending fourth order diff equation

# tridaiagonal matrix
library(Matrix)
A <- bandSparse(n, n, #dimensions
                (-2):2, #band, diagonal is number 0
                list(rep(1, n-2),
                     rep(-4, n-1), 
                     rep(6, n), 
                     rep(-4, n-1),
                     rep(1, n-2)))
A <- as.matrix(A)
A[1,1] <- A[2,1:2] <- A[10,10] <- 1
A[1,2:3] <- A[2,3:4] <- 0
A[9,10] <- -1
A[9,9] <- 3
A[9,8] <- -3
A[10,9] <- -2
A

library(Rlinsolve)

saveGIF({
  #Create a vector b that is zero for boundary conditions and -0.0000001 in every other entry.
  b = rep(1,10)*(-1e-7)
  # Create a vector v that solves Av = b.
  #v = solve(A, b)
  for (i in 12:25) {
    out <- lsolve.bicgstab(A,b,maxiter=i)
    v = out$x
    #Create a column vector x of 10 evenly spaced points between 0 and 1 (for plotting)
    x = seq(0,1,1/9)
    #Plot v on the vertical axis, and x on the horizontal axis.
    print(ggplot() + geom_line(aes(x,v), col='blue', size=2) + geom_point(aes(x, v), size=2) + 
      ggtitle(paste('Solving with Conjugate Gradient, iteration =', i)) + theme_bw())
  }
})


df <- NULL
saveGIF({
  x <- seq(0,1,0.01)
  for (q in 1:10) {
    v <- -q/24*x^ + q/6*x^3 - q/4*x^2
    df <- rbind(df, data.frame(x=x, v=v, q=q))
    df$q <- as.character(df$q)
    print(ggplot(df, aes(x,v, col=q)) + geom_line(size=2) + geom_point(size=2) + 
            ggtitle(paste('Solving beam bending equation theoretically, q =', q)) + theme_bw())
  }
}, 'beam.gif')


