#Writing data to a text file}

mydat<-data.frame(x1=c(2,2,3,3,1,1),
                  x2=c(0.3,1,2.1,2.2,0.1,0.2),
                  x3=c(0.01,0.11,0.04,0.02,0.1,0.06))
mydat

write.table(mydat,file="c:/datadir/filename.dat"),
row.names=FALSE,col.names=FALSE,sep=", ")

write.table(mydat,file="Data/write.datatest.txt",
            row.names=FALSE,col.names=FALSE,sep=", ")

#Basic writing functions

set.seed(832)
cat("Test file for cat\n",round(rnorm(5),3),"\n", 
    file="cattest.txt")

lin<-c("Count down", paste(rev(1:10), collapse="-"), 
       "Go")
writeLines(lin, con="Data/writelinestest.txt")

#A few special ones

sink("Data/sinktest.txt")
x<-1:5
y<-1:3
outer(x,y)
sink()

set.seed(543)
x<-1:3
y<-rpois(10, 4)
dump(c("x","y"), file="Data/dumptest.txt")

lis<-list(x=1:5, y=3, z=c("a","b","c"))
dput(lis, file="Data/dputtest.txt")
dget("Data/dputtest.txt")

#Using file connections}

set.seed(713)
f2<-file("Data/testout.txt", open="w")
cat("Header of file\n\n", file=f2)
mat<-matrix(round(rnorm(12),8), ncol=3)
write.table(mat, file=f2, row.names=FALSE, col.names=FALSE)
close(f2)

#Using append=TRUE

set.seed(484)

cat("Header of file\n\n", file="Data/testappend.txt")
mat<-matrix(round(rnorm(12),8), ncol=3)
write.table(mat, file="Data/testappend.txt", row.names=FALSE, 
            col.names=FALSE, append=TRUE)

#Working with binary files: Using save() and load()

x<-rnorm(3)
lis<-list(y=1:5, z="lalala", fun=function()cat("ha-ha-ha\n"))
save(x,lis, file="Data/test1.RData")

rm(list=ls())
load(file="Data/test1.RData")
ls()

