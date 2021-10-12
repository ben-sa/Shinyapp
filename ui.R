library(shiny)

shinyUI(fluidPage(

    titlePanel("MPG based on HP projection"),

    sidebarLayout(
        sidebarPanel(
            sliderInput("HP",
                        "Select HP:",
                        min = 1,
                        max = 400,
                        value = 100),
            textOutput("notes3"),
            plotOutput("distPlot"),
        ),

        mainPanel(
            textOutput("notes"),
            textOutput("notes2"),
            verbatimTextOutput("verb")
        )
    )
))
