#code for the user interface 
library(shinydashboard)
library(shiny)

source("server.R")
ui <- dashboardPage(
  dashboardHeader(
    title = "DSS Mental Health Dashboard"
  ),
  dashboardSidebar(
    menuItem("Dashboard", tabName = "Dashboard"),
    menuItem("Paitent Look up")
  ),
  dashboardBody(
    tabItems(
      tabItem("Dashboard", 
        fluidRow(
          sliderInput("How_cool_is_this", "Coolness", min = 0, max = 100, value = 50, step = 1)
        )

      ) # End tab Dashboard
      
    ) #end tabItems
    
  ) #end Dashboard body

)# End Dashboard Page


shinyApp(ui, server)