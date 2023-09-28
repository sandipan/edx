library(igraph)
setwd("H:\\courses\\Edx\\Current\\MIT Computational\\codes")
nodes2 <- read.csv("sunbelt2023/Data files/Dataset2-Media-User-Example-NODES.csv",                  header=T, as.is=T)
links2 <- read.csv("sunbelt2023/Data files/Dataset2-Media-User-Example-EDGES.csv",   header=T, row.names=1)
head(links2)
links2 <- as.matrix(links2)
dim(links2)
dim(nodes2)
net2 <- graph_from_incidence_matrix(links2)
table(V(net2)$type)
plot(net2,vertex.label=NA)
net2
V(net2)$color <- c("steel blue", "orange")[V(net2)$type+1]
V(net2)$shape <- c("square", "circle")[V(net2)$type+1]
V(net2)$label <- ""
#V(net2)$label[V(net2)$type==F] <- nodes2$company[V(net2)$type==F]
V(net2)$label.cex=.6
V(net2)$label.font=2
plot(net2, vertex.label.color="white", vertex.size=(2-V(net2)$type)*8)
colrs <- c("gray50", "tomato", "gold", "black", "orange", "purple", "green","white")
V(net2)$color <- colrs[V(net2)$project.type]

f <- function(x) {
  x1 <- x[1]
  x2 <- x[2]
  #return (20 + x1**2 + x2**2 - 10*(cos(2*pi*x1)+cos(2*pi*x2)))
  return (x1^2 + x2^2) #(10*sin(x1^2+x2^2))
}

f1 <- function(x1, x2) {
  #return (20 + x1**2 + x2**2 - 10*(cos(2*pi*x1)+cos(2*pi*x2)))
  return (x1^2 + x2^2) #(10*sin(x1^2+x2^2))
}


grad_f <- function(x) {
  x1 <- x[1]
  x2 <- x[2]
  #return (c(2*x1 + 10*(2*pi*sin(2*pi*x1)), 2*x2 + 10*(2*pi*sin(2*pi*x2))))  
  return (c(2*x1, 2*x2)) #(c(20*x1*cos(x1^2+x2^2), 20*x2*cos(x1^2+x2^2)))
}

Hessian_f <- function(x) {
  x1 <- x[1]
  x2 <- x[2]
  return (c(2*x1 + 10*(2*pi*sin(2*pi*x1)), 2*x2 + 10*(2*pi*sin(2*pi*x2))))  
  #return (matrix(c(2, 0, 0, 2), nrow=2, byrow=T)) #(c(20*x1*cos(x1^2+x2^2), 20*x2*cos(x1^2+x2^2)))
}

grad_descent <- function(f, f1, grad_f, x, lr, pal_func, niter=100) {
  x1 <- seq(-3,3,0.15)
  y1 <- seq(-3,3,0.15)
  #x1 <- seq(-4,4,0.1)
  #y1 <- seq(-4,4,0.1)
  z1 <- outer(x1, y1, f1)
  plot.3d(x1, y1, z1, pal_func=pal_func, p=x, iter=0)
  for (i in 1:niter) {
    x <- x - lr*grad_f(x)
    print(x)
    plot.3d(x1, y1, z1, pal_func=pal_func, p=x, iter=i)
    #plot.3d1(f1, x, i)
  }
  return(x)
}

x <- rep(3, 2)
#x <- rep(1.5, 2)
#grad_descent(f, f1, grad_f, x, lr=0.001, niter=25)
library(animation)
#saveGIF(grad_descent(f, f1, grad_f, x, lr=0.001, pal_func=colorRampPalette(c("blue", "lightgreen")), niter=25))
saveGIF(grad_descent(f, f1, grad_f, x, lr=0.5, pal_func=jet.colors, niter=5))

Newton <- function(x, f1, grad_f, Hessian_f, niter=10) {
  x1 <- seq(-3,3,0.15)
  y1 <- seq(-3,3,0.15)
  z1 <- outer(x1, y1, f1)
  plot.3d(x1, y1, z1, pal_func=jet.colors, p=x, iter=0)
  for (k in 1:niter) {
    x <- x - solve(Hessian_f(x), grad_f(x))
    print(x)
    plot.3d(x1, y1, z1, pal_func=jet.colors, p=x, iter=k)
  }
  return (x)
}


x <- rep(3, 2)
library(animation)
saveGIF(Newton(x, f1, grad_f, Hessian_f, niter=5))


f1 <- function(x1, x2) {
  return (20 + x1**2 + x2**2 - 10*(cos(2*pi*x1)+cos(2*pi*x2)))
}

plot.3d1 <- function(f1, x, i) {
  x1 <- seq(-2,2,0.025)
  x2 <- seq(-2,2,0.025)
  z <- outer(x1, x2, f1)
  
  # Color palette (100 colors)
  col.pal<-colorRampPalette(c("skyblue", "lightgreen"))
  colors<-col.pal(100)
  # height of facets
  z.facet.center <- (z[-1, -1] + z[-1, -ncol(z)] + z[-nrow(z), -1] + z[-nrow(z), -ncol(z)])/4
  # Range of the facet center on a 100-scale (number of colors)
  z.facet.range<-cut(z.facet.center, 100)
  
  res <- persp(x1, x2, z, 
        theta = 30, phi = 30, expand = 0.1, scale=FALSE, col=colors,
        #shade=NA, col=colors, #col=colors[z.facet.range], #border="grey80",
        box=TRUE, main=paste('gradient descent iteration ', i)) #FALSE)
  
  points(trans3d(x[1], x[2], f1(x[1], x[2]), pmat=res), pch=19, col='red')
}

#plot.3d1(f1, c(0,0))

library(pacman)
p_load(tidyverse)
p_load(mvtnorm)
p_load(cowplot)
p_load(gridGraphics)
p_load(GA)

library(GA)

plot.3d <- function(x, y, z, pal_func, p=NULL, iter=1, nlevels=100) {
  # Color palette (100 colors)
  colors <- pal_func(nlevels)
  # height of facets
  z.facet.center <- (z[-1, -1] + z[-1, -ncol(z)] + z[-nrow(z), -1] + z[-nrow(z), -ncol(z)])/4
  # Range of the facet center on a 100-scale (number of colors)
  z.facet.range <- cut(z.facet.center, nlevels)
  par(mar = c(0.5, 0.5, 0.5, 0.5))
  res <- persp(x, y, z, 
        #theta = 45, 
        theta=30,
        phi = 45, #expand = 0.2, 
        #phi = 30,
        expand = 0.2,
        scale=FALSE,
        #shade=NA, 
        col=colors[z.facet.range], #border=NA, #"grey80",
        box=FALSE, main=paste('gradient descent iteration ', iter))
  points(trans3d(p[1], p[2], f(p), pmat=res), pch=19, col='red', cex=2)
  
  #nlevels<-50
  #my_zlim <- range(z, finite = TRUE)
  #my_levels <- pretty(my_zlim, nlevels)
  #cols <- jet.colors(length(my_levels) - 1)
  #zzz <- cut(z.facet.center, breaks = my_levels, labels = cols)
  
  #persp(x, y, z, theta = 30, phi = 45, expand = 0.5,xlab="x",ylab="y",zlab="f(x,y)",col = as.character(zzz), box=FALSE)
  
} 

x <- seq(-3,3,0.15)
y <- seq(-3,3,0.15)
#s <- 1
#z <- outer(x, y, function(x,y) 25/s^4/pi*(1-(x^2+y^2)/2/s^2)*exp(-(x^2+y^2)/2/s^2)) # -ve LOG
z <- outer(x, y, function(x,y) 10*sin(x^2 + y^2)) # -ve LOG
#plot.3d(x, y, z, pal_func=colorRampPalette(c("blue", "red")))
plot.3d(x, y, z, pal_func=jet.colors)

library(klaR)
library(ggplot2)

df <- rbind(data.frame(V1=rnorm(100,1), V2=rnorm(100,2), GT=rep('1',100)), 
            data.frame(V1=rnorm(100,8), V2=rnorm(100,10), GT=rep('2',100)),
            data.frame(V1=rnorm(100,15), V2=rnorm(100,20), GT=rep('3',100)))
ggplot(df, aes(V1, V2, color=GT)) + geom_point()
km <- kmodes(df[,1:2], 3, iter.max = 100, fast=FALSE, weighted = TRUE)


x1 = rep(1:3, times = 40)
x2 = rep(1:3, times = 40)
x3 = rep(1:3, times = 40)
x4 = rep(1:3, times = 40)
x5 = rep(1:3, times = 40)

dat <- data.frame(x1, x2, x3, x4, x5)

km <- kmodes(dat, 3)


set.seed(1)
x <- rbind(matrix(rbinom(100, 2, 0.25), ncol = 2),
           matrix(rbinom(100, 2, 0.75), ncol = 2))
colnames(x) <- c("a", "b")
head(x)
plot(jitter(x), pch=19, main='dataset')

num_clusters <- 2:9
SSW <- c()
for (k in num_clusters) {
  ## run algorithm on x:
  (cl <- kmodes(x, k))
  SSW <- c(SSW, sum(cl$withindiff))
  ## and visualize with some jitter:
  jpeg(paste0('cluster_', k, '.jpg'))
  plot(jitter(x), col = cl$cluster, pch=19, main=paste(k, 'clusters'))
  points(cl$modes, col = 1:k, pch = 8, cex=2)
  dev.off()
}

x[cl$cluster == 3,]

plot(num_clusters, SSW, pch=19, col='red', main='SSW vs. #clusters')
lines(num_clusters, SSW)

bisection <- function(a, b, f, fn, tol=1e-4, df=NULL) {
  stopifnot(sign(f(a))*sign(f(b)) == -1)
  m = (a + b) / 2
  # print(m)
  df = rbind(df, data.frame(a=a, b=b, m=m, f=f(m)))
  #print(df)
  print(ggplot(df, aes(m, f)) + geom_point(color='red', cex=3) + geom_line(data=fn, aes(x,f)) + xlab('x') + ylab('f(x)') + ggtitle('Root finding with bisection method'))
  if ((abs(f(m)) < tol) | (abs(m - a) < tol)) return (m)
  return (ifelse(sign(f(a)) == sign(f(m)), bisection(m, b, f, fn, df=df), bisection(a, m, f, fn, df=df)))
}

columns = c('a', 'b', 'm', 'f')
df = data.frame(matrix(nrow = 0, ncol = length(columns)))
colnames(df) = columns
f <- function(x) {
  (x-1/3)*(x+2/3)*(x-3)
}
xn = seq(1/3-0.1,6+0.1,0.1)
fn = data.frame(x=xn, f=f(xn))
library(animation)
saveGIF(
  bisection(1, 6,  f, fn, df=df)  
)


library(nnet)
library(neuralnet)
bank.nnet <- nnet(Bankrupt ~ .,data = test.set, size = 1, maxit = 500, type='class')
prob.nnet = predict(bank.nnet, test.set)
pred.nnet = as.numeric(prob.nnet > 0.06)

table(test.set$Bankrupt, pred.nnet, dnn = c("Observation", "Prediction"))
mean(ifelse(test.set$Bankrupt != pred.nnet, 1, 0))

n=6
bank.nnet.tune <- nnet(Bankrupt ~ ., 
                       size = n, data = train.set, maxit=1000, decay=0.006, linout = TRUE)   
prob.nnet.tune.train = predict(bank.nnet.tune, train.set)
pred.nnet.tune.train = as.numeric(prob.nnet.tune.train > 0.06)
#table(bank.test$DLRSN, pred.nnet.tune.train, dnn = c("Observation", "Prediction"))
table(train.set$Bankrupt, pred.nnet.tune.train, dnn = c("Observation", "Prediction"))
mean(ifelse(train.set$Bankrupt != pred.nnet.tune.train, 1, 0))

#outofsample
prob.nnet.tune = predict(bank.nnet.tune, train.set)
pred.nnet.tune = as.numeric(prob.nnet.tune > 0.06)
table(train.set$Bankrupt, pred.nnet.tune, dnn = c("Observation", "Prediction"))
mean(ifelse(train.set$Bankrupt != pred.nnet.tune, 1, 0))

library(verification)
data$Bankrupt=as.factor(data$Bankrupt)
#roc.plot(bank.test$DLRSN == "1", pred.nnet.tune)

nn <- neuralnet(Bankrupt ~ X1+X2+X3+X4+X5+X6+X7+X8+X9+X10,
                data=train.set,hidden=c(8,1),linear.output=T) 
plot(nn)

library(neuralnet)

# Binary classification
nn <- neuralnet(Species == "setosa" ~ Petal.Length + Petal.Width, iris, linear.output = FALSE)
## Not run: print(nn)
## Not run: plot(nn)

# Multiclass classification
nn <- neuralnet(Species ~ Petal.Length + Petal.Width, iris, linear.output = FALSE)
## Not run: print(nn)
plot(nn)


library(caret)
library(dplyr)
library(keras)
library(reticulate)
virtualenv_create("r-reticulate", python = install_python())
#virtualenv_remove()
set.seed(1234)
reticulate::install_miniconda()  
install_keras(envname = "r-reticulate")


#Single layer feedforward NN
NN_classic <- keras_model_sequential() %>%
  layer_dense(units = 10000 , activation = "relu" ,
              input_shape = ncol(x_train) ) %>%
  layer_dropout(rate = 0.1) %>%
  layer_dense(units = 2 , activation = "softmax")

NN_classic %>% compile(loss = "categorical_crossentropy",
                       optimizer = optimizer_rmsprop(), metrics = c("accuracy"))

#fitting the model
system.time(
  history <- NN_classic %>% fit(
    x_train,y_train , epochs = 50, batch_size=4096,
    validation_data = list(x_test,y_test)
  )
)

#prediction on test set
prob.NN<- predict(NN_classic,x_test, type = "prob")
pred.NN <- ifelse(prob.NN[,1] > 0.5 , 0, 1)
table(pred.NN, y_test[,2])  #confusion matrix
#error rate
1-mean(pred.NN==y_test[,2])  
#roc curve
test_roc = roc(test_data$NB_Claim~prob.NN[,1])
as.numeric(test_roc$auc)

library(keras)
model <- keras_model_sequential() %>%
  layer_batch_normalization(input_shape=input_shape) %>%
  layer_dense(units=128,activation='relu') %>%
  layer_batch_normalization() %>%
  layer_dense(units=64, activation='relu') %>%
  layer_batch_normalization() %>%
  layer_dense(units=32, activation='relu') %>%
  layer_batch_normalization() %>%
  layer_dense(units=16, activation='relu') %>%
  layer_batch_normalization() %>%
  layer_dense(units=8, activation='relu') %>%
  layer_batch_normalization() %>%
  layer_dense(units = 1, activation = 'sigmoid')

model %>% compile(
  loss = 'binary_crossentropy',
  optimizer ='adam',
  metrics = list('accuracy'))

callbacks <-  callback_early_stopping(monitor="val_loss", min_delta=min_delta,patience=patience,verbose=1)

history <- model %>% fit(
  train[,chind],train[,gtind],
  batch_size = batch_size,
  epochs = epochs,
  callbacks = callbacks,
  validation_data =list(val[,chind],val[,gtind]),verbose = 1)

score <- model %>% evaluate(test[,chind], test[,gtind],)




library(caret)
df1 <-
  data.frame(x1 = rnorm(200),
             x2 = rnorm(200),
             y = as.factor(sample(c("bob", "bill"), 200, replace = T)))

df2 <-
  data.frame(z1 = rnorm(400),
             z2 = rnorm(400),
             y = as.factor(sample(c("bob", "bill"), 400, replace = T)))

library(caret)
check_1 <- train( x = df1[,1:2],y = df1[,3],
                  method = "nnet",
                  tuneLength = 10,
                  trControl = trainControl(method = "cv",
                                           classProbs = TRUE,
                                           savePredictions = T))

check_2 <- train( x = df2[,1:2],y = df2[,3] ,
                  method = "nnet",
                  preProcess = c("center", "scale"),
                  tuneLength = 10,
                  trControl = trainControl(method = "cv",
                                           classProbs = TRUE,
                                           savePredictions = T))

df3 <- data.frame(
                  z1 = rnorm(500),
                  z2 = rnorm(500),
                  y = as.factor(sample(c("bob", "bill"), 500, replace = T)))

df3$p1 <- predict(check_1$finalModel, df3[,1:2])
df3$p2 <- predict(check_2$finalModel, df3[,1:2])


dat1 <- data.frame(x = "-/-", y = 2837.3333, Well = "0", errors = 334.02993877795)
dat2 <- data.frame(x = "+/+", y = 1911.33333, Well = "0", errors = 103.568010)
dat3 <- data.frame(x = "-/-", y = 137, Well = "8", errors = 158.745)
dat4 <- data.frame(x = "+/+", y = 259.6667, Well = "8", errors = 197.616630)
dat5 <- data.frame(x = "-/-", y = 95.666, Well = "16", errors = 93.0931)
dat6 <- data.frame(x = "+/+", y = 557.6667, Well = "16", errors = 133.82949)
dat7 <- data.frame(x = "-/-", y = 74.333, Well = "32", errors = 66.515)
dat8 <- data.frame(x = "+/+", y = 757.3333, Well = "32", errors = 43.98106)

ggplot(well_data4, aes(x = E2F4, y = Colonies, color = Clone, fill = E2F4)) +
  geom_point(aes(color = Clone), size = 2) +
  geom_point(data = dat1, aes(x=x, y=y), color = "black", inherit.aes = FALSE, size = 2)+
  geom_errorbar(data = dat1, mapping = aes(x = x, ymin = y - errors, ymax = y + errors), width  = 0.2, color = "black")+
  geom_point(data = dat2, aes(x=x, y=y), color = "black", inherit.aes = FALSE, size = 2)+
  geom_point(data = dat3, aes(x=x, y=y), color = "black", inherit.aes = FALSE, size = 2)+
  geom_point(data = dat4, aes(x=x, y=y), color = "black", inherit.aes = FALSE, size = 2)+
  geom_point(data = dat5, aes(x=x, y=y), color = "black", inherit.aes = FALSE, size = 2)+
  geom_point(data = dat6, aes(x=x, y=y), color = "black", inherit.aes = FALSE, size = 2)+
  geom_point(data = dat7, aes(x=x, y=y), color = "black", inherit.aes = FALSE, size = 2)+
  geom_point(data = dat8, aes(x=x, y=y), color = "black", inherit.aes = FALSE, size = 2)+
  

library(lpSolve)  
#
# Set up problem: maximize
# x1 + 9 x2 + x3 subject to
# x1 + 2 x2 + 3 x3 <= 9
# 3 x1 + 2 x2 + 2 x3 <= 15
#
f.obj <- c(1, 9, 1)
f.con <- matrix (c(1, 2, 3, 3, 2, 2), nrow=2, byrow=TRUE)
f.dir <- c("<=", "<=")
f.rhs <- c(9, 15)
#
# Now run.
#
lp ("max", f.obj, f.con, f.dir, f.rhs)
## Not run: Success: the objective function is 40.5
lp ("max", f.obj, f.con, f.dir, f.rhs)$solution
## Not run: [1] 0.0 4.5 0.0
#
# The same problem using the dense constraint approach:
#
f.con.d <- matrix (c(rep (1:2,each=3), rep (1:3, 2), t(f.con)), ncol=3)
lp ("max", f.obj, , f.dir, f.rhs, dense.const=f.con.d)




library(lpSolve)  
# Test Emission by MOT 1 Matrix
E1 <- matrix(c(0,1,1,1,0,1,1,1,0), nrow = 3)
print(E1)

# Test Emission by MOT 2 Matrix
E2 <- matrix(c(0,2,2,2,0,2,2,2,0), nrow = 3)
print(E2)

# Test Distance between three countries matrix
D <- matrix(c(0,1,2,1,0,1,2,1,0), nrow = 3)
print(D)


function(values) { #, A, B) {
  X <- matrix(values[1:9], nrow = 3, ncol = 3)
  Y <- matrix(values[10:18], nrow = 3, ncol = 3)
  return(sum(E1 * D * X + E2 * D * Y))
}

Trade_MOT1_Hypothetical <- matrix(c(0,4,6,4,0,5,2,1,0), nrow = 3)
Trade_MOT2_Hypothetical <- matrix(c(0,8,9,1,0,17,3,1,0), nrow = 3)
print(Trade_MOT1_Hypothetical)
print(Trade_MOT2_Hypothetical)

test_input <- c(Trade_MOT1_Hypothetical, Trade_MOT2_Hypothetical)
print(test_input)
print(objective.in(test_input))

# Summation matrix for the first column sum constraint
c1 <- matrix(c(1, 1, 1, 0, 0, 0, 0, 0, 0), nrow = 9)
# Summation matrix for the second column sum constraint
c2 <- matrix(c(0, 0, 0, 1, 1, 1, 0, 0, 0), nrow = 9)
# Summation matrix for the third column sum constraint
c3 <- matrix(c(0, 0, 0, 0, 0, 0, 1, 1, 1), nrow = 9)
# Summation matrix for the first row sum constraint
r1 <- matrix(c(1, 0, 0, 1, 0, 0, 1, 0, 0), nrow = 9)
# Summation matrix for the second row sum constraint
r2 <- matrix(c(0, 1, 0, 0, 1, 0, 0, 1, 0), nrow = 9)
# Summation matrix for the third row sum constraint
r3 <- matrix(c(0, 0, 1, 0, 0, 1, 0, 0, 1), nrow = 9)
const.mat <- matrix(c(r1, r2, r3, c1, c2, c3, r1, r2, r3, c1, c2, c3), nrow = 6)
print(const.mat)

const.dir <- c("=", "=", "=", "=", "=", "=")

const.rhs <- c(1000, 1000, 1000, 2000, 2000, 2000)

optimum <-  lp(direction = "min", objective.in, const.mat, const.dir, const.rhs)

optimum$solution

print(optimum$solution)`


library(abind)
library(OpenImageR)
setwd('C:/My Books/Packt/Hands-on-Image_Processing 2nd Edition/Chapter 1/images')
path = list.files(".",".jpg", full.names = T)
#read the data
imgs = lapply(path[c(4,19,21)], readImage)
gray_imgs <- lapply(imgs, rgb_2gray)
gray_imgs = lapply(gray_imgs, function(x) resizeImage(x, 256, 256))
comb <- do.call(abind,c(gray_imgs,list(along =3)))
n <- dim(comb)[3]
par(mfrow = c(1, n))
for (i in 1:n) {
  image(rotateImage(comb[, , i], 270), col=gray.colors(256))  
}

find_cluster_kmeans <- function(cl, x) {
  return (which.min(apply(cl$centers, 1, function(y) sum((y-x)^2))))
}

extract.color.feature <- function(img_path, cl) {
  col_df <- colorfindr::get_colors(img_path, top_n=20)
  cols <- as.data.frame(t(do.call(rbind, lapply(col_df['col_hex'], col2rgb))))
  col_cluster <- apply(cols, 1, function(x) find_cluster_kmeans(cl, x))
  col_df <- cbind(col_df, cols, col_cluster=col_cluster)
  col_df <- col_df[c('col_cluster', 'col_share')]
  df_feat <- aggregate(col_df$col_share, list(col_df$col_cluster), FUN=sum)
  names(df_feat) <- c('col_clust', 'prop')
  for (i in 1:(nrow(cl$centers))) {
    if (nrow(df_feat[df_feat$col_clust == i,]) == 0) {
      df_feat <- rbind(df_feat, data.frame(col_clust=i, prop=0))
    }
  }
  df_feat$prop <- df_feat$prop / sum(df_feat$prop)
  return(df_feat)
}

get.color.clusters <- function(k=3, top_n=50) {
  col_df <- NULL
  for (folder in c('missing_hole', 'Mouse_bite')) {
    img_path <- list.files(folder,".png", full.names = T)
    cdf <- do.call(rbind, lapply(img_path, function(p) colorfindr::get_colors(p,top_n=top_n)))
    col_df <- rbind(col_df, cdf)
  }
  cols <- as.data.frame(t(do.call(rbind, lapply(col_df['col_hex'], col2rgb))))
  cl <- kmeans(cols, k)
  print(cl$center)
  return (cl)
}

library(colorfindr)
set.seed(12)
k <- 3
cl <- get.color.clusters(k)
df <- NULL
for (cls in c('missing_hole', 'Mouse_bite')) {
  img_path <- list.files(cls,".png", full.names = T)
  df_feat <- NULL
  for (img in img_path) {
    #print(img)
    df_feat <- rbind(df_feat, extract.color.feature(img, cl)$prop)
  }
  df_feat <- as.data.frame(df_feat)
  df_feat$class <- cls
  df <- rbind(df, df_feat)
}
names(df)[1:k] <- paste0('cluster', 1:k)
df$class <- as.factor(df$class)
df

graphics.off()

library(e1071)
svmfit = svm(class ~ ., data = df, kernel = "radial", cost = 1, scale = FALSE, type='C')
print(svmfit)
plot(svmfit, df, cluster1 ~ cluster2, fill=TRUE, alpha=0.2)
df$prdicted <- predict(svmfit, df)
df

library(imager)
library(abind)
library(magick)
library(OpenImageR)


image1 <- load.image('parrot.png')
#image=imrotate(image,90)
h=dim(image1)[1]
l=dim(image1)[2]
red_image1 <- image1[,,1]
green_image1 <- image1[,,2]
blue_image1 <- image1[,,3]

image2 = load.image("lena.png")
image2=resize(image2,dim(image1)[1],dim(image1)[2])
image2=resize(image2,h,l)
red_image2 <- image2[,,1]
green_image2 <- image2[,,2]
blue_image2 <- image2[,,3]


#get first p components from SVD
#image = face (testing input)
#RGB = 1 for red decomposition, 2 for green, 3 for blue
svd2 = function(image,p,RGB){
  image.svd = svd(image[,,,RGB])
  s=image.svd$d[1:p]
  S=matrix(rep(0,length(s)^2),nrow=length(s))
  diag(S)=s
  V=image.svd$v[,1:p]
  U=image.svd$u[,1:p]
  im=U%*%S%*%t(V)
  return(im)
}

#this gets the last q singular values
#image here is the training (artist) image
svd3 = function(image,q,RGB){
  image.svd = svd(image[,,,RGB])
  s=image.svd$d[q:length(image.svd$d)]
  S=matrix(rep(0,length(s)^2),nrow=length(s))
  diag(S)=s
  V=image.svd$v[,q:ncol(image.svd$v)]
  U=image.svd$u[,q:ncol(image.svd$u)]
  #print(dim(image))
  #print(dim(image.svd$u))
  #print(dim(image.svd$v))
  im=U%*%S%*%t(V)
  return(im)
}

#apply svd2 to each color channel and combine them
svd4 = function(image1, image2, p,q){
  R1 = svd2(image1,p,1)
  dim(R1) = c(dim(R1), 1)
  G1 = svd2(image1,p,2)
  dim(G1) = c(dim(G1), 1)
  B1 = svd2(image1,p,3)
  dim(B1) = c(dim(B1), 1)
  #I1 = svd2(image1,p,4)
  #dim(I1) = c(dim(I1), 1)
  #I1 = matrix(rep(1,ncol(image1)*nrow(image1)),nrow=nrow(image1))
  #dim(I1) = c(dim(I1), 1)
  #train = abind(R1,G1,B1,I1,rev.along=0)
  train = abind(R1,G1,B1,rev.along=0)
  R2 = svd3(image2,q,1)
  dim(R2) = c(dim(R2), 1)
  G2 = svd3(image2,q,2)
  dim(G2) = c(dim(G2), 1)
  B2 = svd3(image2,q,3)
  dim(B2) = c(dim(B2), 1)
  #I2 = svd2(image2,p,4)
  #I2=I1
  #test = abind(R2,G2,B2,I2,rev.along=0)
  test = abind(R2,G2,B2,rev.along=0)
  im = train + test
  im = as.cimg(im)
  #plot(image1)
  #the line below is where I am having the problem. I have tried scaling in many ways, tried several functions for the colorscale argument, and more. Not sure what to do.
  plot(im, main=paste0('p = ', p, ', q = ', q))
  return(im)
}

im = svd4(image1,image2,10,12)
plot(im)

library(animation)
N <- min(dim(image1)[1:2])

saveGIF({
  for (p in 1:30) {
    print(p)
    svd4(image1,image2,p,p+1)
  }
})

library(ordinal)
wine2 <- wine
wine2$rating[wine2$rating==5] <- 1
wine2$rating <- ordered(wine2$rating)

fm1 <- clm(rating ~ response*temp, data=wine2)
summary(fm1)

#library(sjPlot)
library(sjmisc)
library(ggplot2)
#theme_set(theme_sjplot())
#plot_model(fm1, type = "pred", terms = c("response", "temp"))
library(ggeffects)
# select only levels 30, 50 and 70 from continuous variable Barthel-Index
pred <- ggpredict(fm1, terms = c("response[all]", "temp"))
plot(pred) + theme(legend.position = "bottom")

sapply(wine2, class)
unique(wine2$temp)
unique(wine2$response)
unique(wine2$rating)

ggplot(pr, aes(x, predicted, colour = group)) + 
  geom_line() +
  facet_wrap(~facet)

library(fontawesome)
packageVersion('fontawesome')
htmltools::htmlDependency(
  name = "font-awesome",
  version = '0.5.2',
  src = "fontawesome",
  package = "fontawesome" #,
  #stylesheet = c("css/all.min.css", "css/v4-shims.min.css")
)

if (interactive()) {
  
  # Create a Font Awesome icon object
  fa_i(name = "r-project")
  
}

github_icon <- "&#xf09b"
github_username <- "nrennie"
social_caption <- glue::glue(
  "<span style='font-family:\"Font Awesome 6 Brands\";'>{github_icon};</span>
  <span style='color: #E30B5C'>{github_username}</span>"
)

library(ggtext)
ggplot() +
  labs(caption = social_caption) +
  theme(plot.caption = element_textbox_simple())


csv_files <- paste0(1:5, rep('.csv', 5))

get <- function(n=500) {
  data.frame(DateTime=Sys.Date() + sort(sample(1:501, n)),
                   depth = runif(n)) 
}

ggplot() +
  # Loop through each dataframe to add a line
  lapply(seq_along(csv_files), function(i) {
    df_name <- paste0("h", gsub(".csv", "", csv_files[i]))
    df <- get()
    geom_line(data = df, aes(x = DateTime, y = depth, color = as.factor(i)))
  }) +
  labs(title = "Hobo Data",
       x = "",
       y = "Depth",
       color="color") +
  theme_minimal() +
  theme(legend.position = "top")

library(uwot)
Futbol_Distances <- matrix(c(0, 0.1125300, 0.2593345, 0.3366033, 0.1128020, 0.3617233,
                      0.1125300, 0, 0.2304761, 0.1847940, 0.2635693, 0.4567474,
                      0.2593345, 0.2304761, 0, 0.1489901, 0.2106683, 0.4101453,
                      0.3366033, 0.1847940, 0.1489901, 0, 0.1494022, 0.1547576,
                      0.1128020, 0.2635693, 0.2106683, 0.1494022, 0, 0.4835147,
                      0.3617233, 0.4567474, 0.4101453, 0.1547576, 0.4835147, 0), nrow=6, byrow=T)
UMAP_prep <- umap(Futbol_Distances, metric = "precomputed", n_components = 5, n_neighbors=2)

block.data = structure(list(ntl = c(52.93999863, 49.45000076, 49.11999893, 
                                    44.36999893, 39.97000122, 38.43999863, 38.99000168, 40.88000107, 
                                    37.47999954, 40.65000153, 44.79999924, 50.38000107, 49.38000107, 
                                    68.80000305, 59.88000107), agbh030 = c(1.773146749, 2.89567709, 
                                                                           3.996930361, 4.146727085, 4.324529648, 3.946338654, 3.430744886, 
                                                                           2.554599762, 2.052541256, 1.614771366, 1.991117001, 2.35665369, 
                                                                           0.801872492, 3.310310841, 5.005721092), agbh040 = c(1.778323054, 
                                                                                                                               2.893922091, 3.992192984, 4.14255619, 4.319309235, 3.943005562, 
                                                                                                                               3.425927639, 2.553015947, 2.049137354, 1.619293809, 1.997152209, 
                                                                                                                               2.3637712, 0.81288743, 3.306827068, 4.997349739), blue030 = c(0.717936635, 
                                                                                                                                                                                             0.995600402, 1.074265957, 1.162851691, 1.112542748, 1.05404532, 
                                                                                                                                                                                             0.972470403, 0.864918828, 0.797388136, 0.780449748, 0.717492938, 
                                                                                                                                                                                             0.659686863, 0.544718802, 0.954298615, 1.098036289), blue040 = c(0.717890441, 
                                                                                                                                                                                                                                                              0.993733525, 1.072574139, 1.160672426, 1.111375213, 1.053111792, 
                                                                                                                                                                                                                                                              0.971249402, 0.863858879, 0.796197593, 0.780405819, 0.717574954, 
                                                                                                                                                                                                                                                              0.661465645, 0.546935678, 0.95236063, 1.097277403), nir030 = c(0.99114579, 
                                                                                                                                                                                                                                                                                                                             1.376678824, 1.49750936, 1.542472482, 1.435504317, 1.415053844, 
                                                                                                                                                                                                                                                                                                                             1.312831402, 1.290184379, 1.151046991, 1.062780142, 0.961566031, 
                                                                                                                                                                                                                                                                                                                             0.851697564, 0.746279657, 1.258480549, 1.483649731), nir040 = c(0.990923822, 
                                                                                                                                                                                                                                                                                                                                                                                             1.374148846, 1.495215654, 1.539586306, 1.434046388, 1.41359663, 
                                                                                                                                                                                                                                                                                                                                                                                             1.31127429, 1.288556933, 1.149601102, 1.062715054, 0.961549222, 
                                                                                                                                                                                                                                                                                                                                                                                             0.854078174, 0.749200106, 1.256223083, 1.48290813), pop030 = c(33.98461914, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                            62.45861053, 78.47203827, 64.81855011, 69.18198395, 47.66866684, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                            85.6471405, 63.21319962, 17.80360603, 57.13486862, 88.91275024, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                            58.64352036, 34.46327209, 54.0263176, 61.17818451), pop040 = c(33.99507141, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           62.34374619, 78.32093048, 64.78107452, 68.98097992, 47.65901184, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           85.38433838, 63.14036942, 17.84538078, 57.06893158, 88.97719574, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           58.98400879, 34.64493942, 53.96364212, 61.17742538), road030 = c(152.4203644, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            435.8898926, 412.6563416, 295.8404541, 289.2147217, 194.1574554, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            136.9489441, 213.915741, 195.634903, 275.4249573, 129.0567017, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            110.0097885, 35.32381439, 138.662796, 365.485321), road040 = c(153.013031, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           434.7412109, 411.8447266, 295.538147, 288.5683899, 193.8339233, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           137.1492004, 213.4812012, 196.2715302, 276.1116638, 129.8981934, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           110.5063858, 35.86360931, 139.2144165, 364.8994446), tirs030 = c(25.39851189, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            35.85142899, 37.86270905, 38.16120148, 36.8949585, 34.88610458, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            33.1179924, 29.98550034, 26.51055908, 26.58303452, 25.10464287, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            22.69356346, 18.32171249, 30.8216877, 36.87643814), tirs040 = c(25.39133835, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            35.77946091, 37.79912567, 38.09967804, 36.84203339, 34.84803772, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            33.07061386, 29.94636917, 26.48450851, 26.57940674, 25.10551834, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            22.75337219, 18.39633369, 30.77775002, 36.85960007)), class = "data.frame", row.names = c(NA, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      -15L))

head(block.data)

library("randomForest")
library("doFuture") 

#wd <- "test/"

# Load the data
#block.data <- read.csv(paste0(wd, "block.data.psf.csv"))
eq1 <- ntl ~ .

# for reproduciblity
set.seed(123)
r2.df <- NULL

foreach (i = seq(030, 040, by = 10)) %do% {
  std <- sprintf("%03.0f", i)
  
  popCol <- paste0("pop", std)
  tirsCol <- paste0("tirs", std)
  agbhCol <- paste0("agbh", std)
  roadCol <- paste0("road", std)
  blueCol <- paste0("blue", std)
  nirCol <- paste0("nir", std)
  
  testVect = c("ntl", 
               popCol,
               tirsCol,
               agbhCol,
               roadCol,
               blueCol,
               nirCol)
  
  subBlockData <- subset(block.data, select = testVect)
  
  # default RF model
  m1 <- randomForest(
    formula = eq1,
    data    = subBlockData)
  
  # number of trees with highest r2
  btree = which.max(m1$rsq)
  
  features <- subBlockData[, 2:7]
  
  #m1 <- randomForest(
  #  formula = ntl ~ .,
  #  data    = subBlockData,
  #  ntree = btree,
  #  mtry = ncol(features)/3,
  #  importance = FALSE)
  
  #m1$rsq[btree] # "% Var explained" is the number I want in the csv
  r2.df <- rbind(r2.df, data.frame(column=i, r2=m1$rsq[btree]))
}

head(r2.df)
write.csv(r2.df, 'result.csv', row.names = FALSE)

y <- block.data$ntl
n <- length(y)
m <- mean(y)
p <- predict(m1)
plot(y, pch='19', col='black')
lines(y, col='black')
lines(rep(m, n), col='red', lty=2)
points(p, col='green', pch=19)
lines(p, col='green', pch=19)
legend('left', legend=c("ntl", "mean", "RF-pred"), fill = c("black", "red","green"))
       
plot.new()
plot.window(xlim = c(0, 10), ylim = c(0, 10))


half_side_length <- 2.5


x_coords_polygon <- c(5, 7.5, 5, 2.5)   
y_coords_polygon <- c(2.5, 7.5, 10, 7.5)   


x_coords_triangles <- list(
  c(5, 6.25, 5),   
  c(6.25, 7.5, 6.25),   
  c(5, 3.75, 5),   
  c(3.75, 2.5, 3.75)  
)

y_coords_triangles <- list(
  c(2.5, 3.75, 5),    
  c(7.5, 8.75, 10),  
  c(7.5, 6.25, 5),    
  c(2.5, 1.25, 0)     
)

polygon(x_coords_polygon, y_coords_polygon, col = "blue", border = "black")

for (i in 1:4) {
  polygon(x_coords_triangles[[i]], y_coords_triangles[[i]], col = "lightgreen", border = "black")
}

draw_left_square <- function(a, b, xlim=8, ylim=8) {
  
  plot.new()
  plot.window(xlim = c(0, xlim), ylim = c(0, ylim))
  
  x_coords_polygon <- c(0, a, a+b, b)   
  y_coords_polygon <- c(b, 0, a, a+b)   
  polygon(x_coords_polygon, y_coords_polygon, col = "blue", border = "black")
  
  x_coords_triangles <- list(
    c(0, 0, a),    
    c(a, a+b, a+b),  
    c(a+b, a+b, b),    
    c(0, 0, b)     
  )
  y_coords_triangles <- list(
    c(b, 0, 0),    
    c(0, 0, a),  
    c(a, a+b, a+b),    
    c(b, a+b, a+b)     
  )
  cols <- c("yellow", "brown", "lightgreen", "pink")
  for (i in 1:4) {
    polygon(x_coords_triangles[[i]], y_coords_triangles[[i]], col = cols[i], border = "black")
  }  
}

draw_right_square <- function(a, b, xlim=8, ylim=8) {
  
  plot.new()
  plot.window(xlim = c(0, xlim), ylim = c(0, ylim))
  
  x_coords_polygon <- c(0, a, a, 0)   
  y_coords_polygon <- c(0, 0, a, a)   
  polygon(x_coords_polygon, y_coords_polygon, col = "blue", border = "black")
  x_coords_polygon <- c(a, a+b, a+b, a)   
  y_coords_polygon <- c(a, a, a+b, a+b)   
  polygon(x_coords_polygon, y_coords_polygon, col = "blue", border = "black")
  
  x_coords_triangles <- list(
    c(0, a, 0),    
    c(a, a, 0),  
    c(a, a+b, a+b),    
    c(a, a, a+b)     
  )
  y_coords_triangles <- list(
    c(a, a, a+b),    
    c(a, a+b, a+b),  
    c(0, 0, a),    
    c(0, a, a)     
  )
  cols <- c("yellow", "lightgreen", "brown", "pink")
  for (i in 1:4) {
    polygon(x_coords_triangles[[i]], y_coords_triangles[[i]], col = cols[i], border = "black")
  }  
}

a <- 3
b <- 4

a <- 2.5
b <- 10.6
par(mar=c(0.2, 0.2, 0.2, 0.2), mfrow=c(1,2),
    oma = c(4, 4, 0.1, 0.1))
draw_left_square(a, b, xlim=15, ylim=15)
draw_right_square(a, b, xlim=15, ylim=15)

f <- function(x) {
  if (all(Im(z <- zapsmall(x))==0)) as.numeric(z) else x
}

df <- structure(list(GABA_Area = c(0.00064604+0i, 0.001132496+0i, -0.000143955+0i, 
                                   0.000874619+0i, 0.000654323+0i, 0.000807692+0i, 0.000415511+0i
), GABA_ConcCr = c(0.137742432+0i, 0.153683294+0i, -0.004261154+0i, 
                   0.134065319+0i, 0.117744826+0i, 0.12347494+0i, 0.08741057+0i), 
GABA_ConcCho = c(0.14852694+0i, 0.211853026+0i, 0.008788317+0i, 
                 0.176029256+0i, 0.147270858+0i, 0.214000954+0i, 0.091670108+0i
), GABA_ConcNAA = c(0.081673683+0i, 0.094836052+0i, 0.030840143+0i, 
                    0.092618293+0i, 0.069915052+0i, 0.082425039+0i, 0.059673271+0i
)), row.names = c(NA, 7L), class = "data.frame")
df

x <- c(0.00064604+0i, 0.001132496+0i, -0.000143955+0i, 0.000874619+0i, 
       0.000654323+0i, 0.000807692+0i, 0.000415511+0i, 0.000801348+0i, 
       0.00083489+0i, 0.001086424+0i, 0.000574472+0i, 0.000898015+0i, 
       0.000506014+0i, 0.000941727+0i, -0.021617815+0i, 0.000786799+0i, 
       -0.000864898+0i, 0.00098191+0i, 0+0.0000798079424579433i, 0.000971948+0i, 
       -0.042977607+0i, 0.000849911+0i, 0.00054918+0i, 0.000926088+0i, 
       0.000622691+0i, 0.000647898+0i, 0.001010186+0i, 0+0.0179001356679363i, 
       -0.064823706+0i, 0.000912678+0i)

library(keras)
model <- keras_model_sequential() %>%
  layer_lstm(units = 10,
             batch_input_shape = c(1, pq, 1),
             stateful = TRUE) %>%
  layer_dense(units = 1, activation = "relu")

model %>%
  compile(loss = 'mse', optimizer = optimizer_adam(learning_rate = 0.00001), metrics = 'mae')

summary(model)

model %>% fit(
  x = X_tr,
  y = Y_tr,
  batch_size = 1,
  epochs = 30,
  verbose = 1,
  shuffle = FALSE
)

library(pdftools)
library(tm)
library(tesseract)

pdf_url <- "https://www.nytimes.com/images/2013/06/02/nytfrontpage/scan.pdf"

text<-pdftools::pdf_text(pdf = pdf_url)
text<-gsub("\\n", " ", text)     
text<-gsub(pattern="\\W", text, replace=" ")
text<-stripWhitespace(text)

pngfile <- pdftools::pdf_convert(pdf_url, dpi = 600)
text <- tesseract::ocr(pngfile)
cat(text)

library(utils)

get.subsets.sat.constraint <- function(x, k, m) {
  combs <- combn(x, k)
  indices <- apply(combs, 2, function(x) all(dist(x, method='manhattan') >= m))
  t(combs[,indices])
}

n <- 7
k <- 3
m <- 2
x <- 1:n
get.subsets.sat.constraint(x, k, m)

get.subsets.sat.constraint(1:10, 4, 3)

library(microbenchmark)
library(ggplot2)
tm <- microbenchmark(get.subsets.sat.constraint(1:5, k, m), 
               get.subsets.sat.constraint(1:10, k, m), 
               get.subsets.sat.constraint(1:20, k, m), 
               get.subsets.sat.constraint(1:30, k, m), 
               times=100L)
autoplot(tm)

df <- structure(list(E2F4 = c("+/+", "+/+", "+/+", "-/-", "-/-", "-/-", 
                              "-/-", "-/-", "-/-", "-/-", "-/-", "-/-", "+/+", "+/+", "+/+", 
                              "+/+", "+/+", "+/+", "-/-", "-/-", "-/-", "-/-", "-/-", "-/-", 
                              "-/-", "-/-", "-/-", "+/+", "+/+", "+/+"), Colonies = c(1052, 
                                                                                      983, 1057, 497, 464, 437, 111, 81, 85, 40, 42, 43, 523, 523, 
                                                                                      636, 646, 730, 749, 58, 60, 53, 705, 746, 785, 54, 82, 80, 1618, 
                                                                                      1470, 1505), Clone = c("HT29", "HT29", "HT29", "7", "7", "7", 
                                                                                                             "11", "11", "11", "2", "2", "2", "Control", "Control", "Control", 
                                                                                                             "Control", "Control", "Control", "2", "2", "2", "7", "7", "7", 
                                                                                                             "11", "11", "11", "HT29", "HT29", "HT29"), Well = c("32", "32", 
                                                                                                                                                                 "32", "32", "32", "32", "32", "32", "32", "32", "32", "32", "32", 
                                                                                                                                                                 "32", "32", "32", "32", "32", "32", "32", "32", "32", "32", "32", 
                                                                                                                                                                 "32", "32", "32", "32", "32", "32"), Hour = c(24, 24, 24, 24, 
                                                                                                                                                                                                               24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 48, 48, 48, 48, 48, 
                                                                                                                                                                                                               48, 48, 48, 48, 48, 48, 48, 48, 48, 48)), row.names = c(NA, -30L
                                                                                                                                                                                                               ), class = c("tbl_df", "tbl", "data.frame"))
ggplot(welldata, aes(x = E2F4, y = Colonies, color = Clone, fill = E2F4)) +
  geom_point(aes(color = Clone), size = 2) +
  geom_errorbar(data = datX, mapping = aes(x = E2F4, ymin 
                                           =Colonies - Errors, ymax = Colonies + Errors)) +
                
                facet_wrap(~Well, nrow = 1, strip.position = "bottom") +
                  theme_minimal() + 
                  theme(strip.placement = "outside", panel.spacing = unit(0, 
                                                                          "cm"),  
                        strip.text = element_text(size = 10, margin = margin(b=15)),  
                        legend.title = element_text(size = 10),
                        plot.title = element_text(margin = margin(b=10)))

dat1 <- data.frame(x = "-/-", y = 2837.3333, Well = "0", errors = 334.02993877795)
dat2 <- data.frame(x = "+/+", y = 1911.33333, Well = "0", errors = 103.568010)
dat3 <- data.frame(x = "-/-", y = 137, Well = "8", errors = 158.745)
dat4 <- data.frame(x = "+/+", y = 259.6667, Well = "8", errors = 197.616630)
dat5 <- data.frame(x = "-/-", y = 95.666, Well = "16", errors = 93.0931)
dat6 <- data.frame(x = "+/+", y = 557.6667, Well = "16", errors = 133.82949)
dat7 <- data.frame(x = "-/-", y = 74.333, Well = "32", errors = 66.515)
dat8 <- data.frame(x = "+/+", y = 757.3333, Well = "32", errors = 43.98106)

datX <- bind_rows(dat1, dat2, dat3, dat4, dat5, dat6, dat7, dat8)
colnames(datX) <- c('E2F4','Colonies','Well','Errors')

datX %>% mutate(ymin = Colonies - Errors, ymax = Colonies + Errors) %>%
  mutate(Well = factor(Well, levels = levels(well_data4$Well)))
                
#apply(combs, 2, function(y) as.numeric(dist(y, method='manhattan')))

#Filter(function(x) x%%2 == 0,1:10)

library(igraph)
set.seed(1)
g<-sample_fitness_pl(10000, 1000000, 2.7, 2.7)
df <- as.data.frame(table(degree(g, mode='in')))
names(df) <- c('in.deg', 'freq')
df$in.deg <- as.integer(as.character(df$in.deg))
head(df)
model <- nls(freq ~ c*in.deg^(-alpha), data=df, start = list(c = 10,alpha = 0.1))
summary(model)
summary(model)$coefficients
deg <- seq(min(df$in.deg), max(df$in.deg), 1)
pow.law.pred <- predict(model, newdata = data.frame(in.deg=deg))
pred.df <- data.frame(deg=deg, pred=pow.law.pred)
library(ggplot2)
ggplot(df, aes(in.deg, freq)) + geom_point() + 
  geom_line(data=pred.df, aes(deg, pred), col='red')
ggplot(df, aes(in.deg, freq)) + geom_point() +   coord_trans(y ='log10', x='log10')
#ggplot(df, aes(log10(in.deg+0.1), log10(freq+0.1))) + geom_point()
clu <- components(g)
count_components(g) 
groups(clu)