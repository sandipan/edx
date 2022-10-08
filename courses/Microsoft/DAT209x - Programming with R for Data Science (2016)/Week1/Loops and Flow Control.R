#Loops in R

1:3
for(i in 1:3) {
  cat(i, "+", i, "=", i+i, "\n")
}
d <- data.frame(a = 1:2, b=2:3)

for(x in d) {
  cat("Column sum:", sum(x), "\n")
}

#Flow Control: if and if else statements

for(i in 1:3){
  if (i==2) cat("This index is even:","\n")
  cat(i,"\n")
} 

for(i in 1:3){
  if (i==2) cat("The index is 2","\n") else 
    cat("The index is not 2","\n")
} 

#While loop example


set.seed(886)

k<-0 # number of big parts (>2)
y<-abs(rnorm(1000)) # simulated part size
i<-0 # index of parts
# loop: 
while(k<3 & i<1000){
  i<-i+1
  temp<-y[i]
  k<-k+(temp>2)
}
rm(temp)
i

#Repeat loop example}

set.seed(371)
eye.colors<-c("brown","blue","green","yellow","grey")
eyecolor<-data.frame(personId=1:100,color=
                       sample(eye.colors,100,rep=T))
i<-0
list.of.ids<-numeric(0) # patient ID list
#loop:
repeat {
  i<-i+1
  if(eyecolor$color[i]=="yellow" | 
     eyecolor$color[i]=="blue") next
  list.of.ids<-c(list.of.ids,eyecolor$personId[i])
  if(i==100 | length(list.of.ids)==20) break
}
list.of.ids

#Loops and run times

set.seed(853)
y<-matrix(rnorm(1000000),nrow=1000)
z<-0*y
time1<-as.numeric(Sys.time())
#loop:
for(i in 1:1000){
  for(j in 1:1000){
    z[i,j]<-y[i,j]^2
  }
}
time2<-as.numeric(Sys.time())

# using object form in R:
z<-y^2
time3<-as.numeric(Sys.time())

# run time increase factor:
(time2-time1)/(time3-time2)

#lapply() and sapply()

set.seed(777)

my.data<-data.frame(data1=rnorm(10),data2=rnorm(10),data3=rnorm(10))
lapply(my.data,sum)
sapply(my.data,sum)

#lapply() and sapply() examples

A<-matrix(1:9,nrow=3);B<-matrix(1:16,nrow=4);C=matrix(1:8,nrow=4)
my.list<-list(A=A,B=B,C=C); my.list

lapply(my.list,"[",,2)