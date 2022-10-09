setwd('E:/work')
crime <- read.csv("mvtWeek1.csv", header=TRUE)
head(crime)
dim(crime)
names(crime)
max(crime$ID)
min(crime$Beat)
sum(crime$Arrest)
length(crime$LocationDescription[crime$LocationDescription == 'ALLEY'])
DateConvert = as.Date(strptime(crime$Date, "%m/%d/%y %H:%M"))
summary(DateConvert)
crime$Month = months(DateConvert)
crime$Weekday = weekdays(DateConvert)
crime$Date = DateConvert
min(table(crime$Month))
table(crime[crime$Arrest == TRUE,]$Month)
max(table(crime[crime$Arrest == TRUE,]$Month))
table(crime$Weekday)
max(table(crime$Weekday))
hist(crime$Date, breaks=100)
boxplot(crime[crime$Arrest==TRUE,]$Date)
proportion <- function(crime, year) {
   crimeyear <- crime[crime$Year==year,]
   arrest <- nrow(crimeyear[crimeyear$Arrest==TRUE,])
   total <- nrow(crimeyear)
   print(arrest)
   print(total)
   print(arrest / total)
}
proportion(crime, 2001)
proportion(crime, 2007)
proportion(crime, 2012)
sub <- sort(table(crime$LocationDescription), decreasing=TRUE)[1:6]
top5 <- crime[crime$LocationDescription %in% (names(sub)) & crime$LocationDescription != 'OTHER', ]
nrow(top5)
library(sqldf)
df <- sqldf('SELECT LocationDescription, Arrest, count(*) from top5 group by LocationDescription, Arrest')
#table(top5$LocationDescription, top5$Arrest)
#sort(table(top5$LocationDescription, top5$Arrest))
top5gas <- top5[top5$LocationDescription == 'GAS STATION', ]
sqldf('SELECT Weekday, count(*) from top5gas group by Weekday')
top5res <- top5[top5$LocationDescription == 'DRIVEWAY - RESIDENTIAL', ]
sqldf('SELECT Weekday, count(*) from top5res group by Weekday')



IBM <- read.csv("IBMStock.csv", header=TRUE)
GE <- read.csv("GEStock.csv", header=TRUE)
CocaCola <- read.csv("CocaColaStock.csv", header=TRUE)
ProcterGamble <- read.csv("ProcterGambleStock.csv", header=TRUE)
Boeing <- read.csv("BoeingStock.csv", header=TRUE)
IBM$Date = as.Date(IBM$Date, "%m/%d/%y")
GE$Date = as.Date(GE$Date, "%m/%d/%y")
CocaCola$Date = as.Date(CocaCola$Date, "%m/%d/%y")
ProcterGamble$Date = as.Date(ProcterGamble$Date, "%m/%d/%y")
Boeing$Date = as.Date(Boeing$Date, "%m/%d/%y")
dim(IBM)
min(IBM$Date)
min(GE$Date)
min(CocaCola$Date)
min(ProcterGamble$Date)
min(Boeing$Date)

max(IBM$Date)
max(GE$Date)
max(CocaCola$Date)
max(ProcterGamble$Date)
max(Boeing$Date)

names(IBM)
mean(IBM$StockPrice)
min(GE$StockPrice)
max(CocaCola$StockPrice)
median(Boeing$StockPrice)
sd(ProcterGamble$StockPrice)
plot(CocaCola, type='l', col='red')
#lines(CocaCola)

lines(ProcterGamble$Date, ProcterGamble$StockPrice, col='blue')

abline(v=as.Date(c("2000-03-01")), lwd=2)

abline(v=as.Date(c("1983-03-01")), lwd=2)
plot(CocaCola$Date[301:432], CocaCola$StockPrice[301:432], type="l", col="red", ylim=c(0,210))
lines(IBM$Date[301:432], IBM$StockPrice[301:432], col="black", ylim=c(0,210))
lines(GE$Date[301:432], GE$StockPrice[301:432], col="green", ylim=c(0,210))
lines(ProcterGamble$Date[301:432], ProcterGamble$StockPrice[301:432], col="purple", ylim=c(0,210))
lines(Boeing$Date[301:432], Boeing$StockPrice[301:432], col="blue", ylim=c(0,210))
abline(v=as.Date(c("2000-03-01")), lwd=2)
abline(v=as.Date(c("1997-09-01")), lwd=2)
abline(v=as.Date(c("1997-11-01")), lwd=2)
ma <- tapply(IBM$StockPrice, months(IBM$Date), mean)
a <- mean(IBM$StockPrice)

tapply(GE$StockPrice, months(GE$Date), mean)
tapply(CocaCola$StockPrice, months(CocaCola$Date), mean)

poll <- read.csv("AnonymityPoll.csv", header=TRUE)
head(poll)
summary(poll)
str(poll)
names(poll)
table(poll$Smartphone)
length(poll$Smartphone)
length(poll$Smartphone[is.na(poll$Smartphone)])
length(poll$Smartphone[!is.na(poll$Smartphone) & poll$Smartphone == 1])
length(poll$Smartphone[!is.na(poll$Smartphone) & poll$Smartphone == 0])
table(poll$Sex, poll$Region)
df <- as.data.frame(table(poll$State, poll$Region))
names(df) <- c('State', 'Region', 'Freq')
df[df$Region == 'Midwest' & df$Freq != 0,]
df1<-df[df$Region == 'South',]
df1[order(df1$Freq, decreasing=TRUE),]

nrow(poll[!is.na(poll$Internet.Use) & poll$Internet.Use == 0 & !is.na(poll$Smartphone) & poll$Smartphone == 0,][c('Internet.Use', 'Smartphone')])
nrow(poll[!is.na(poll$Internet.Use) & poll$Internet.Use == 1 & !is.na(poll$Smartphone) & poll$Smartphone == 1,][c('Internet.Use', 'Smartphone')])
nrow(poll[!is.na(poll$Internet.Use) & poll$Internet.Use == 1 & !is.na(poll$Smartphone) & poll$Smartphone == 0,][c('Internet.Use', 'Smartphone')])
nrow(poll[!is.na(poll$Internet.Use) & poll$Internet.Use == 0 & !is.na(poll$Smartphone) & poll$Smartphone == 1,][c('Internet.Use', 'Smartphone')])

nrow(poll[is.na(poll$Internet.Use),][c('Internet.Use')])
nrow(poll[is.na(poll$Smartphone),][c('Smartphone')])

limit <- poll[(!is.na(poll$Internet.Use) & poll$Internet.Use == 1) | (!is.na(poll$Smartphone) & poll$Smartphone == 1),]
nrow(limit)
vars <- names(limit)
for (n in length(vars)) {
	print(paste(vars[n], limit[,n]))
}

vars <- names(limit)
for (n in 1:(length(vars))) {
	#print(paste(vars[n], sum(is.na(limit[,n]))))
	if (sum(is.na(limit[,n])) != 0) {
		print(vars[n])
	}
}

mean(limit$Info.On.Internet)
sum(limit$Info.On.Internet == 0)
length(limit$Info.On.Internet)
sum(limit$Info.On.Internet == 11)

#limit[c('Info.On.Internet', 'Worry.About.Info')]
#limit[limit$Info.On.Internet == 0, ][c('Info.On.Internet', 'Worry.About.Info')]
#limit[limit$Worry.About.Info == 1, ][c('Info.On.Internet', 'Worry.About.Info')]
#n1 <- nrow(limit[!is.na(limit$Worry.About.Info) & limit$Worry.About.Info == 1 & !is.na(limit$Info.On.Internet) & limit$Info.On.Internet != 0, ])
#n2 <- nrow(limit[!is.na(limit$Worry.About.Info) & limit$Worry.About.Info == 1, ])

proportion <- function(limit, x) {
	n1 <- nrow(limit[!is.na(x) & x == 1, ])
	n2 <- nrow(limit[!is.na(x), ])
	print(n1)
	print(n2)
	print(n1 / n2)
}
proportion(limit, limit$Worry.About.Info)
proportion(limit, limit$Anonymity.Possible)
proportion(limit, limit$Tried.Masking.Identity)
proportion(limit, limit$Privacy.Laws.Effective)

hist(limit$Age)
plot(limit$Age, limit$Info.On.Internet)
max(table(limit$Age, limit$Info.On.Internet))
jitter(c(1, 2, 3))
plot(jitter(limit$Age), jitter(limit$Info.On.Internet))

tapply(limit$Info.On.Internet, limit$Smartphone, mean)
limit1 <- limit[!is.na(limit$Tried.Masking.Identity), ]
tapply(limit1$Tried.Masking.Identity, limit1$Smartphone, mean)

CPS <- read.csv("CPSData.csv", header=TRUE)
dim(CPS)
names(CPS)
sort(table(CPS$Industry))
sort(table(CPS$State))
summary(CPS$Citizenship)
table(CPS$Race, CPS$Hispanic)
vars <- names(CPS)
for (n in 1:(length(vars))) {
	if (sum(is.na(CPS[,n])) != 0) {
		print(vars[n])
	}
}
table(CPS$Region, is.na(CPS$Married))
table(CPS$Sex, is.na(CPS$Married))
table(CPS$Age, is.na(CPS$Married))
table(CPS$Citizenship, is.na(CPS$Married))
tbl <- table(CPS$State, is.na(CPS$MetroAreaCode))
head(tbl)
tbl[tbl[,'FALSE'] == 0,]
tbl[tbl[,'TRUE'] == 0,]
tbl <- table(CPS$Region, is.na(CPS$MetroAreaCode))
tbl
sort(tbl[,2] / (tbl[,1] + tbl[,2]))
#tapply(CPS$State, CPS$MetroAreaCode, mean)
min(abs(tbl[,2] / (tbl[,1] + tbl[,2]) - 0.3))

MetroAreaMap <- read.csv("MetroAreaCodes.csv", header=TRUE)
CountryMap <- read.csv("CountryCodes.csv", header=TRUE)
nrow(MetroAreaMap)
nrow(CountryMap)

CPS = merge(CPS, MetroAreaMap, by.x="MetroAreaCode", by.y="Code", all.x=TRUE)
names(CPS)
sum(is.na(CPS$MetroArea))
sort(table(CPS$MetroArea))
CPS1 <- CPS[!is.na(CPS$MetroArea),]
sort(tapply(CPS1$Hispanic, CPS1$MetroArea,  mean))
unique(CPS$Citizenship)
CPS2 <- CPS1[CPS1$Citizenship != 'Non-Citizen', ]
CPS2$Asian <- CPS2$Race == 'Asian'
sort(tapply(CPS2$Asian, CPS2$MetroArea,  mean))

sort(tapply(CPS$Education == "No high school diploma", CPS$MetroArea, mean, na.rm=TRUE))

names(CountryMap)
CPS = merge(CPS, CountryMap, by.x="CountryOfBirthCode", by.y="Code", all.x=TRUE)
head(CPS)
sum(is.na(CPS$Country))
CPS1 <- CPS[!is.na(CPS$Country),]
sort(table(CPS1$Country))
CPS2 <- CPS1[(CPS1$MetroArea == "New York-Northern New Jersey-Long Island, NY-NJ-PA") & !is.na(CPS1$Country), ]
CPS2$UnitedStates <- CPS2$Country == 'United States'
sort(tapply(CPS2$UnitedStates, CPS2$MetroArea,  mean))
#sort(tapply(CPS$MetroArea == "New York-Northern New Jersey-Long Island, NY-NJ-PA" , CPS$Country == 'United States', mean, na.rm=TRUE))

sort(tapply(CPS$Country == "India", CPS$MetroArea, sum, na.rm=TRUE))
sort(tapply(CPS$Country == "Brazil", CPS$MetroArea, sum, na.rm=TRUE))
sort(tapply(CPS$Country == "Somalia", CPS$MetroArea, sum, na.rm=TRUE))

WHO <- read.csv("WHO.csv", header=TRUE)
names(WHO)
summary(WHO)
library(sqldf)
sqldf('select Country, Over60 from WHO order by Over60')
sqldf('select Country, LiteracyRate from WHO order by LiteracyRate')

