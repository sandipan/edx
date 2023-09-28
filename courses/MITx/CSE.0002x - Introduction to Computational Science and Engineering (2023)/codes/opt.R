x <- seq(-2,1,.01)
f <- function(x) {
  return (x^4 + x^3 - 2*x^2)
}
plot(x, f(x), type='l')
f(-1.5)

z <- outer(-9:25, -9:25)
contour(z, col = 1:4)

z <- outer(-10:10, -10:10, function(x, y) y - 2*x + 15)
(levs <- pretty(z, n=10)) # -300 -200 ... 600 700
contour(z, levels=levs[-c(1,length(levs))], col = 1:5, lwd = 1:3 *1.5, lty = 1:3)

x <- 0.123 #9.45
y <- 0.789 #2.88
y - 2*x + 15

J <- function(x, y) {
  return (sin(pi*x) + cos(pi*y))
}

dJ <- function(x, y) {
  return (c(pi*cos(pi*x), -pi*sin(pi*y)))
}

GD <- function(xy, alpha, niter=100) {
  for (i in 1:niter) {
    xy <- xy - alpha*dJ(xy[1],xy[2])
  }
  xy
}

xy <- c(1.0, 0.5)
J(xy[1], xy[2])
alpha <- 1 / (2*pi)
xy <- xy - alpha*dJ(xy[1],xy[2])
xy
J(xy[1], xy[2])

library(plot3D)
x <- seq(1,10, .01)
y <- seq(1,10, .01)
M <- mesh(x, y)
X <- M$x
Y <- M$y
Z <- sqrt(K+X)+sqrt(K+Y)
surf3D(X,Y,Z)
Z <- X+Y-C
surf3D(X,Y,Z, add=TRUE)

K <- 1
C <- 1
plot(sqrt(K+x)+sqrt(K+y), type='l')
lines(x+y-C, col='red')


J <- function(x, y) {
  return (sqrt(K1+x) + sqrt(K2+y))
}

dJ <- function(x, y) {
  return (c(1/(2*sqrt(K1+x)), 1/(2*sqrt(K2+y))))
}

plot.contour <- function(xy, iter, alpha) {
  x <- seq(0,20,0.1)
  y <- seq(0,20,0.1)
  contour(x, y, outer(x, y, J), col=heat.colors(20), 
          main=paste('gradient ascent steps, x:', round(xy[1],2), ' y:', round(xy[2],2), 
                     ' iter:', iter, 'alpha:', round(alpha, 3)), xlab='s1', ylab='s2')
  points(xy[1], xy[2], pch=19, col='red')
}

GD <- function(xy, alpha, niter=100) {
  xy0 <- xy
  for (i in 1:niter) {
    xy <- xy + alpha*dJ(xy[1],xy[2])
    if (xy[1]+xy[2] <= C) {
      print(xy)
      plot.contour(xy, i, alpha)
      abline(C,-1, col='red', lwd=2)
      #xy <- xy0
      alpha <- 0.96*alpha
    } else {
      break
    }
  }
  xy
}

K1 <- 1
K2 <- 2
xy <- c(5,5)
C <- 20

library(animation)
alpha <- 2
saveGIF({
  GD(xy, alpha)
})

solve(matrix(c(0,1,0,1,0,0,0,0,1), nrow=3, byrow=T)) %*%
  matrix(c(1,1,-2,0,1,0,0,0,1), nrow=3) %*% 
  matrix(c(0,1,0,1,-1,2,0,0,1), nrow=3) %*% 
  matrix(c(0,1,0,1,0,0,0,0,1), nrow=3, byrow=T) %*%
  solve(diag(c(1/2,1,-1/3)))

solve(matrix(c(0,1,0,0,0,0,0,1,1,0,0,0,0,0,1,0), nrow=4))

library(plotly)
library(colorBlindness)

experimentaldata<-data.frame(hours=c(1,2,3,4,5,6,7,8,9),
                             concentration=c(0.25, 0.3, 0.8, 0.75, 0.3, 0.1, 0.9, 0.98, 1),
                             name=c("Chloride", "Chloride", "Chloride", "Sulfate", "Sulfate", "Sulfate", "Bicarbonate", "Bicarbonate", "Bicarbonate"))

theoreticaldata<-data.frame(hours=c(1, 3, 5, 7, 9),
                            concentration=c(0.45, 0.38, 0.27, 0.8, 0.66),
                            name=c("Chloride_exp", "Chloride_exp", "Chloride_exp", "Sulfate_exp", "Sulfate_exp")
)

allchemicals<-rbind(experimentaldata, theoreticaldata)


fig<-plot_ly(allchemicals, x=~hours, y=~concentration,type='scatter', 
             #mode="lines", 
             mode=c(rep("markers", length(experimentaldata)), rep("lines", length(theoreticaldata))),
             color=~name, colors=SteppedSequential5Steps)

fig <- plot_ly(experimentaldata, x=~hours, y=~concentration,type='scatter', 
                mode="lines", 
                color=~name, colors=SteppedSequential5Steps)

fig %>% add_trace(data=theoreticaldata, y=~concentration,
              x=~hours,
              mode='markers')

#fig <- fig + plot_ly(theoreticaldata, x=~hours, y=~concentration,type='scatter', 
#                     mode="markers", 
#                     color=~name, colors=SteppedSequential5Steps)

gsub(",.*$", "", "Fake City, TX Court House")
gsub(".*,.*\\s", "", "Fake City, TX Court House")

library(tidyverse)
library(tidyquant)
daily.close.data <- structure(list(symbol = c(127654L, 127654L, 127654L, 127654L, 
                          127654L, 127654L, 127654L, 127654L, 127654L, 127654L, 127654L, 
                          127654L, 127654L, 127654L, 127654L, 127654L, 127654L), date = structure(c(18753, 
                                                                                                    18754, 18757, 18758, 18759, 18760, 18761, 18764, 18766, 18767, 
                                                                                                    18768, 18771, 18772, 18773, 18774, 18775, 18778), class = "Date"), 
               UpdateTime = new("Period", .Data = c(44, 40, 13, 5, 10, 41, 
                                                    43, 8, 7, 35, 13, 34, 8, 2, 38, 20, 2), year = c(0, 0, 0, 
                                                                                                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), month = c(0, 0, 
                                                                                                                                                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), day = c(0, 
                                                                                                                                                                                                                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), hour = c(15, 
                                                                                                                                                                                                                                                                          15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 
                                                                                                                                                                                                                                                                          15), minute = c(40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 
                                                                                                                                                                                                                                                                                          40, 40, 40, 40, 40, 40)), PreCloPrice = c(78.3, 78.3, 78.49, 
                                                                                                                                                                                                                                                                                                                                    78.49, 78.49, 78.49, 78.49, 78.49, 78.49, 78.49, 78.49, 78.49, 
                                                                                                                                                                                                                                                                                                                                    78.49, 78.49, 78.49, 78.49, 78.49), OpenPrice = c(0, 78.49, 
                                                                                                                                                                                                                                                                                                                                                                                      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 78.49, 0, 78.49), HighPrice = c(0, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                          78.49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 78.49, 0, 78.49
                                                                                                                                                                                                                                                                                                                                                                                      ), LowPrice = c(0, 78.49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
                                                                                                                                                                                                                                                                                                                                                                                                      0, 78.49, 0, 78.49), LastPrice = c(0, 78.49, 0, 0, 0, 0, 
                                                                                                                                                                                                                                                                                                                                                                                                                                         0, 0, 0, 0, 0, 0, 0, 0, 78.49, 0, 78.49), close = c(78.3, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             78.49, 78.49, 78.49, 78.49, 78.49, 78.49, 78.49, 78.49, 78.49, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             78.49, 78.49, 78.49, 78.49, 78.49, 78.49, 78.49), volume = c(0L, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          49L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 143L, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          0L, 96L)), class = c("grouped_df", "tbl_df", "tbl", "data.frame"), row.names = 
            c(NA, -17L), groups = structure(list(date = structure(c(18753, 
                                                                    18754, 18757, 18758, 18759, 18760, 18761, 18764, 18766, 18767, 
                                                                    18768, 18771, 18772, 18773, 18774, 18775, 18778), class = "Date"), 
                                                 .rows = structure(list(1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 
                                                                        10L, 11L, 12L, 13L, 14L, 15L, 16L, 17L), ptype = integer(0), class = 
                                                                     c("vctrs_list_of", 
                                                                       "vctrs_vctr", "list"))), row.names = c(NA, -17L), .drop = TRUE, class = 
                                              c("tbl_df", 
                                                "tbl", "data.frame")))

daily.close.data %>%
  ggplot(aes(x = date, y = close)) +
  geom_candlestick(aes(open = OpenPrice, high = HighPrice, low = LowPrice, close = 
                         LastPrice)) +
  labs(title = paste0(str_remove_all("test.csv", ".csv")," Candlestick Chart"), 
       subtitle = "From sample market",
       y = "Closing Price", x = "") +
  theme_tq()

nrows <- nrow(daily.close.data)
pcols <- c('OpenPrice', 'HighPrice', 'LowPrice', 'LastPrice')
#daily.close.data[,pcols] <- data.frame(lapply(daily.close.data[,pcols], jitter))
daily.close.data[,pcols] <- daily.close.data[,pcols] + matrix(rnorm(nrows*length(pcols)), nrow=nrows)

# Use FANG data set
data("FANG") 

# Get AAPL and AMZN Stock Prices
AAPL <- tq_get("AAPL", get = "stock.prices", from = "2022-09-01", to = "2022-12-31")

AAPL %>%
  ggplot(aes(x = date, y = close)) +
  geom_candlestick(aes(open = open, high = high, low = low, close = close)) +
  labs(title = "AAPL Candlestick Chart", 
       subtitle = "Zoomed in using coord_x_date",
       y = "Closing Price", x = "") + 
  coord_x_date(xlim = c(end - weeks(6), end),
               c(aapl_range_60_tbl$min_low, aapl_range_60_tbl$max_high)) + 
  theme_tq()

df<-structure(list(x1_binary = c(0, 1, 1, 0, 1, 0, 1, 0, 1, 0), x2_binary = c(1, 
                                                                              0, 1, 0, 1, 1, 0, 0, 1, 1), y = c(2, 4, 5, 3, 6, 3, 7, 4, 8, 
                                                                                                                5)), class = "data.frame", row.names = c(NA, -10L))

# Create a scatterplot
ggplot(df, aes(x = factor(x1_binary), y = y, color = factor(x2_binary))) +
  geom_point() +
  scale_color_manual(values = c("red", "blue")) +
  labs(
    x = "x1_binary",
    y = "y",
    title = "Scatterplot of y vs. x1_binary colored by x2_binary"
  )

### LU
A <- matrix(c(1,2,-2,-1,0,0,2,2,-4), nrow=3)
M1 <- matrix(c(1,0,0,-2,1,0,0,0,1), nrow=3, byrow=T) 
M1 %*%  A
M2 <- matrix(c(1,0,0,0,1,0,2,0,1), nrow=3, byrow=T) 
M2 %*% M1 %*%  A
M3 <- matrix(c(1,0,0,0,1,0,0,1,1), nrow=3, byrow=T) 
U <- M3 %*% M2 %*% M1 %*%  A
L <- solve(M3 %*% M2 %*% M1)
L %*% U # Ax = b    LUx = b
b <- c(7, 4, -10)
y <- solve(L, b)
x <- solve(U, y)
solve(A, b)
  
matrix(c(1,2,0,0,1,1,0,0,1), nrow=3) %*% matrix(c(1,0,0,-1,-2,0,2,6,-2), nrow=3)


A <- matrix(c(4, 3, -2, 5, 2, -4, 6, 1, -1, 2, -5, 6, 3, 5, -2, -3), nrow = 4)
B <- matrix(c(16.9, -14, 25, 9.4), nrow = 4)

# Gaussian elimination
E21 <- matrix(c(1,0,0,0,-3/4,1,0,0,0,0,1,0,0,0,0,1), nrow=4, byrow=T)
E31 <- matrix(c(1,0,0,0,0,1,0,0,1/2,0,1,0,0,0,0,1), nrow=4, byrow=T)
E41 <- matrix(c(1,0,0,0,0,1,0,0,0,0,1,0,-5/4,0,0,1), nrow=4, byrow=T)
E32 <- matrix(c(1,0,0,0,0,1,0,0,0,14/11,1,0,0,0,0,1), nrow=4, byrow=T)
E42 <- matrix(c(1,0,0,0,0,1,0,0,0,0,1,0,0,-3/11,0,1), nrow=4, byrow=T)
E43 <- matrix(c(1,0,0,0,0,1,0,0,0,0,1,0,0,0,13/4,1), nrow=4, byrow=T)

U <- E43 %*% E42 %*% E32 %*% E41 %*% E31 %*% E21 %*% A
L <- solve(E43 %*% E42 %*% E32 %*% E41 %*% E31 %*% E21)

all.equal(L %*% U, A)

all.equal(solve(U, solve(L, B)), solve(A, B))

library(gtsummary)
a <- structure(list(SampleDate = structure(c(15710, 15713, 15713, 
                                             15710, 15710, 15713, 15713, 15710, 15708, 15713, 15712, 15708, 
                                             15708, 15713, 15712, 15708), class = "Date"), year = c("2012", 
                                                                                                    "2013", "2013", "2012", "2013", "2013", "2013", "2013", "2013", 
                                                                                                    "2012", "2013", "2013", "2013", "2013", "2013", "2013"), F = c(0, 
                                                                                                                                                                   1, 0, 0, 0, 1, 0, 0, 0, 22, 0, 0, 0, 65, 0, 0), W = c(0, 0, 1, 
                                                                                                                                                                                                                         0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0), S = c(0, 0, 0, 0, 1, 
                                                                                                                                                                                                                                                                       0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0), LF = c(1, 0, 0, 1, 0, 0, 0, 
                                                                                                                                                                                                                                                                                                                1, 0, 0, 0, 0, 1, 0, 0, 1)), class = "data.frame", row.names = c(NA, 
                                                                                                                                                                                                                                                                                                                                                                                 -16L))



b <- a %>%
  mutate(F1=F+0.001*rnorm(nrow(a))) %>%
  select(F1,W,S,LF) %>%
  tbl_summary(
    missing =  "no",
    statistic = all_continuous() ~ "{mean} ({sd})") %>% # add_ci()
  add_ci(pattern = "{stat} ({ci})") %>%
  modify_footnote(everything() ~ NA)

rbind(a, c(NA, NA,b$table_body$ci_stat_0))

library(ggplot2)
library(ggdendro)

# randomly generated phenograph data
set.seed(1)
TotalPercentage <- data.frame(
  `Participant ID` = c("123", "456", "789"),
  `1` = 125*runif(72),
  `2` = 75*runif(72),
  `3` = 175*runif(72),
  `4` = 10*runif(72),
  `5` = 100*runif(72),
  `6` = 150*runif(72),
  `7` = 200*runif(72)
)

#generate tree
tree <- hclust(dist(TotalPercentage))
tree <- dendro_data(tree)
data <- cbind(TotalPercentage, x = match(rownames(TotalPercentage), tree$labels$label))
data[,2:8] <- data[,2:8] / rowSums(data[,2:8])
scale <- 3e-4 #.05
ggplot() +
  geom_col(
    data = tidyr::pivot_longer(data, c(2, 3 , 4, 5, 6, 7, 8)),
    aes(x = x,
        y = value, fill = factor(name)),
  ) +
  labs(title="Unsupervised Clustering of Phenograph Output",
       x ="Cluster Representation (%)", y = "Participant Sample"
  ) +
  geom_segment(
    data = tree$segments,
    aes(x = x, y = -y * scale, xend = xend, yend = -yend * scale)
  ) +
  coord_flip()

plot.grad.rects <- function(p, alphas, xcur, inc) {
  for (alpha in alphas) {
    p <- p +
      geom_rect(aes(xmin = xcur, xmax = xcur + inc), 
                ymin = -Inf, ymax = Inf, fill = "yellow", 
                alpha = alpha)
    xcur <- xcur + inc 
    print(xcur)
  }
  p  
}

xmin <- 95
xmax <- 105
xmid <- (xmin + xmax) / 2

n <- 25
alphas <- seq(0,1,1/n)
inc <- (xmid - xmin) / n

p <- ggplot()
p <- plot.grad.rects(p, alphas, xmin, inc)

p <- p + xlim(90, 110) + theme_bw()


xmin <- 95
xmax <- 105
xmid <- (xmin + xmax) / 2

n <- 20
alphas <- seq(0,1,1/n)
inc <- (xmid - xmin) / n

xcur <- xmin
df <- NULL
for (alpha in alphas) {
  df <- rbind(df, data.frame(xmin=xcur, xmax=xcur+inc, alpha=alpha))
  xcur <- xcur + inc
}
for (alpha in rev(alphas)) {
  df <- rbind(df, data.frame(xmin=xcur, xmax=xcur+inc, alpha=alpha))
  xcur <- xcur + inc
}

ggplot(df) + geom_rect(aes(xmin = xmin, xmax = xmax, alpha = alpha), 
                     ymin = -Inf, ymax = Inf, fill = "red", 
                     ) + xlim(90, 110) + theme_bw()


library(mongolite)

mongo_host="localhost"
mongo_port=27017
url_path = sprintf("mongodb://%s:%s", mongo_host, mongo_port)  
mongo_database="test"

mongo_collection <- "models"  
mongo_con<-mongo(collection = mongo_collection
                 ,url = paste0(url_path,"/",mongo_database))

mySerializationFunc<-function(value){
  return (base64enc::base64encode(serialize(value, NULL,refhook = function(x) "dummy value")))
}

myUnserializationFunc<-function(value){
  return (unserialize(value,refhook = function(chr) list(dummy = 0L)))
}


insertDocumentIntoCollection <- function(connection,object) {
  str<-paste0('{"modelName": "',object$modelName,'", "objectModel" :',paste0('{"$binary":{"base64":"',mySerializationFunc(object$objectModel),'","subType": "0"}}}'))
  connection$insert(str)
}

getDocumentFromCollection<-function(connection,modelName){
  
  strConditions=paste0('{"modelName":"',modelName,'"}')
  strSelect=paste0('{"objectModel":true,"_id":false}')
  return(connection$find(query=strConditions,fields=strSelect))
}

modelName<-"irisTestAll"

# Retrieve the model
mdl<-getDocumentFromCollection(mongo_con,modelName)

# By using "mdl[[1]][[1]]" we get allways the first model
mdl<-myUnserializationFunc(mdl[[1]][[1]])
attr(mdl$terms, ".Environment")
predict(mdl, newdata=iris)

attr(mdl$terms, ".Environment") <- .GlobalEnv

predict(mdl, newdata=iris)



library(ggplot2)
library(tibble)

my_df <- tribble(~step, ~prop,
                 "a", 1,
                 "b", 0.8,
                 "c", 0.55,
                 "d", 0.2
)
my_df$type <- 'filled'
my_df2 <- my_df
my_df2$prop <- 1 - my_df2$prop
my_df2$type <- 'empty'
my_df <- rbind(my_df, my_df2)
my_df |> ggplot(aes(x = step,
                 y = prop)) + geom_col(aes(alpha=type, col=type, linetype=type)) +
         scale_linetype_manual(values=c('dashed','solid')) +
         scale_color_manual(values=c('red', 'gray')) +
         scale_alpha_manual(values=c(0, 1)) + theme(legend.position = "none") 
  
  

my_df |> 
  ggplot(aes(x = step,
             y = prop)) +
  geom_col(aes(y=1), color='red', alpha=0, lty=2) +
  geom_col()
  

library(mvtnorm)
set.seed(123)
n = 1000
sigmau <- 1; sigmav <- 1; rho <- 0.5
Sigma <- matrix(c(sigmau^2,rho*sigmau*sigmav,rho*sigmau*sigmav,sigmav^2),2,2)

x1 <- rnorm(n,0,1); x2 <- rnorm(n,0,1); z <- rnorm(n,0,1)
u = rmvnorm(n,c(0,0),Sigma)[,1]; v = rmvnorm(n,c(0,0),Sigma)[,2]

selection_latent <- 1 + x1 + z + v
selection <- as.numeric(selection_latent >= 0)
y <- ifelse(selection == 1, 1 + x1 + x2 + u, 0)

# Create the data frame 'df'
df_sel <- data.frame(id = 1:n,x1,x2,z,u = u,v,selection_latent,selection,y)

## Estimation
library(sampleSelection)
library(texreg)
sample_selection1 <- selection(selection = selection ~ 1 + x1 + z,outcome = y ~ 1 + x1 + x2, data = df_sel)
screenreg(sample_selection1)




## Sample Selection ##
Selection_Reg <- function(y_in, x_in, z_in, selection,df) {
  x <- cbind(1,as.matrix(x_in))
  z <- cbind(1,as.matrix(z_in))
  lm1 <- lm(y~1+x1 +x2,data = df)
  lm2 <- lm(y~1+x1 + z,data = df)
  parameters <- c(1,0.5,as.numeric(lm1$coef),as.numeric(lm2$coef))
  
  f_selection <- function(parameters,selection, y_in, x_in,z_in) {
    sigma_u <- parameters[1]
    rho <- parameters[2]
    sigma_v <- 1
    beta <- parameters[3:(ncol(x)+2)]
    theta <- parameters[(ncol(x)+3):(length(parameters))]
    xb <- x_in %*% beta
    zt <- z_in %*% theta
    z_adj <- (y_in-xb)/sigma_u
    inside <- (zt + (rho*sigma_u/sigma_v)*(y_in-xb))/(((1-rho^2)*sigma_u^2)^(1/2))
    
    log_lik <- (-log(sigma_u)+log(dnorm(z_adj))+log(pnorm(inside)))*selection +log(1 - pnorm(zt/sigma_v))*(1-selection)
    return(-sum(log_lik))
  }
  
  result <- optim(par = parameters, fn = f_selection,selection = selection, y_in = y_in, x_in = x,z_in = z)
  return(result)
}
Selection_Reg(y_in = df_sel$y,x_in = df_sel[,c("x1","x2")], z_in = df_sel[,c("x1","z")],selection = df_sel$selection,df = df_sel)

A <- matrix(c(.4,.4,.2,.3,.3,.4,.1,.6,.3), nrow=3)
A %*% A

A <- matrix(c(rep(1,4), 1:4, (1:4)^2, (1:4)^3), nrow=4)
b <- c(0, 6, 30, 84)
solve(A, b)


r_neighbors <- matrix(c(NA, 4.0, 4.0, 2.0, 1.0, 2.0, NA, NA,
                       3.0, NA, NA, NA, 5.0, 1.0, NA, NA,
                       4.0, NA, NA, 2.0, 1.0, 1.0, 2.0, 4.0), nrow=3, byrow=T)
u_a <- matrix(c(NA,NA,4.0,3.0,NA,1.0,NA,5.0), nrow=1)

s_uk <- matrix(rep(1, 3), ncol=1)
s_uk <- matrix(c(0.3, 1.0, 0.3), ncol=1)
r_a <- as(crossprod(replace(r_neighbors, is.na(r_neighbors), 0), s_uk), "matrix") /
          as(crossprod(!is.na(r_neighbors), s_uk), "matrix")
u_a[is.na(u_a)] <- r_a[is.na(u_a)]
u_a