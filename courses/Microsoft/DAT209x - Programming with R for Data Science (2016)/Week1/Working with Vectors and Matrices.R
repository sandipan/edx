#Constructing vectors

x<-9:17
x

y<-seq(0,1,length=11)
y

z<-rep(1:2, 5)
z

xz10<-c(x,z,10)
xz10

#Constructing matrices

A<-rbind(1:3, c(1,1,2))
A

B<-cbind(1:3, c(1,1,2))
B

C<-matrix(c(1,0,0,1,1,0,1,1,1), nrow=3, ncol=3)
C

#Index and logical index

x<- (-5):5
x

x[4:8]

x[-c(1:3,9:11)]

index<-abs(x)<3
index 
x[index]

A<-matrix((-4):5, nrow=2, ncol=5)
A
A[A<0]

A[A<0]<-0
A

A[2,]

A[,c(2,4)]  

#Properties of vectors and matrices

A<-matrix(rep(c(TRUE,FALSE),2),nrow=2)
B<-rnorm(4)
C<-matrix(LETTERS[1:9],nrow=3)
A;B;C
mode(A);mode(B);mode(C)

x<-matrix(c(NA,2:12),ncol=3)
x
length(x[1,])
length(x)

dim(x); dim(x)[2]

#Naming rows and columns in a matrix

x<-matrix(rnorm(12),nrow=4)
x
dimnames(x)[[2]]<-paste("data",1:3,sep="")
dimnames(x)[[1]]<-paste("obs",1:4,sep="")
x

rownames(x)
colnames(x)
