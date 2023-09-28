#Code for the server side of the dashboard
library(shiny)
library(shinydashboard)
library(ggplot2)

server <- function(input, output, session) {
  output$plot <- renderPlot({
    ggplot() + geom_histogram()
  }) 
  
  
  
}

