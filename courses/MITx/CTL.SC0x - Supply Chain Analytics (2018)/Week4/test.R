# Route with Savings
setwd('C:/Courses/Edx/Current/MITX Supply Chain/Week4')
d <- read.table('dist1.txt')
d <- as.matrix(d)
d <- d + t(d) - diag(diag(d))
savings <- matrix(rep(0, prod(dim(d)-1)), nrow=nrow(d)-1)
DC <- nrow(d)
for (i in 1:(nrow(d)-1)){
  for (j in 1:(ncol(d)-1)){
    #savings[i,j] <- ifelse(i==j, NA, (d[DC,i] + d[i,DC] + d[DC,j] + d[j,DC]) - (d[DC,i] + d[i,j] + d[j,DC]))
    savings[i,j] <- (d[DC,i] + d[i,DC] + d[DC,j] + d[j,DC]) - (d[DC,i] + d[i,j] + d[j,DC])
  }  
}
res <- sort(savings,index.return=TRUE, decreasing = TRUE)#, na.last = NA)
indices <- as.data.frame(t(sapply(res$ix, 
                    function(x) c((x - 1) %/% nrow(savings) + 1,(x - 1) %% nrow(savings) + 1))))
                                  #ifelse(x %% ncol(savings) == 0,  ncol(savings), x %% ncol(savings)))) ))  
indices$val <- res$x
indices$ix <- res$ix
names(indices)[1:2] <- c('i', 'j')
indices <- subset(indices, i < j)

routes = list()
n <- 0
rdf <- NULL
for (k in 1:nrow(indices)) {
  i <- indices[k,]$i
  j <- indices[k,]$j
  r_i <- rdf[rdf$node==i,]
  r_j <- rdf[rdf$node==j,]
  if (nrow(r_i) == 0 & nrow(r_j) == 0) {
    n <- n + 1
    rdf <- rbind(rdf, data.frame(node=i, route=n))
    rdf <- rbind(rdf, data.frame(node=j, route=n))
    routes[[i]] <- c(i,j)
  }
}