#code for the user interface 
library(shinydashboard)
library(shiny)

source("server.R")
ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)


shinyApp(ui, server)