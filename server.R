library(shiny)
library(ggplot2)
shinyServer(function(input, output) {
        lm <- lm(Wind ~ Temp, data = airquality)
        pred <- reactive({
                TempIn <- input$TempInput
                predict(lm, newdata = data.frame(Temp = TempIn))
        })
        output$plot1 <- renderPlot({
                TempIn <- input$TempInput
                g <- ggplot(data = airquality, aes(x = Temp, y = Wind)) +
                        geom_point()
                print(g)
                if(input$showModel){
                        g <- g + geom_smooth(method = "lm")
                        print(g)
                }
                if(input$showInt){
                        g <- g + geom_vline(xintercept = input$TempInput,
                                            color="red")
                        print(g)
                }
                output$pred <- renderText({
                        pred()
                })
        })
})