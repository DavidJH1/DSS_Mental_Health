#Code for the server side of the dashboard
library(shiny)
library(shinydashboard)
library(ggplot2)
library(tidyverse)


server <- function(input, output, session) {
  
  
  output$main_plot <- renderPlot({
    
    plot(input$x_value, input$y_value, main = "Look at this Graph", pch = 16, xlim = c(-10,10), ylim= c(-10, 10))
    
    }) 


  #make a reactive statement that filters air quality with user selected values
  final_data <- reactive({
  
  airquality2 <- airquality %>% mutate(Month_name = case_when(Month == 5 ~ "May",
                                     Month == 6 ~ "June",
                                     Month == 7 ~ "July",
                                     Month == 8 ~ "August",
                                     Month == 9 ~ "September"))
    
  
  #filter by concrete values  
  airquality_filtered <- airquality2 %>% filter(between(Ozone, input$ozone[1], input$ozone[2]),
                                               Solar.R >= input$solar[1],
                                               Solar.R <= input$solar[2],
                                               Wind >= input$wind[1],
                                               Wind <= input$wind[2],
                                               Temp >= input$temp[1],
                                               Temp <= input$temp[2],
                                               between(Day, input$day[1], input$day[2]))
  #filter by the month
  if(input$month == "All") {
    airquality_filtered <- airquality_filtered
  }
  
  if(input$month != "All") {
    airquality_filtered <- airquality_filtered %>% filter(Month_name == input$month)
  }
  
  return(airquality_filtered)
  
  }) #end reactive filtering for air quality
  
  
  #output interactive scatter plot
  output$filtered_plot <- renderPlot({
    ggplot(final_data(), aes_string(x = input$xvar, y = input$yvar)) +
      geom_point()
  })
  
  
  output$airquality_data <- renderTable({
    data.frame(final_data())
  })
  
  
  }

