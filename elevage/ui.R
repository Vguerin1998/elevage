base <-read.table("base.csv",header=TRUE,sep = ";")

ui <- fluidPage(
  
  
  titlePanel(textOutput("title_panel"),windowTitle = "Elevage"),
  
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
      
      sliderInput("stress",
                  "Niveau de stress:",
                  min=1,
                  max = 7,
                  value = 2),
      
      selectInput("espece", "Choisir une espèce:",
                  choices = base[,1]),
      
    ), 
    mainPanel(
      plotOutput("loinorm"),
      textOutput("poids"),
      textOutput("nbyb"),
      plotOutput("espece"),
      downloadButton("report", "Generer un rapport"),
      textOutput("nous")   
    ) 
      )
)