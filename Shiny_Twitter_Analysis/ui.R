#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

source("global.R")
library(shiny)
library(shinythemes)
library(shinyWidgets)


# Define UI for application that draws a histogram
ui <- fluidPage(
    
   
    
    setBackgroundImage(src = "twitter.png"),
    # Application title
    titlePanel("Twitter Sentiment Analysis"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput("text", label = h3("Enter any Twitter hashtag, word or phrase for sentiment analysis"), value = "#keanureeves"),
            hr(),
            # marking width = 2 (max = 12) so that we have maximum space for the putput graph
            width = 2
        ),
        
        
        mainPanel(
            textOutput("In", container = span),
            hr(),
            
            
            # confirmation message: if search string is weird and does not return 
            # any tweets, we will display the error message in this block
            textOutput("action", container = span),
            hr(),
            
            
            # display sentiment analysis output graph and image
            # the output pane is divided into two parts,
            # 70 percent is assigned to the graph and 30% to the sentiment image.
            
            fluidRow(
                splitLayout(cellWidths = c("80%", "20%"), plotOutput('plot1'), imageOutput("image2"))
            )
        )
    )
)
