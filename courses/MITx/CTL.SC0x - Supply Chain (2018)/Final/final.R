# Problem 1
setwd('C:\\Courses\\Edx\\Current\\MITX Supply Chain\\Final')
df <- read.csv('JJPrinting.txt')
lm(Drying.Time_s~CoatingThickness_mm, df)


# Problem 2


# Problem 3
f = 1/(30-14+1)
4*f
1 - sum(dpois(0:8, lambda = 4.1))
ppois(8, lambda = 4.1, lower.tail = FALSE)

rt <- c(36,41,24,41,36,35,45,38,51,27,41,58,33,50,25,28,44,39,39,34,57,47,29)
length(rt)
mean(rt) - qt(.975, df=length(rt)-1)*sd(rt)
mean(rt) + qt(.975, df=length(rt)-1)*sd(rt)

mean(rt) - qt(.975, df=length(rt)-1)*sd(rt)/sqrt(length(rt))
mean(rt) + qt(.975, df=length(rt)-1)*sd(rt)/sqrt(length(rt))


# Problem 4

df <- read.table('canit.txt', header = TRUE)
mean(df$Revenue)
sd(df$Revenue)

5000/140

1 - sum(dpois(0:3, lambda = 5))
ppois(3, lambda = 5, lower.tail = FALSE)
