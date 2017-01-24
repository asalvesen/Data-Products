library(shiny)
shinyUI(fluidPage(
        titlePanel("Predict Horsepower from MPG"),
        sidebarLayout(
                sidebarPanel(
                        numericInput("TempInput",
                                     "What is the temperature in degrees F?",
                                     70, min = 50, max = 100, step = 1),
                        checkboxInput("showModel", "Show Model", value = TRUE),
                        checkboxInput("showInt", "Show Prediction", value = TRUE),
                        submitButton("Go!")
                        ),
                mainPanel(
                        plotOutput("plot1"),
                        h3("Predicted Wind:"),
                        textOutput("pred")
                )
        )
))