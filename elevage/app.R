library(shiny)
library(FactoMineR)
base <-read.table("base.csv",header=TRUE,sep = ";")
shinyApp(ui = ui, server = server)

