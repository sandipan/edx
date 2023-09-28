library(shiny)
library(shinydashboard)
library(tidyverse)

ui <- dashboardPage(
  skin = "purple",
  dashboardHeader(title = "My dashboard"),
  dashboardSidebar(
    sidebarMenu()
  ),
  dashboardBody(
    fluidRow(
      box(title = "Primary:", status = "primary", solidHeader = T, plotOutput("CPlot"), width = 7),
      box(selectInput("myfile3", "Metric:", c("Age",  "Gender", "Department", "Position")), width = 3)
    ),
  )
)


server <- function(input, output){
  
  # plot
  Plot <- reactive({
    p <- ggplot(myfile3, aes(x = .data[[input$myfile3]]))
    if (input$myfile3 == 'Age') {
    #if (class(.data[[input$myfile3]]) == 'numeric') {
      p <- p + geom_histogram(fill="#D55E00", color="#e9ecef", alpha=0.9)
    } else {
      p <- p + geom_bar(fill="#D55E00", color="#e9ecef", alpha=0.9)
    }
    p + labs(
          title = paste0("Distribution of ", paste0(input$myfile3), " employees in workplace"),
          x = req(input$myfile3),
          y = "Count") +
        theme_minimal()
  }) %>% bindEvent(input$myfile3)
  
  output$CPlot <-output$DPlot <-output$EPlot <-output$FPlot <- renderPlot({Plot()})
}

setwd('H:/courses/Edx/Current/MIT Computational/codes')
myfile3 <- read.csv('hr_dashboard_data.csv')

shinyApp(ui = ui, server = server)



print(fig)