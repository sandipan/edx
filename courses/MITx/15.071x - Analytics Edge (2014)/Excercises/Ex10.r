setwd("C:/Users/SANDIPAN DEY/Desktop/Edx")
library(Rglpk)

#Profitability = 39.05 - 5.41*(State Population per Inn) + 5.86*(Price of the Inn) - 3.09*(Square Root of the Median Income of the Area) + 1.75*(College Students in the Area)
Profitability = 39.05 - 5.41*(-1) + 5.86*(-0.3) - 3.09*(-0.81) + 1.75*(-0.54)
hotels <- read.csv("hotel.csv")
names(hotels)
Profitability <- 39.05 - 5.41*hotels$StatePopulationPerInn.normalized + 5.86*hotels$Price.normalized - 3.09*hotels$SquareRootofMedianIncome.normalized + 1.75*hotels$CollegeStudentsinArea.normalized
which.max(Profitability)
which.min(Profitability)
hotels$Profitability <- Profitability
hotels[order(hotels$Profitability, decreasing=TRUE),]

obj <- hotels$Profitability
mat <- matrix(hotels$Price, nrow=1, byrow=TRUE)
dir <- c("<=")
rhs <- c(10000000)
max <- TRUE #maximize
types <- rep("B", 16)
sol <- Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)
hotels$selected <- sol$solution
hotels[hotels$selected == 1,]

mat <- matrix(c(hotels$Price, c(rep(0,9), rep(1,7))), nrow=2, byrow=TRUE)
dir <- c("<=", "<=")
rhs <- c(10000000, 2)
max <- TRUE #maximize
types <- rep("B", 16)
sol <- Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)
sol
hotels$selected <- sol$solution
hotels[hotels$selected == 1,]

d <-  c(16.16,19,25.29,0,3.07,1.22,2.8,2.87,3.8,12.35,11.11,21.99,8.82,7.93,9.34,8.31,7.31,7.55,11.13,17.49,11.03,36.12,
		24.08,26.47,32.49,7.93,6.44,7.51,10.31,5.07,8.01,4.52,3.48,22.02,3.3,0,2.25,2.07,2.44,0.75,18.41,23.44,18.93,43.75,
		24.32,27.24,33.42,8.31,7.56,8.19,10.95,5.67,7.41,4.35,2.97,24.07,5.36,2.07,1.11,0,1.11,1.53,19.26,24.76,19.28,44.43,
		21.12,17.33,12.25,36.12,37.37,36.29,33.5,38.8,38.16,48.27,47.14,39.86,43.31,43.75,45.43,44.43,43.43,43.52,25.4,23.21,25.43,0)
I <- c(0.1609,0.1164,0.1026,0.1516,0.0939,0.132,0.0687,0.093,0.2116,0.2529,0.0868,0.0828,0.0975,0.8177,0.4115,0.3795,0.071,0.0427,0.1043,0.0997,0.1698,0.2531)
N <-  c(1,1,1,0,0,0,0,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,
		1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,
		1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,0,0,0,1,1,1,1,
		0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0)
#x1 <- rep(0, 22)
#for (i in c(4, 5, 6, 7, 8, 15)) { x1[i] <- 1}
#x2 <- rep(0, 22)
#for (i in c(10, 11, 12, 13, 14)) {	x2[i] <- 1}
#x3 <- rep(0, 22)
#for (i in c(9, 16, 17, 18)) { x3[i] <- 1}
#x4 <- rep(0, 22)
#for (i in c(1, 2, 3, 19, 20, 21, 22)) { x4[i] <- 1}
#x <- c(x1, x2, x3, x4)

obj <- d
c1 <- cbind(diag(22), diag(22), diag(22), diag(22))
c2 <- matrix(c(c(I, rep(0, 66)), c(rep(0, 22), I, rep(0, 44)), c(rep(0, 44), I, rep(0, 22)), c(rep(0, 66), I)), nrow=4, byrow=TRUE)
c2 <- rbind(c2, c2)
c3 <- matrix(c(c(N[1:22], rep(0, 66)), c(rep(0, 22), N[23:44], rep(0, 44)), c(rep(0, 44), N[45:66], rep(0, 22)), c(rep(0, 66), N[67:88])), nrow=4, byrow=TRUE)

mat <- rbind(c1, c2, c3)
dir <- c(rep("==", 22), rep("<=", 4), rep(">=", 4), rep("<=", 4))
r1 <- rep(1, 22)
r2 <- c(rep(1.2, 4), rep(0.8, 4))
r3 <- c(rep(2, 4))
rhs <- c(r1, r2, r3)
max <- FALSE #minimize
types <- rep("B", 88)
sol <- Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)
soln <- as.data.frame(matrix(sol$solution, nrow=4, byrow=TRUE))
rownames(soln) <- c("SR1", "SR2", "SR3", "SR4")
names(soln) <- 1:22
soln
SR1 <- soln[1,]
sum(SR1*I)

r2 <- c(rep(1.1, 4), rep(0.9, 4))
rhs <- c(r1, r2, r3)
sol1 <- Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)
sol1$optimum

r3 <- c(rep(3, 4))
rhs <- c(r1, r2, r3)
sol2 <- Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)
sol2$optimum

r2 <- c(rep(1.3, 4), rep(0.7, 4))
r3 <- c(rep(1, 4))
rhs <- c(r1, r2, r3)
sol3 <- Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)
sol3$optimum


# xij: student i assigned to class j
pc1 <- c(1,1,2,1,1,2,1,2,1,1,1,2,1,1,1,2,1,1,1,1,2,1,2,1,2,2,2,1,2,1,2,1,2,1,2,2,1,2,2,2)
pc2 <- c(2,2,1,2,2,1,2,1,2,2,2,1,2,2,2,1,2,2,2,2,1,2,1,2,1,1,1,2,1,2,1,2,1,2,1,1,2,1,1,1)
#zij <- c(1*(pc1==1), 2*(pc2==2))
#zij <- c(1*(pc1==1), 1*(pc2==2))
zij <- c(pc1, pc2)
obj <- zij
c1 <- cbind(diag(40), diag(40))
c2 <- matrix(c(c(rep(1, 40), rep(0, 40)), c(rep(0, 40), rep(1, 40))), nrow=2, byrow=TRUE)
mat <- rbind(c1, c2)
rhs <- c(rep(1, 40), 20, 20)
dir <- rep("==", 42)
max <- FALSE #TRUE
types <- rep("B", 40)
sol <- Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)
sol
soln <- as.data.frame(matrix(sol$solution, nrow=2, byrow=TRUE))
soln <- rbind(soln, male)
rownames(soln) <- c("Class1", "Class2", "Gender")
names(soln) <- 1:40
soln
esoln <- as.data.frame(matrix(c(2-pc1, 2-pc2), nrow=2, byrow=TRUE))
esoln <- rbind(esoln, male)
rownames(esoln) <- c("Class1", "Class2", "Gender")
names(esoln) <- 1:40
esoln
esoln[esoln$Class1 == 2,] <- 0
esoln[esoln$Class2 == 2,] <- 0
sum(soln[1,] == esoln[1,])

male <- c('M','M','M','M','M','M','M','M','M','M','M','M','M','M','M','M','M','M','M','M','M','M','M','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F')
c3 <- matrix(c(c(1*(male == 'M'), rep(0,40)), c(rep(0,40), 1*(male == 'M'))), nrow=2, byrow=TRUE)
mat <- rbind(c1, c2, c3)
rhs <- c(rep(1, 40), 20, 20, 12, 12)
dir <- c(rep("==", 42), c("<=", "<="))
max <- FALSE
types <- rep("B", 80)
sol <- Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)
sol
soln <- as.data.frame(matrix(sol$solution, nrow=2, byrow=TRUE))
soln <- rbind(soln, male)
rownames(soln) <- c("Class1", "Class2", "Gender")
names(soln) <- 1:40
soln
sum(soln[1,] == esoln[1,])
#soln <- as.data.frame(t(soln))
#soln
#nrow(soln[soln$Class1 == 1 & soln$Gender == 'M',])
#nrow(soln[soln$Class2 == 1 & soln$Gender == 'M',])

esoln <- as.data.frame(matrix(zij, nrow=2, byrow=TRUE))
esoln <- rbind(esoln, male)
rownames(esoln) <- c("Class1", "Class2", "Gender")
names(esoln) <- 1:40
esoln

c4 <- matrix(c(c(rep(0,9),1,1,rep(0,69)),c(rep(0,49),1,1,rep(0,29))), nrow=2, byrow=TRUE)
mat <- rbind(c1, c2, c3, c4)
rhs <- c(rep(1, 40), 20, 20, 12, 12, 1, 1)
dir <- c(rep("==", 42), c("<=", "<=", "==", "=="))
max <- FALSE
types <- rep("B", 80)
sol <- Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)
sol
soln <- as.data.frame(matrix(sol$solution, nrow=2, byrow=TRUE))
soln <- rbind(soln, male)
rownames(soln) <- c("Class1", "Class2", "Gender")
names(soln) <- 1:40
soln
sum(soln[1,] == esoln[1,])

nbr1 <- rep(0,80)
nbr1[c(4,9,15,25,30,36)] <- 1
nbr2 <- rep(0,80)
nbr2[c(44,49,55,65,70,76)] <- 1
c5 <- matrix(c(nbr1, nbr2), nrow=2, byrow=TRUE)
mat <- rbind(c1, c2, c3, c4, c5)
rhs <- c(rep(1, 40), 20, 20, 12, 12, 1, 1, 2, 2)
dir <- c(rep("==", 42), c("<=", "<=", "==", "==", ">=", ">="))
max <- FALSE
types <- rep("B", 80)
sol <- Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)
sol
soln <- as.data.frame(matrix(sol$solution, nrow=2, byrow=TRUE))
soln <- rbind(soln, male)
rownames(soln) <- c("Class1", "Class2", "Gender")
names(soln) <- 1:40
soln
sum(soln[1,] == esoln[1,])

c6 <- matrix(c(c(rep(0, 19), 1, -1, rep(0, 59)), c(rep(0, 59), 1, -1, rep(0, 19)), c(1, rep(0, 79)), c(rep(0, 39), 1, rep(0, 40))), nrow=4, byrow=TRUE)
mat <- rbind(c1, c2, c3, c4, c5, c6)
rhs <- c(rep(1, 40), 20, 20, 12, 12, 1, 1, 2, 2, 0, 0, 0, 0)
dir <- c(rep("==", 42), c("<=", "<=", "==", "==", ">=", ">=", "==", "==", "==", "=="))
max <- FALSE
types <- rep("B", 80)
sol <- Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)
sol
soln <- as.data.frame(matrix(sol$solution, nrow=2, byrow=TRUE))
soln <- rbind(soln, male)
rownames(soln) <- c("Class1", "Class2", "Gender")
names(soln) <- 1:40
soln
sum(soln[1,] == esoln[1,])

read.csv("EvenStarFarm.csv")

## R1..8 C1..8 F1..8 : #cases of 8 produces to sell through 3 channels
# max 40*R1 + 26*R2 + .. + 36*R8 + 36*C1 + 36*C2 + .. + 36*C8 + 38.25*F1 + 34*F2 + .. + 36*F8 - 214.40*(R1+R2+..+R8)/119 - 31.68*(36*C1+36*C2+..+36*C8)/400 - 0 - 1,495.50*R - 730.50*C - 5,833.50*F 
# max  37.97983*R1 + 23.97983*R2 + .. + 33.97983*R8 + 35.9208*C1 + 35.9208*C2 + ... + 35.9208*C8 + 38.25*F1 + 34.00*F2 + ... + 36.00*F8  - 1,495.50*R - 730.50*C - 5,833.50*F 
# s.t.
# R1 + C1 + F1 <= 406
# R2 + C2 + F2 <= 608
# R3 + C3 + F3 <= 167
# R4 + C4 + F4 <= 76
# R5 + C5 + F5 <= 72
# R6 + C6 + F6 <= 251
# R7 + C7 + F7 <= 107
# R8 + C8 + F8 <= 133
# F1 + F2 + .. + F8 <= 600
# (R1 + R2 + .. + R8) / 119 <= 20
# (36*C1+36*C2+..+36*C8)/400 <= 90
# R1 + R2 + .. + R8 <= 1820 * R
# C1 + C2 + .. + C8 <= 1820 * C
# F1 + F2 + .. + F8 <= 1820 * F

obj <- c(c(40.00, 26.00, 20.00, 24.00, 18.00, 24.00, 36.00, 36.00) - 214.40/119,
		(1 - 31.68 / 400) * c(36.00, 36.00, 20.00, 36.00, 24.00, 24.00, 36.00, 36.00),
		 38.25,34.00,20.25,34.00,21.25,25.20,36.00,36.00,
		- 1495.50, - 730.50, - 5833.50)

mat <- matrix(c(1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0,
				1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0.09, 0.09, 0.05, 0.09, 0.06, 0.06, 0.09, 0.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1), nrow = 14, byrow=TRUE)

dir <- c("<=", "<=", "<=", "<=", "<=", "<=", "<=", "<=", "<=", "<=", "<=", "==", "==", "==")
rhs <- c(406, 608, 167, 76, 72, 251, 107, 133, 600, 119*20, 90, 1, 1, 1)
max <- TRUE
types <- c(rep("C", 24), rep("B", 3))
sol <- Rglpk_solve_LP(obj, mat, dir, rhs, types=types, max = max)
sol

mat <- matrix(c(1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0,
				1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0.09, 0.09, 0.05, 0.09, 0.06, 0.06, 0.09, 0.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1820, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1820, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, -1820), nrow = 14, byrow=TRUE)

dir <- c("<=", "<=", "<=", "<=", "<=", "<=", "<=", "<=", "<=", "<=", "<=", "<=", "<=", "<=")
rhs <- c(406, 608, 167, 76, 72, 251, 107, 133, 600, 119*20, 90, 0, 0, 0)
max <- TRUE
types <- c(rep("C", 24), rep("B", 3))
sol1 <- Rglpk_solve_LP(obj, mat, dir, rhs, types=types, max = max)
sol1
sol
sol1$optimum - sol$optimum
sum(sol1$solution[1:24])
sum(sol1$solution[1:8])

obj <- c(c(40.00, 26.00, 20.00, 24.00, 18.00, 24.00, 36.00, 36.00) - 214.40/119,
		(1 - 31.68 / 400) * c(36.00, 36.00, 20.00, 36.00, 24.00, 24.00, 36.00, 36.00),
		1.1* c(38.25,34.00,20.25,34.00,21.25,25.20,36.00,36.00),
		- 1495.50, - 730.50, - 5833.50)
sol2 <- Rglpk_solve_LP(obj, mat, dir, rhs, types=types, max = max)
sol2

obj <- c(c(40.00, 26.00, 20.00, 24.00, 18.00, 24.00, 36.00, 36.00) - 214.40/119,
		(1 - 31.68 / 400) * c(36.00, 36.00, 20.00, 36.00, 24.00, 24.00, 36.00, 36.00),
		1.25* c(38.25,34.00,20.25,34.00,21.25,25.20,36.00,36.00),
		-1495.50, -730.50, -5833.50)
sol3 <- Rglpk_solve_LP(obj, mat, dir, rhs, types=types, max = max)
sol3
soln <- as.data.frame(matrix(sol3$solution[1:24], nrow=3, byrow=TRUE))
rownames(soln) <- c("Restaurant", "CSA", "Farmer")
names(soln) <- c("Tomatoes (large)","Tomatoes (small)","Watermelon","Okra","Basil","Cucumbers","Sweet Potatoes","Winter Squash")
soln
sol6 <- Rglpk_solve_LP(obj, mat, dir, rhs, types=c(rep("I", 24), rep("B", 3)), max = max)
sol6


obj <- c(c(40.00, 26.00, 20.00, 24.00, 18.00, 24.00, 36.00, 36.00) - 214.40/119,
		(1 - 31.68 / 400) * c(36.00, 36.00, 20.00, 36.00, 24.00, 24.00, 36.00, 36.00),
		c(38.25,34.00,20.25,34.00,21.25,25.20,36.00,36.00),
		-1495.50, -730.50, -5000)
sol4 <- Rglpk_solve_LP(obj, mat, dir, rhs, types=types, max = max)
sol4

obj <- c(c(40.00, 26.00, 20.00, 24.00, 18.00, 24.00, 36.00, 36.00) - 214.40/119,
		(1 - 31.68 / 400) * c(36.00, 36.00, 20.00, 36.00, 24.00, 24.00, 36.00, 36.00),
		c(38.25,34.00,20.25,34.00,21.25,25.20,36.00,36.00),
		-1495.50, -730.50, -3000)
sol5 <- Rglpk_solve_LP(obj, mat, dir, rhs, types=types, max = max)
sol5

