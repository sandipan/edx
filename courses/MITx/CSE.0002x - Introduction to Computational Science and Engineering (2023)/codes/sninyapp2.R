library(tibble, dplyr, tidyverse)

test_data <- tibble(A = c(1,2), B = c("A", "C"), C = c("f", "m"))

myfunction <- function(mydata, ...) {
  mydata %>% 
    left_join(mydata, by = ...)
}

myfunction(test_data, B, C)
shinyApp(ui, server)