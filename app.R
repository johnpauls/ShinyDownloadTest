library(shiny)
library(ggplot2)
library(tidyverse)

# UI
ui <- fluidPage(
    
    titlePanel("Example Shiny App"),


    sidebarLayout(
        sidebarPanel(
            selectInput(inputId="Group",
                        label="Choose a group:",
                        choices=c("A","B"),
                        selected="A")
        ),

                mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Server
server <- function(input, output) {
    Test_Data<-read.csv("Sample_Data.csv")

    output$distPlot <- renderPlot({
        ggplot(data=Test_Data %>% filter(Type==input$Group), aes(x=Day, y=value))+
            geom_point(color=ifelse(input$Group=="A", "blue","red"), size=4)+
            theme_classic()

    })
}

# Run the application 
shinyApp(ui = ui, server = server)
