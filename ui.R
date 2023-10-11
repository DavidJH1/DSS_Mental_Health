#code for the user interface 
library(shinydashboard)
library(shiny)
library(ggplot2)
library(tidyverse)

source("server.R")
ui <- dashboardPage(
  dashboardHeader(
    title = "DSS Mental Health Dashboard"
  ),
  dashboardSidebar(
    sidebarMenu(
      id = "tabs",
    menuItem("Dashboard", tabName = "Dashboard"),
    menuItem("Patients", tabName = "Patients"),
    menuItem("PatientsTest", tabName = "PatientsTest"),
    menuItem("Medication", tabName = "Medication"),
    menuItem("Condition", tabName = "Condition")
    
    )
  ),
  dashboardBody(
    tabItems(
      tabItem("Dashboard", 
        fluidRow(
          column(4, 
          numericInput(inputId = "x_value", label = "Input X", value = 5),
          numericInput(inputId = "y_value", label = "Input Y", value = 5)
          ),
          column(8,
                 plotOutput(outputId = "main_plot"))
         )
       ), # End tab Dashboard
      tabItem( "Patients",
        fluidRow(
          column(4,
               selectInput(inputId = "column1", choices = c("a","b","c"), label = "Alphabet"),
               selectInput(inputId = "column2", choices = c("x","y","z"), label = "Polynomial")
        ),
          column(8,
                 box(
                   status = "info", solidHeader = TRUE,
                   title = "Filter Options",
                   selectInput(inputId = "column1", choices = c("a","b","c"), label = "Alphabet"),
                   selectInput(inputId = "column2", choices = c("x","y","z"), label = "Polynomial")
                 )
               
        ))
      ), # end tab Patients
      tabItem("PatientsTest",
        fluidRow(
          column(4, 
                 box(
                   status = "info", solidHeader = TRUE,
                   title = "Filter Options",
                   sliderInput(inputId = "ozone", "Ozone Levels", 0, 100, value = c(0,100)),
                   sliderInput(inputId = "solar", "Solar.R", 0, 400, value = c(0,400)),
                   sliderInput(inputId = "wind", "Wind Speed", 0, 25, value = c(0,25)),
                   sliderInput(inputId = "temp", "Temperature", 30, 100, value = c(30,100)),
                   selectInput(inputId = "month", "Month", c("All","May","June","July", "August", "September")),
                   sliderInput(inputId = "day", "Day", 1, 31, value = c(1,31)),
                   selectInput(inputId = "xvar", "X-Axis", names(airquality), selected = "Ozone"),
                   selectInput(inputId = "yvar", "Y-Axis", names(airquality), selected = "Solar.R")
                 )
                 
                 ),
          column(8, plotOutput(outputId = "filtered_plot")),
          column(12, box(
            status = "info", solidHeader = TRUE, title = "Data",
            tableOutput(outputId = "airquality_data"),
            
            )
          )
        )
      ) # endtab Paitent Test
    ) #end tabItems
    
  ) #end Dashboard body

)# End Dashboard Page

shinyApp(ui, server, options = list(height = 1000))