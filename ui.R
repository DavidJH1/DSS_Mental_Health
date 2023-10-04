#code for the user interface 
library(shinydashboard)
library(shiny)

source("server.R")
ui <- dashboardPage(
  dashboardHeader(
    title = "DSS Mental Health Dashboard"
  ),
  dashboardSidebar(
    sidebarMenu(
      id = "tabs",
    menuItem("Dashboard", tabName = "Dashboard"),
    menuItem("Patients", tabName = "Patients")
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
               selectInput(inputId = "column1", choices = c("a","b","c"), label = "Alphabet")
        ),
          column(8,
               selectInput(inputId = "column2", choices = c("x","y","z"), label = "Polynomial")
        ))
      ) # end tab Patients
    ) #end tabItems
    
  ) #end Dashboard body

)# End Dashboard Page


shinyApp(ui, server)