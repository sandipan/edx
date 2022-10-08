#Reading data from a text file

mydat<-data.frame(x1=c(2,2,3,3,1,1), x2=c(.3, 1, 2.1, 2.2, .1, .2), x3=0.01*c(1,11,4,2,10,6))
mydat

#The R working directory

getwd()
setwd("c:/otherdatadir")
mydat<-read.table("Data/filename.mydat", header=TRUE)

# The read.table()| function 

options(deparse.cutoff=48)
args(read.table)
dat<-read.table("Data/testdat1.dat", header=TRUE, skip=5, nrow=2)
dat

dat<-read.table("Data/testdat2.dat", header=TRUE, na.strings=".", 
                comment.char=";", dec=",")
dat

#Reading from more complicated files

cat(1:5+pi,'\n',file="scantest.txt")

vec<-scan("scantest.txt")
vec

cat(paste("A B C\n",paste(1:5+0.324654, collapse=" "),'\n',"How many roads\n", sep=""),file="readlinestest.txt")

vec<-readLines("readlinestest.txt")
vec
strsplit(vec[2]," ")
as.numeric(strsplit(vec[2]," ")[[1]])

#File connections

f1<-file("readlinestest.txt", open="r")
scan(f1,what="",nlines=1)
scan(f1,what=double(),nlines=1)
readLines(f1)
close(f1)
