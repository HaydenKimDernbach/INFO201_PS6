#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("UAH Lower Troposphere Data"),
    
    # Sidebar with a slider input for number of bins
    mainPanel(
        tabsetPanel(
            tabPanel(
                "Summary",
                h3("Overview"),
                textOutput("numEntries"),
            ),
            
            tabPanel(
                "Plot", 
                sidebarLayout(
                    sidebarPanel(
                        radioButtons(
                            "color", "Choose Color",
                            c("Red", "Blue")
                        ),
                        strong("Choose Specific Airport"),
                        checkboxInput("airport1", "JFK", FALSE),
                        checkboxInput("airport2", "EWR", FALSE),
                        checkboxInput("airport3", "LGA", FALSE),
                        strong("(combined frequency by default)")
                    ),
                  
                    # Show a plot of the generated distribution
                    mainPanel(
                        plotOutput("plot")
                    )
                )
            ),
            
            tabPanel(
                "Table", 
                checkboxGroupInput("icons", "Choose icons:",
                                   choiceNames =
                                       list(icon("calendar"), icon("bed"),
                                            icon("cog"), icon("bug")),
                                   choiceValues =
                                       list("calendar", "bed", "cog", "bug")
                ),
                textOutput("txt")
            )
        )
    ),
)
