library(shiny)
library(VennDiagram)

ui <- fluidPage(
  plotOutput("venn")
)

server <- function(input, output, session ) {
  
  set.seed(20190708)
  genes <- paste("gene",1:1000,sep="")
  x <- list(
    A = sample(genes,300), 
    B = sample(genes,525), 
    C = sample(genes,440)
  )
  
  display_venn <- function( x , .... ) {
    library(VennDiagram)
    grid.newpage()
    venn_object <- venn.diagram(
      x,
      filename=NULL,
      fill = c("red","blue","green") # can I put something other than merely a color here?
    )
    grid.draw(venn_object)
  }
  output$venn <- renderPlot({
    display_venn(x)
  })
}

shinyApp(ui = ui, server = server)