server <- function(input, output) {
  base<-read.table("base.csv",header=TRUE,sep = ";",encoding = "UTF8")
  
  output$title_panel <- renderText({
    paste0("Suivi d'un élevage de ", input$espece )
  })
  
  output$loinorm <- renderPlot({
    
    if(input$espece=="Drosophile payetum"){poids_moyen<-0.1;croissance<-0.05;sd<-0.01}else if
    (input$espece=="Tabanus savetus"){poids_moyen<-1;croissance<-0.2;sd<-0.3}else if
    (input$espece=="Lucilia bertelettus"){poids_moyen<-0.8;croissance<-0.15;sd<-0.04}else if
    (input$espece=="Syrphus billitus"){poids_moyen<-0.5;croissance<-0.1;sd<-0.025}else if
    (input$espece=="Eristale bonumgirus"){poids_moyen<-0.7;croissance<-0.3;sd<-0.03}
    
    if(input$stress == 1){poids_moyen <- poids_moyen*0.1 } else if
    (input$stress == 2){poids_moyen <- poids_moyen*0.115 } else if
    (input$stress == 3){poids_moyen <- poids_moyen*0.12 } else if
    (input$stress == 4){poids_moyen <- poids_moyen*0.125 } else if
    (input$stress == 5){poids_moyen <- poids_moyen*0.13 } else if
    (input$stress == 6){poids_moyen <- poids_moyen*0.110 } else if
    (input$stress == 7){poids_moyen <- poids_moyen*0.05 }
    
    hist(rnorm(input$Nb,mean=poids_moyen+input$jour*croissance,sd=sd), 
         
         main = paste("Répartition des poids de l'élevage au jour",input$jour,
                      ", avec un niveau de stress",input$stress),
         
         col="grey", xlab = "Poids en mg ", ylab = "Nb d'individu par tranche de poids ")
    
  })
  
  output$nous <- renderText({
    "Groupe 3"})
  
  output$espece <- renderPlot({
    if(input$espece == "Drosophile payetum"){femelle <- 48; male <- 52 } else if
    (input$espece == "Tabanus savetus"){femelle <- 37; male <- 63 } else if
    (input$espece == "Lucilia bertelettus"){femelle <- 55; male <- 45 } else if
    (input$espece == "Syrphus billitus"){femelle <- 53; male <- 47 } else if
    (input$espece == "Eristale bonumgirus"){femelle <- 60; male <- 40 } 
    
    pie(c(male,femelle), col=c("#AAFFAA","#FFAAAA"),labels=c(paste("Male",male,"%"), 
                paste("Femelle",femelle,"%")), main="Rapartition male/femelle",cex=1.5)
  })
  
}

