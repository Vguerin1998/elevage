server <- function(input, output) {
  base<-read.table("base.csv",header=TRUE,sep = ";",encoding = "UTF8")

  output$loinorm <- renderPlot({
    
    poids_moyen <- 0.1
    
if(input$stress == 1){Nb <- input$Nb*1; poids_moyen <- 0.1 } else if
   (input$stress == 2){Nb <- input$Nb*1.1; poids_moyen <- 0.115 } else if
    (input$stress == 3){Nb <- input$Nb*1.2; poids_moyen <- 0.12 } else if
     (input$stress == 4){Nb <- input$Nb*1.3; poids_moyen <- 0.125 } else if
      (input$stress == 5){Nb <- input$Nb*1.4; poids_moyen <- 0.13 } else if
       (input$stress == 6){Nb <- input$Nb*1.1; poids_moyen <- 0.110 } else if
        (input$stress == 7){Nb <- input$Nb*1.02; poids_moyen <- 0.095 }
    
    hist(rnorm(Nb,mean=poids_moyen+input$jour*0.05,sd=0.01), 
         
         main = paste("Répartition des poids de l'élevage au jour",input$jour,", stress =",input$stress),
         
         col="grey", xlab = "Poids en mg ", ylab = "Nb d'individu par tranche de poids ")

  })
  
  output$nous <- renderText({
    "Groupe 3"
  })
  
}

