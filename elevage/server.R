server <- function(input, output) {
  base<-read.table("base.csv",header=TRUE,sep = ";",encoding = "UTF8")
  
  output$loinorm <- renderPlot({
    hist(rnorm(input$Nb,mean=0.1+input$jour*0.05,sd=0.01), main = paste("Repartition des poids de l'elevage au jour",input$jour),col="grey", xlab = "Poids en mg ", ylab = "Nb d'individu par tranche de poids ",)
  })
  output$nous <- renderText({
    "T DEMESSE & V GUERIN"
  })
  
}

