library(shiny)
library(ggplot2)

dataset <- iris  # Replace diamonds with iris

fluidPage(
  
  titlePanel("Iris Explorer"),  # Update the title
  
  sidebarPanel(
    
    sliderInput('sampleSize', 'Sample Size', min = 1, max = nrow(dataset),
                value = min(1000, nrow(dataset)), step = 500, round = 0),
    
    selectInput('x', 'X', names(dataset)),  # Use column names of iris dataset
    selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),  # Use column names of iris dataset
    selectInput('color', 'Color', c('None', names(dataset))),  # Use column names of iris dataset
    
    checkboxInput('jitter', 'Jitter'),  # Add the jitter checkbox
    checkboxInput('smooth', 'Smooth'),  # Add the smooth checkbox
    
    selectInput('facet_row', 'Facet Row', c(None = '.', names(dataset))),  # Use column names of iris dataset
    selectInput('facet_col', 'Facet Column', c(None = '.', names(dataset)))  # Use column names of iris dataset
  ),
  
  mainPanel(
    plotOutput('plot', height = 700)  # Adjust the height of the plot
  )
)
