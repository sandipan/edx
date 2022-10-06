# Assign a variable 'n' as the number of remaining games.
n <- 6

# Assign a variable 'l' to a list of possible game outcomes, where 0 indicates a loss and 1 indicates a win for the Cavs. 
l <- list(0:1)

# Create a data frame named 'possibilities' that contains all possible outcomes for the remaining games.
possibilities <- expand.grid(rep(l,n))

# Create a vector named 'results' that indicates whether each row in the data frame 'possibilities' contains enough wins for the Cavs to win the series.
results <- sum(rowSums(possibilities) >= 4) / nrow(possibilities)
print(results)

# Calculate the proportion of 'results' in which the Cavs win the series. Print the outcome to the console.


# Monte Carlo

# The variable `B` specifies the number of times we want the simulation to run. Let's run the Monte Carlo simulation 10,000 times.
B <- 10000

# Use the `set.seed` function to make sure your answer matches the expected result after random sampling.
set.seed(1)

# Create an object called `results` that replicates the sample code for `B` iterations and tallies the number of simulated series that contain at least four wins for the Cavs.
results <- mean(replicate(B, sum(runif(6) > 0.5))>=4)
print(results)


# Calculate the frequency out of `B` iterations that the Cavs won at least four games in the remainder of the series. Print your answer to the console.


# Let's assign the variable 'p' as the vector of probabilities that team A will win.
p <- seq(0.5, 0.95, 0.025)

# Given a value 'p', the probability of winning the series for the underdog team B can be computed with the following function based on a Monte Carlo simulation:
prob_win <- function(p){
  B <- 10000
  result <- replicate(B, {
    b_win <- sample(c(1,0), 7, replace = TRUE, prob = c(1-p, p))
    sum(b_win)>=4
    })
  mean(result)
}

# Apply the 'prob_win' function across the vector of probabilities that team A will win to determine the probability that team B will win. Call this object 'Pr'.
Pr <- sapply(p, prob_win)

# Plot the probability 'p' on the x-axis and 'Pr' on the x-axis.
plot(p, Pr)

# Given a value 'p', the probability of winning the series for the underdog team B can be computed with the following function based on a Monte Carlo simulation:
prob_win <- function(N, p=0.75){
      B <- 10000
      result <- replicate(B, {
        b_win <- sample(c(1,0), N, replace = TRUE, prob = c(1-p, p))
        sum(b_win)>=(N+1)/2
        })
      mean(result)
    }

# Assign the variable 'N' as the vector of series lengths. Use only odd numbers ranging from 1 to 25 games.
N <- seq(1, 25, 2)

# Apply the 'prob_win' function across the vector of series lengths to determine the probability that team B will win. Call this object `Pr`.
Pr <- sapply(N, prob_win)

# Plot the number of games in the series 'N' on the x-axis and 'Pr' on the x-axis.
plot(N, Pr)


# Use the `set.seed` function to make sure your answer matches the expected result after random sampling.
set.seed(1)

# The variables 'green', 'black', and 'red' contain the number of pockets for each color
green <- 2
black <- 18
red <- 18

# Assign a variable `p_green` as the probability of the ball landing in a green pocket
p_green <- green / (green+black+red)

# Assign a variable `p_not_green` as the probability of the ball not landing in a green pocket
p_not_green <- 1 - p_green

#Create a model to predict the random variable `X`, your winnings from betting on green.
X <- sample(c(17,-1), 1, prob=c(p_green, p_not_green))

# Print the value of `X` to the console
print(X)

# Calculate the expected outcome if you win $17 if the ball lands on green and you lose $1 if the ball doesn't land on green
sum(c(17,-1)*c(p_green, p_not_green))

# Use the `set.seed` function to make sure your answer matches the expected result after random sampling
set.seed(1)

# Define the number of bets using the variable 'n'
n <- 1000

# Create a vector called 'X' that contains the outcomes of 1000 samples
X <- sample(c(17,-1), 1000, prob=c(p_green, p_not_green), replace=TRUE)

# Assign the sum of all 1000 outcomes to the variable 'S'
S <- sum(X)


# Print the value of 'S' to the console
S

# Calculate the expected outcome of 1,000 spins if you win $17 when the ball lands on green and you lose $1 when the ball doesn't land on green
1000*(17*p_green-1*p_not_green)


# The variables 'green', 'black', and 'red' contain the number of pockets for each color
green <- 2
black <- 18
red <- 18

# Assign a variable `p_green` as the probability of the ball landing in a green pocket
p_green <- green / (green+black+red)

# Assign a variable `p_not_green` as the probability of the ball not landing in a green pocket
p_not_green <- 1-p_green

# Compute the standard error of the random variable
(17-(-1))*sqrt(p_green*p_not_green)
#X <- sample(c(17,-1), 38, prob=c(p_green, p_not_green), replace=TRUE)
#sqrt(sum((X-mean(X))^2)/38)
#sd(X)
#EX <- sum(c(17,-1)*c(p_green, p_not_green))
#EX2 <- sum(c(17,-1)^2*c(p_green, p_not_green))
#sqrt(EX2-EX^2)
#sqrt(p_green*p_not_green)



# Assign a variable `p_green` as the probability of the ball landing in a green pocket
p_green <- 2 / 38

# Assign a variable `p_not_green` as the probability of the ball not landing in a green pocket
p_not_green <- 1-p_green

# Define the number of bets using the variable 'n'
n <- 100

# Calculate 'avg', the expected outcome of 100 spins if you win $17 when the ball lands on green and you lose $1 when the ball doesn't land on green
avg <- n * (17*p_green + -1*p_not_green)

# Compute 'se', the standard error of the sum of 100 outcomes
se <- sqrt(n) * (17 - -1)*sqrt(p_green*p_not_green)

# Using the expected value 'avg' and standard error 'se', compute the probability that you win money betting on green 100 times.
pnorm(0, avg, se, lower.tail=FALSE)


# Assign a variable `p_green` as the probability of the ball landing in a green pocket
p_green <- 2 / 38

# Assign a variable `p_not_green` as the probability of the ball not landing in a green pocket
p_not_green <- 1-p_green

# Define the number of bets using the variable 'n'
n <- 100

# The variable `B` specifies the number of times we want the simulation to run. Let's run the Monte Carlo simulation 10,000 times.
B <- 10000

# Use the `set.seed` function to make sure your answer matches the expected result after random sampling.
set.seed(1)

# Create an object called `S` that replicates the sample code for `B` iterations and sums the outcomes.
S <- replicate(B, sum(sample(c(17,-1), 100, prob=c(p_green, p_not_green), replace=TRUE)))

# Compute the average value for 'S'
mean(S)

# Calculate the standard deviation of 'S'
sd(S)

# Calculate the proportion of outcomes in the vector `S` that exceed $0
mean(S>0)


# Create a vector called `X` that contains the outcomes of `n` bets
X <- sample(c(17,-1), n, prob=c(p_green, p_not_green), replace=TRUE)

# Define a variable `Y` that contains the mean outcome per bet. Print this mean to the console.
Y <- mean(X)
Y

# Compute the standard error of 'Y', the mean outcome per bet from 10,000 bets.
(17 - -1)*sqrt(p_green*p_not_green) / sqrt(n)

# We defined the average using the following code
avg <- 17*p_green + -1*p_not_green

# We defined standard error using this equation
se <- 1/sqrt(n) * (17 - -1)*sqrt(p_green*p_not_green)

# Given this average and standard error, determine the probability of winning more than $0. Print the result to the console.
pnorm(0, avg, se, lower.tail=FALSE)


# The variable `n` specifies the number of independent bets on green
n <- 10000

# The variable `B` specifies the number of times we want the simulation to run
B <- 10000

# Use the `set.seed` function to make sure your answer matches the expected result after random number generation
set.seed(1)

# Generate a vector `S` that contains the the average outcomes of 10,000 bets modeled 10,000 times
S <- replicate(B, mean(sample(c(17,-1), n, prob=c(p_green, p_not_green), replace=TRUE)))


# Compute the average of `S`
mean(S)

# Compute the standard deviation of 'S'
sd(S)

# Compute the proportion of outcomes in the vector 'S' where you won more than $0
mean(S > 0)




# Assign the number of loans to the variable `n`
n <- 10000

# Assign the loss per foreclosure to the variable `loss_per_foreclosure`
loss_per_foreclosure <- -200000

# Assign the probability of default to the variable `p_default`
p_default <- 0.03

# Use the `set.seed` function to make sure your answer matches the expected result after random sampling
set.seed(1)

# The variable `B` specifies the number of times we want the simulation to run
B <- 10000

# Generate a list of summed losses 'S'. Replicate the code from the previous exercise over 'B' iterations to generate a list of summed losses for 'n' loans
S <- replicate(B, {
defaults <- sample(c(0,1), n, prob=c(1-p_default, p_default), replace=TRUE)
S <- loss_per_foreclosure*sum(defaults)
S  
})

# Plot a histogram of 'S'
hist(S)


# Assign the number of loans to the variable `n`
n <- 10000

# Assign the loss per foreclosure to the variable `loss_per_foreclosure`
loss_per_foreclosure <- -200000

# Assign the probability of default to the variable `p_default`
p_default <- 0.03

# Calcualte the expected loss due to default out of 10,000 loans
n*(p_default*loss_per_foreclosure + (1-p_default)*0)

# Compute the standard error of the sum of 10,000 loans
sqrt(n)*abs(loss_per_foreclosure)*sqrt(p_default*(1-p_default))


# Assign the loss per foreclosure to the variable `loss_per_foreclosure`
loss_per_foreclosure <- -200000

# Assign the probability of default to the variable `p_default`
p_default <- 0.03

# Assign a variable `x` as the total amount necessary to have an expected outcome of $0
x <- (p_default*abs(loss_per_foreclosure)) / (1 - p_default)


# Convert `x` to a rate, given that the loan amount is $180,000. Print this value to the console.
x / 180000


# Assign the number of loans to the variable `n`
n <- 10000

# Assign the loss per foreclosure to the variable `loss_per_foreclosure`
loss_per_foreclosure <- -200000

# Assign the probability of default to the variable `p_default`
p_default <- 0.03

# Generate a variable `z` using the `qnorm` function
z = qnorm(0.05)

# Generate a variable `x` using `z`, `p_default`, `loss_per_foreclosure`, and `n`
p = p_default
q = 1 - p
l = abs(loss_per_foreclosure)
x = -l*(z*sqrt(n*p*q)-p*n)/(z*sqrt(n*p*q)+q*n)

# Convert `x` to an interest rate, given that the loan amount is $180,000. Print this value to the console.
x / 180000


