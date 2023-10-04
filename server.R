#Code for the server side of the dashboard
library(shiny)
library(shinydashboard)
library(ggplot2)


server <- function(input, output, session) {
  
  
  output$main_plot <- renderPlot({
    
    plot(input$x_value, input$y_value, main = "Look at this Graph", pch = 16, xlim = c(-10,10), ylim= c(-10, 10))
    
    }) 

  }

