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
                  value = 5),
    ),
    
    mainPanel(
      plotOutput("loinorm"),
      textOutput("nous")
    ),
    
  )
)

