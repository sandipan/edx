setwd('C:\\courses\\Edx\\Current\\R for Data Science')

# Week 1

# Q1
mu <- 2
sigma <- 1
x <- rnorm(100, mean=mu, sd=sigma)
y <- exp(x)
mean(y)
exp(mu + sigma^2/2)
exp(mu - sigma^2/2)
exp(mu - sigma^2)

# Q2
a <- 1
b <- 3
c <- 1
d <- sqrt(b^2 - 4*a*c)
c((-b-d)/(2*a), (-b+d)/(2*a))

# Q3
set.seed(1234)
x <- rnorm(100, mean=.5, sd=.3)
mean(x)
sd(x)
hist(x, axes=F)
axis(1)
axis(4)

y <- c(1, 2, 3.14, 4, 5)
z <- c(FALSE, TRUE, 2, 3, 4)
matrix(c(5,4,3,2,1,0)+2,nrow=2)<5

my.display<-function(x, display=FALSE, type=NULL, prob=FALSE){
  cat("Summary of input: \n")
  print(summary(x))
  if (display) {
    if (is.null(type)) {
      print('Please specify type as either hist or density')
    } else {
      if (type == 'hist' & !prob) {
        hist(x)
      } else if ((type == 'hist' & prob) | type == 'density') {
        plot(density(x))
      }
    }
  }
}

set.seed(1234)
my.data<-rnorm(200)
my.display(my.data)
my.display(my.data,display=TRUE,type="hist",prob=TRUE)

x<-matrix(-4:5,nrow=2)
x[,3:4]
#x[3:4]

set.seed(9852)
my.data<-list()
for(i in 1:100){
  my.data[[i]]<-matrix(rnorm(16),nrow=4)
}
my.index<-list()
for(i in 1:100){
  my.index[[i]]<-(my.data[[i]]<0)
}
my.negatives<-matrix(rep(0,16),nrow=4)
for(i in 1:100){
  my.negatives<-my.negatives+my.index[[i]]
}
my.negatives
sum(my.negatives)
my.negative.values<-numeric(0) 
for(i in 1:100){
  my.negative.values<-c(my.negative.values,my.data[[i]][my.index[[i]]])
}
summary(my.negative.values) 

# Week 2
setwd('C:/courses/Edx/Current/R for Data Science')
df <- read.table("grade.txt", header=TRUE, skip=2, nrow=12)
df <- read.table("grade.txt", header=TRUE, skip=2, nrow=12, sep=',')
df <- read.csv("grade.txt", header=TRUE, nrow=12)
df <- read.csv("grade.txt", header=TRUE, skip=2, nrow=12)

vec <- readLines('dat.txt')
vec <- strsplit(vec[2], " ")
vec <- as.numeric(vec)

f1 <- file("dat.txt", open="r") 
scan(f1,what="",nlines=2)

my.data<-read.table(f1,skip=4,comment.char="%",nrows=7)

set.seed(9007)
my.data<-data.frame(x=rnorm(10),y=rnorm(10)+5,z=rchisq(10,1))
#write.table(format(my.data,digits = 20),"Assignment 6b.txt",row.names=FALSE)
my.data2 <- my.data * 10e5
write.table(format(my.data,digits = 20),"Assignment 6b.txt",row.names=FALSE)
my.data3 <- read.table("Assignment 6c.txt", header=TRUE) / 10e5

options(digits = 20)
my.data[1,1]
my.data3[1,1]

1 - 0.9 - 0.1

# SQL
library(RODBC)
odbcDataSources()
#channel <- odbcConnect("test_sqlite", believeNRows = FALSE, rows_at_time = 1)
channel <- odbcConnect("test_sqlite")
table_list<-sqlTables(channel)
#sqlDrop(channel, "USArrests", errors = FALSE)
#sqlSave(channel, USArrests)
sqlFetch(channel, "USArrests", rownames = "state") # get the lot
foo <- cbind(state=row.names(USArrests), USArrests)[1:3, c(1,3)]
foo[1,2] <- 222
sqlUpdate(channel, foo, "USArrests")
sqlFetch(channel, "USArrests", rownames = "state", max = 5)
sqlDrop(channel, "USArrests") 
close(channel)
## End(Not run)

conStr <- paste("Server=msedxeus.database.windows.net", 
                "Database=DAT209x01", "uid=RLogin", "pwd=P@ssw0rd", "Driver = {SQL Server}", sep=";")
conn <- odbcDriverConnect(conStr)

library(RSQLite)
db <- datasetsDb()
dbListTables(db)
dbReadTable(db, "CO2")
dbGetQuery(db, "SELECT * FROM CO2 WHERE conc < 100")
dbDisconnect(db)

con <- dbConnect(SQLite(), dbname="test")
dbListTables(con)
dbWriteTable(con, "USArrests", USArrests)
dbReadTable(con, "USArrests")
#dbRemoveTable(con, "USArrests")
dbDisconnect(con)

# Week4
dat1 <- read.csv('dat1.csv')
dat2 <- read.csv('dat2.csv')
merge(dat1, dat2)
merge(dat1, dat2, all = TRUE)

pattern <- ".*banana[ :]*([0-9]*).*"
str <- "3 3 banana : 3 Apple : 3 Orange : 04" #"2 2 Orange:1 Apple: 3 banana: 10 " #"1 1 apple : 3 Orange : 9 banana: 2"
as.numeric(sub(pattern, "\\1", str, ignore.case = TRUE))
set.seed(449)
my.dates<-as.Date(sample(18000:20000,20), origin = "1960-01-01")
julian(my.dates, origin = as.Date("1960-01-01"))
set.seed(119) 
my.days<-sample(18000:20000,20)
?weekdays
library(chron)
unlist(month.day.year(0))
my.days.structure<-month.day.year(my.days,origin=c(1,1,1960))
weekdays(.leap.seconds)
my.date.info<-data.frame(Weekday=weekdays(my.dates),my.days.structure)
head(airquality)
sapply(airquality, mean)
colMeans(airquality)
head(chickwts)
aggregate(weight~feed, data=chickwts, mean)
tapply(chickwts$weight, chickwts$feed, mean)
by(chickwts$weight, chickwts$feed, mean)
#sapply(chickwts, mean)
with(airquality, table(Month, Temp < 65))
#tapply(airquality$Month, airquality$Temp < 65)
table(LowTemp = airquality$Temp < 65, airquality$Month)
#sapply(airquality, airquality$Temp < 65)
prop.table(with(airquality, table(Month, Temp > 80)),1)
#prop.table(with(airquality, table(Month, Temp > 80)),2)
prop.table(with(airquality, table(Temp > 80, Month)),2)
lapply(airquality, mean)
as.list(sapply(airquality, mean))

my.data<-data.frame(Treatment=c(rep("A",4),rep("B",4)),
                    Stone=rep(rep(c("Small","Large"),c(2,2)),2),
                    Success=rep(c(1,0),4),
                    Count=c(81,6,192,71,234,36,55,25))
my.table<-xtabs(Count~Treatment+Success+Stone,data=my.data) 
#with(my.data, table(Treatment, Success, Stone))
#margin.table(prop.table(my.table, 1:2),2)
prop.table(margin.table(my.table, 1:2),1)

prop.table(my.table[,,2],1) #small
prop.table(my.table[,,1],1) #large

#xtabs(Count~Stone+Success+Treatment,data=my.data) 
prop.table(my.table[1,,],2)
prop.table(my.table[2,,],2)

prop.table(margin.table(my.table, c(3,1)),2)
prop.table(margin.table(my.table, c(1,3)),2)

# Week 4
n <- 100
doone <- function(){ 
  x<-rbinom(1,50,1/6) 
  p<-x/50 
  p 
} 
p.sim<-replicate(n,doone()) 
hist(p.sim,breaks=20)

my.data <- read.csv('Week4/Lab10.csv')
head(my.data)
dim(my.data)
unique(my.data$Genotype)
t.test(my.data[my.data$Genotype == 'BA',]$systolic.bp, my.data[my.data$Genotype == 'BB',]$systolic.bp, paired = FALSE)
plot(density(my.data[my.data$Genotype == 'BA',]$systolic.bp))
lines(density(my.data[my.data$Genotype == 'BB',]$systolic.bp), lty=2)
library(dplyr)
my.data %>% group_by(Genotype) %>% summarise(n=n())

set.seed(1234)
n1 <- sum(my.data$Genotype == 'BA')
my.new.data<-my.data
my.new.data$Genotype<-"BB"
index.temp<-sample(1:50,n1)  
my.new.data$Genotype[index.temp]<-"BA"
new.data1<-my.new.data$systolic.bp[my.new.data$Genotype=="BA"]
new.data2<-my.new.data$systolic.bp[my.new.data$Genotype=="BB"]
t.test(new.data1,new.data2)$statistic

t.stat <-  -2.027
my.t.values <- c()
my.new.data<-my.data
my.new.data$Genotype<-"BB"
dosym <- function(){ 
  index.temp<-sample(1:50,n1)  
  my.new.data$Genotype[index.temp]<-"BA"
  new.data1<-my.new.data$systolic.bp[my.new.data$Genotype=="BA"]
  new.data2<-my.new.data$systolic.bp[my.new.data$Genotype=="BB"]
  my.t.values <- c(my.t.values, t.test(new.data1,new.data2)$statistic)
}
n <- 10000
set.seed(554)
#p.sim <- sum(replicate(n,abs(dosym())) > abs(t.stat)) / n 
#p.sim <- sum(replicate(n,dosym()) < t.stat) / n 
my.t.values <- replicate(n,abs(dosym()))
#p.sim <- mean((1*(my.t.values)^2 > t.stat^2))
p.sim <- mean(abs(my.t.values) > abs(t.stat))
p.sim

library(UsingR)
head(father.son)
lm(sheight~fheight, father.son)

install.packages("R330")
library(R330)
data(wine.df)
head(wine.df)
m <- lm(price~.+h.rain:w.rain, data=wine.df)
summary(m)
drop1(m,test="F")
coef(m)[4]+800*coef(m)[6]
predict(m, newdata = data.frame(year=1985, temp=mean(wine.df$temp), h.rain=mean(wine.df$h.rain), w.rain=mean(wine.df$w.rain))) 
m1 <- lm(log(price)~.+h.rain:w.rain, data=wine.df)
summary(m1)
drop1(m1,test="F")
m2 <-update(m1,~.-h.rain:w.rain)
drop1(m2,test="F")
summary(m2)
exp(predict(m2, newdata = data.frame(year=1985, temp=mean(wine.df$temp), h.rain=mean(wine.df$h.rain), w.rain=mean(wine.df$w.rain))))

par(mfrow=c(1,2)) 
g<-function(x){dnorm(x,sd=sd(m1$res))} 
hist(m1$res,probability=TRUE) 
curve(g,col="red",lwd=3,add=TRUE) 
hist(m2$res,probability=TRUE) 
g<-function(x){dnorm(x,sd=sd(m2$res))} 
curve(g,col="red",lwd=3,add=TRUE)

library(ggplot2)
qplot(hp, qsec, data=mtcars, geom=c("point","smooth"))
hist(airquality$Temp, breaks=10)
qplot(Temp, data=airquality, binwidth=5)
x<-rnorm(1000, mean=-5) 
plot(density(x))
ggplot() + aes(x = x) + geom_density()
qplot(x, geom = "density")

my.data<-data.frame(federal.states=c("Baden-Württemberg","Bayern","Berlin",
                                     "Brandenburg","Bremen","Hamburg","Hessen",
                                     "Mecklenburg-Vorpommern","Niedersachsen",
                                     "Nordrhein-Westfalen","Rheinland-Pfalz",
                                     "Saarland","Sachsen","Sachsen-Anhalt",
                                     "Schleswig-Holstein","Thüringen"), 
                    Population=c(10716644,12691568,3469849,2457872,661888,1762791,
                                 6093888,1599138,7826739,17638098,4011582,989035,4055274,
                                 2235548,2830864,2156759))
str(my.data)
my.data$federal.states<-as.character(my.data$federal.states)
latlon <- geocode(my.data$federal.states)
dim(my.data)
my.data$federal.states[1]<-"Baden-Wurttemberg"
my.data$federal.states[16]<-"Thuringen Germany"
latlon <- geocode(my.data$federal.states)
my.data$lon <- latlon$lon; my.data$lat <- latlon$lat
Germany <- ggmap(get_map(location="Germany",zoom=6), extent="panel")
circle_scale <- 0.000002
Germany + geom_point(aes(x = lon, y = lat),
                      data = my.data,
                      col = "red",
                      alpha = 0.4,
                      size = my.data$Population * circle_scale)
  