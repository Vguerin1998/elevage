library(shiny)

ui <- fluidPage(

    
    titlePanel("Suivi d'un elevage de drosophiles"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("Nb",
                        "Nombre de mouches dans l'elevage :",
                        min = 1,
                        max = 1000,
                        value = 30),
            
            sliderInput("jour",
                    "Nombre de jours d'elevage :",
                    min=0,
                    max = 10,
                    value = 5)
            ),
    
        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("loinorm")
        )
    )
  )

 
# Define server logic required to draw a histogram
server <- function(input, output) {

    output$loinorm <- renderPlot({
        # generate bins based on input$bins from ui.R
        hist(rnorm(input$Nb,mean=0.1+input$jour*0.05,sd=0.01), main = paste("Repartition des poids de l'elevage au jour",input$jour),col="black", xlab = "Poids en mg ", ylab = "Nb d'individu par tranche de poids ",)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

