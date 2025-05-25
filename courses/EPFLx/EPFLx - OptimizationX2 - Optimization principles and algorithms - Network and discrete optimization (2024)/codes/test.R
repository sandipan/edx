library(linprog)

# OF, OL, FL, LF, FS, LS
## Production activities
cvec <- c(36, 28, 50, 50, 83, 71) # gross margins
names(cvec) <- c("OF", "OL", "FL", "LF", "FS", "LS")
## Constraints (quasi-fix factors)
bvec <- c(1, 1, 0, 0) # endowment
names(bvec) <- c("O", "S", "F", "L")
## Needs of Production activities
Amat <- rbind(c(1, 1, 0, 0, 0, 0),
              c(0, 0, 0, 0, 1, 1),
              c(-1, 0, 1, -1, 1, 0),
              c(0, -1, -1, 1, 0, 1))

## Maximize the gross margin
res <- solveLP(cvec, bvec, Amat, const.dir = rep( "==", length( bvec ) ), lpSolve = TRUE)
## print the results
print( res )

# PL, PE, LE, LB, EB, BP
cvec <- c(0, 0, 0, 0, 0, -1) # gross margins
names(cvec) <- c("PL", "PE", "LE", "LB", "EB", "BP")
## Constraints (quasi-fix factors)
bvec <- c(0, 0, 0, 0, 14, 8, 4, 6, 10) # endowment
names(bvec) <- c("P", "L", "E", "B", "PL", "PE", "LE", "LB", "EB")
## Needs of Production activities
Amat <- rbind(c(1, 1, 0, 0, 0, -1),
              c(-1, 0, 1, 1, 0, 0),
              c(0, 1, 1, 0, -1, 0),
              c(0, 0, 0, 1, 1, -1),
              c(1, 0, 0, 0, 0, 0),
              c(0, 1, 0, 0, 0, 0),
              c(0, 0, 1, 0, 0, 0),
              c(0, 0, 0, 1, 0, 0),
              c(0, 0, 0, 0, 1, 0))

## Maximize the gross margin
res <- solveLP(cvec, bvec, Amat, const.dir = c(rep( "==", 4), rep( "<=", 5)), lpSolve = TRUE)
## print the results
print( res )


# AN, AS, LN, LS, CN, CS
## Production activities
cvec <- c(8, 4, 6, 12, 7, 1) # gross margins
names(cvec) <- c("AN", "AS", "LN", "LS", "CN", "CS")
## Constraints (quasi-fix factors)
bvec <- c(1927, 605, 303, 1890, 945) # endowment
names(bvec) <- c("N", "S", "A", "L", "C")
## Needs of Production activities
Amat <- rbind(c(1, 1, 0, 0, 0, 0),
              c(0, 0, 1, 1, 0, 0),
              c(0, 0, 0, 0, 1, 1),
              c(1, 0, 1, 0, 1, 0),
              c(0, 1, 0, 1, 0, 1))

## Maximize the gross margin
res <- solveLP(cvec, bvec, Amat, const.dir = rep( "==", length( bvec ) ), lpSolve = TRUE)
## print the results
print( res )


# FF, FS, AF, AS
## Production activities
cvec <- c(92, 49, 92, 68) # gross margins
names(cvec) <- c("FF", "FS", "AF", "AS")
## Constraints (quasi-fix factors)
bvec <- rep(1, 8) # endowment
names(bvec) <- c("F", "A", "F", "S", "FF", "FS", "AF", "AS")
## Needs of Production activities
Amat <- rbind(c(1, 1, 0, 0),
              c(0, 0, 1, 1),
              c(1, 0, 1, 0),
              c(0, 1, 0, 1),
              c(1, 0, 0, 0),
              c(0, 1, 0, 0),
              c(0, 0, 1, 0),
              c(0, 0, 0, 1))

## Maximize the gross margin
res <- solveLP(cvec, bvec, Amat, const.dir = c(rep( "==", 4), rep("<=", 4)), lpSolve = TRUE)
## print the results
print( res )

# FF, FS, AF, AS
## Production activities
cvec <- c(92, 49, 92, 68) # gross margins
names(cvec) <- c("FF", "FS", "AF", "AS")
## Constraints (quasi-fix factors)
bvec <- rep(1, 8) # endowment
names(bvec) <- c("F", "A", "F", "S", "FF", "FS", "AF", "AS")
## Needs of Production activities
Amat <- rbind(c(1, 1, 0, 0),
              c(0, 0, 1, 1),
              c(1, 0, 1, 0),
              c(0, 1, 0, 1),
              c(1, 0, 0, 0),
              c(0, 1, 0, 0),
              c(0, 0, 1, 0),
              c(0, 0, 0, 1))

## Maximize the gross margin
res <- solveLP(cvec, bvec, Amat, const.dir = c(rep( "==", 4), rep("<=", 4)), lpSolve = TRUE)
## print the results
print( res )

#library(Rglpk)
#obj <- rep(0, 9)
#mat <- rbind(rbind(rep(1,8),
#             c(rep(1, 7), 0),
#             c(c(1, 0, 1, 0, 0, 0, 0), 0),
#             c(c(0, 1, 0, -1, 0, 0, 0), 0),
#             c(c(1, 0, 0, 0, 0, -1, 0), rep(0,2)),
#             c(rep(0,7), rep(1,1)),
#             c(1,1,1,0,0,0,0,-1,0),
#             c(0,1,0,1,1,1,0,-1,0)),
#             cbind(diag(7),matrix(rep(0,2*7), ncol=2)))
                
#dir <- c("<", ">", "<=", "<=", "==", ">=", "==", "==",
#         rep("<=", 7))
#rhs <- c(7, 1, 1, 0, 0, 1, 0, 0, rep(1, 7))
#types <- rep("I", 9)
#max <- TRUE
#Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)


# knapsack
library(Rglpk)
obj <- c(1,4,5,7)
mat <- rbind(c(1,3,4,5), diag(4))

dir <- rep("<=", 5)
rhs <- c(7, rep(1, 4))
types <- rep("I", 4)
max <- TRUE
Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)


# set cover
library(Rglpk)
obj <- c(1,1,1,1)
mat <- rbind(c(1,0,0,1), #C
             c(1,1,1,0), #C++
             c(0,1,0,1), #Java
             c(0,0,1,0), #Python
             c(0,0,1,0))  #Ruby
dir <- rep(">=", 5)
rhs <- rep(1, 5)
types <- rep("I", 4)
max <- FALSE
Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)


# TSP





# BB

# P
cvec <- c(-13, -8) 
bvec <- c(10, 20)
Amat <- rbind(c(1, 2),
              c(5, 2))
res <- solveLP(cvec, bvec, Amat, const.dir = rep( "<=", length( bvec )), lpSolve = TRUE)
print( res )

# P1
cvec <- c(-13, -8) 
bvec <- c(10, 20, 2)
Amat <- rbind(c(1, 2),
              c(5, 2),
              c(1, 0))
res <- solveLP(cvec, bvec, Amat, const.dir = rep( "<=", length( bvec )), lpSolve = TRUE)
print( res )

# P2
cvec <- c(-13, -8) 
bvec <- c(10, 20, 3)
Amat <- rbind(c(1, 2),
              c(5, 2),
              c(1, 0))
res <- solveLP(cvec, bvec, Amat, const.dir = c(rep( "<=", 2), ">="), lpSolve = TRUE)
print( res )

# P12
cvec <- c(-13, -8) 
bvec <- c(10, 20, 3, 2)
Amat <- rbind(c(1, 2),
              c(5, 2),
              c(1, 0),
              c(0, 1))
res <- solveLP(cvec, bvec, Amat, const.dir = c(rep( "<=", 2), ">=", "<="), lpSolve = TRUE)
print( res )

# P22
cvec <- c(-13, -8) 
bvec <- c(10, 20, 3, 3)
Amat <- rbind(c(1, 2),
              c(5, 2),
              c(1, 0),
              c(0, 1))
res <- solveLP(cvec, bvec, Amat, const.dir = c(rep( "<=", 2), rep(">=", 2)), lpSolve = TRUE)
print( res )

