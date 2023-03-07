#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

data <- read_delim("data/nycflights13.csv", )
# x <- data$Year
# x

# Define server logic required to draw a histogram
function(input, output, session) {
    
    output$numEntries <- renderText({
        numEntries <- nrow(data)
        
        paste("This app uses ", numEntries, " flight data entries from NYC airports")
    })

    output$plot <- renderPlot({
        
        

        # generate bins based on input$bins from ui.R
        # x <- unique(data$month)
        # y <- group_by(data, month) %>% 
          #  summarize(
         #       count = n()
        #    )
        
        
        # plot(data$month, data$flight)
        # bins <- seq(min(x), max(x), length.out = input$bins + 1)

        filtered_data <- reactive({
            dat <- data
            if (input$airport1) { dat <- dat %>% filter(dat$origin %in% "JFK") }
            if (input$airport2) { dat <- dat %>% filter(dat$origin %in% "EWR") }
            if (input$airport3) { dat <- dat %>% filter(dat$origin %in% "LGA") }
            dat
        })
        
        # draw the histogram with the specified number of bins
        hist(filtered_data()$month, breaks=0:12 + .5, col = input$color, border = 'white',
            xlab = 'month',
            main = 'Histogram of flights per month')

    })
    
    output$txt <- renderText({
        icons <- paste(input$icons, collapse = ", ")
        paste("You chose", icons)
    })

}
