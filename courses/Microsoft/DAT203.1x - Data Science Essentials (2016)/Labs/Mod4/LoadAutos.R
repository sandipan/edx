read.auto <- function(path = NULL){
  ## Read the csv file
  filePath <- file.path(path, 'Automobile price data _Raw_.csv')
  auto.price <- read.csv(filePath, header = TRUE, 
                       stringsAsFactors = FALSE)

  ## Coerce some character columns to numeric
  cols <- c('price', 'bore', 'stroke', 
          'horsepower', 'peak.rpm')
  auto.price[, cols] <- lapply(auto.price[, cols], as.numeric)

  ## remove rows with NAs 
  auto.price <- auto.price[complete.cases(auto.price), ]

  ## Add a log transformed column for price
  auto.price$lnprice <- log(auto.price$price)
  
  ## Consolidate the number of cylinders
  auto.price$num.cylinders <- 
    ifelse(auto.price$num.of.cylinders %in% c("four", "three"), "three-four",
           ifelse(auto.price$num.of.cylinders %in% c("five", "six"), "five-six", "eight-twelve"))
  
  auto.price
}


auto.price <- read.auto(path = 'C:/courses/Edx/Current/Microsoft DAT203.1x Data Science Essentials/MicrosoftLearning-Data-Science-Essentials-91ddbff/Labs/Mod4/')
str(auto.price)