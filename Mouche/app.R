library(shiny)

ui <- fluidPage(

    
    titlePanel("Suivi d'un elevage de drosophiles"),

    sidebarLayout(
        sidebarPanel(
            sliderInput("Nb",
                        "Nombre de mouches dans l'elevage :",
                        min = 1,
                        max = 1000,
                        value = 100),
            
            sliderInput("jour",
                    "Nombre de jours d'elevage :",
                    min=0,
                    max = 10,
                    value = 5)
            ),
    
        mainPanel(
           plotOutput("loinorm"),
           textOutput("nous")
        ),
    
    )
  )

 
server <- function(input, output) {

    output$loinorm <- renderPlot({
        hist(rnorm(input$Nb,mean=0.1+input$jour*0.05,sd=0.01), main = paste("Repartition des poids de l'elevage au jour",input$jour),col="grey", xlab = "Poids en mg ", ylab = "Nb d'individu par tranche de poids ",)
    })
    output$nous <- renderText({
    "T DEMESSE & V GUERIN"
    })
}

shinyApp(ui = ui, server = server)

