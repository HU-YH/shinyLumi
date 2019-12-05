#' The shiny app for methylumiDensity function
#'
#' @return None. Calling the shiny app.
#'
#' @import shiny
#' @import ggplot2
#' @import RColorBrewer
#' @import reshape2
#' @import ggplot2
#'
#' @export

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

library(methylumi)
library(RColorBrewer)
library(ggplot2)
library(shiny)
library(reshape2)



ui <- fluidPage(
  textInput(inputId = 'title', label = 'title of the plot', value = 'Density Plot of beta values'),
  textInput(inputId = 'path', label = 'idat file path'),
  textInput(inputId = 'sample_sheet', label = 'sample sheet', value = ''),
  sliderInput(inputId = 'ylim', label = 'upper limit of density shown on plot',min=1, max = 10, value = 3.5),
  radioButtons(inputId = 'legend', label = 'legend position', choices = c('topright','right','top','bottomright'),
               selected = 'topright'),
  actionButton(inputId = 'plot', label = 'Draw plot'),
  plotOutput("Density")
)

server <- function(input,output){
  observeEvent(input$plot, {
    mset450k <- methylumIDAT(getBarcodes(path=input$path), idatPath=input$path)
    sample_sheet <- input$sample_sheet
    title <- input$title
    ylim <- input$ylim
    legendPos <- input$legend
    output$Density <- renderPlot({methylumiDensity(mldat = mset450k,sample_sheet = sample_sheet,
                                                   main = title, dlim = ylim, legend_position = legendPos)})
  })
}

shinyApp(ui = ui, server= server)
