library(shiny)
library(tidyverse)


ui <- fluidPage(
  
  plotOutput("example")
  
)


server <- function(input, output) {
  output$example <- renderPlot({
    mtcars %>%
      ggplot(
        aes(
          x = wt,
          y = mpg,
          color = cyl
        )
      ) +
      geom_point() +
      labs(
        x = social_caption #paste0("WT", icon("arrow-right")) %>% htmltools::HTML()
      )
  })
  
}

library(ggtext)
social_caption <- glue::glue(
  "<span style='font-family:\"Font Awesome 6 Brands\";'>{\"&#xf09b\"};</span>
  <span style='color: #E30B5C'>{\"test\"}</span>"
)
shinyApp(ui = ui, server = server)
