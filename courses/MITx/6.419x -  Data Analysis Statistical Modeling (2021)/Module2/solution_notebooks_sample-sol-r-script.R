# Script with Dendrograms/hierarchical clustering

library(Rtsne)
library(cluster)
library(dendextend)
# For matrix multiplication
library(Rfast)
# irlba was the fastest SVD library
# library(bootSVD)
# library(gmodels)
library(irlba)
library(reticulate)
library(viridis)
library(RColorBrewer)
library(Polychrome)
# RcppCNPy is an alternative to reticulate but is buggy on the reduced datasets

# Load data and process, take PCA
np <- import("numpy")
X <- np$load("data/p1/X.npy")
X <- log2(X+1)
centered <- scale(X, scale=FALSE)
svd.result <- irlba(centered,nv=50)
z <- centered %*% svd.result$v

# Plot the data
plot(z[,1],z[,2])
z_tsne <- Rtsne(z)
plot(z_tsne$Y[,1],z_tsne$Y[,2])

# Distance matrix, ward clustering
dis <- dist(z, method="euclidean")
hc1 <- hclust(dis, method="ward.D" )

# Create dendrogram to visualize
dend <- as.dendrogram(hc1)
d1=color_branches(dend,k=5, col = brewer.pal(n=5,name="Set2"))
plot(d1)
title("Hierarchical clustering, 5 clusters")

# Rectangles show 3 large subgroups
rect.hclust(hc1, k = 3, border = brewer.pal(n=5,name="Set2")[c(1,3,5)])

# Clusters in same sub-cluster in dendrogram are in the same large component in PCA plot
sub_grp <- cutree(hc1, k = 5)
plot(z_tsne$Y[,1],z_tsne$Y[,2],col=brewer.pal(n=5,name="Set2")[sub_grp])
plot(z[,1],z[,2],col=brewer.pal(n=5,name="Set2")[sub_grp])

# Can do silhouette plot, inconclusive
plot(silhouette(sub_grp,dis), col=1:5, border=NA)

### Larger dataset ###
X <- np$load("data/p2_unsupervised_reduced/X.npy")
X <- log2(X+1)
centered <- scale(X, scale=FALSE)
system.time(svd.result <- irlba(centered, nv=50))
z <- mat.mult(centered,svd.result$v)
plot(z[,1],z[,2])
z_tsne <- Rtsne(z)
plot(z_tsne$Y[,1],z_tsne$Y[,2])
dis <- dist(z, method="euclidean")

hc1 <- hclust(dis, method="ward.D" )
dend <- as.dendrogram(hc1)
d1=color_branches(dend,k=30, col = 2:31)
plot(d1)
rect.hclust(hc1, k = 3, border = 2:4)
title("Cell sub-types")

#plot(hc1, cex=0.6, hang=-1)
sub_grp <- cutree(hc1, k = 30)
plot(z_tsne$Y[,1],z_tsne$Y[,2],col=glasbey.colors(30)[sub_grp])
plot(z[,1],z[,2],col=glasbey.colors(30)[sub_grp])

# Silhouette
plot(silhouette(sub_grp,dis), col=glasbey.colors(30)[sub_grp], border=NA)
