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

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        output <- lm(mpg~hp, mtcars)
        mtcars %>% ggplot(aes(x = hp, y = mpg)) + geom_point() + geom_smooth(method='lm', formula= y~x, se=FALSE) + ggtitle("MPG based on HP")
                                })
    
    output$verb <- renderText({ 
        output <- lm(mpg~hp, mtcars)
        paste0("Expeted mpg with a HP of ",input$HP,": ", round(predict(output, newdata = data.frame(hp = c(input$HP))), 1))

    })
    output$notes <- renderText({ 
        print("Using a simple lnear regression model, this application predicts the MPG for a vehicle given a specific HP.")
        
    })
    output$notes2 <- renderText({ 
        print("Please use the slider to select a horsepower - the corresponding MPG will be shown here")
        
    })
    output$notes3 <- renderText({ 
        print("Plot showing all the values from the 'mtcars' dataset, which was unsed to train the model")
        
    })
})
