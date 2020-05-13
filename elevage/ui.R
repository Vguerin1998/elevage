ui <- fluidPage(
  
  
  titlePanel("Suivi d'un élevage de drosophiles"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("Nb",
                  "Nombre de mouches dans l'élevage :",
                  min = 1,
                  max = 1000,
                  value = 100),
      
      sliderInput("jour",
                  "Nombre de jours d'élevage :",
                  min=0,
                  max = 10,
                  value = 5),
<<<<<<< HEAD
      
      sliderInput("stress",
                  "Niveau de stress:",
                  min=1,
                  max = 7,
                  value = 2)
=======
      selectInput("espece", "Choisir une espece:",
                  choices = base[,1])
>>>>>>> 0a6624136f3db6f742e49ef699cbf00766b53ea9
    ),
    mainPanel(
      plotOutput("loinorm"),
      textOutput("nous")
      
    )
    
  )
)


