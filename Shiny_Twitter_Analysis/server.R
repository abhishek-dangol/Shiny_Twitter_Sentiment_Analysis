
#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    x = 1
    
    # processing to display the user input text again on output pane.
    
    output$In <- renderText({
        paste("You entered: ", input$text)
    })
    
    # processing for error/confirmation message
    # the check_search_term function returns a string output
    # if the search term returns <5 tweets then we display ERROR message
    # else success message is displayed.
    output$action <- renderText({
        chk_searchterm(input$text)
    })
    
    # processing for output graph - bar graph displaying sentiment values
    # for various emotions such as anger, fear, joy, anticipation etc.
    # if the previous function had returned an error message, then this 
    # block will display an empty graph
    output$plot1 <- renderPlot({
        ggplot(data = twitter_senti(input$text), aes(x = sentiment, y = count)) +
            geom_bar(aes(fill = sentiment), stat = "identity") +
            theme(legend.position = "none") +
            xlab("Sentiment") + ylab("Total") + ggtitle("Sentiment Graph") +
            coord_flip() + theme(text = element_text(size = 30))
    })
    
    # this block displays an image to convey the overall sentiment of the search_term.
    # default = positive
    
    output$image2 <- renderImage({
        x = twitter_senti(input$text)
        if((x[10, "count"]) < (x[9, "count"]))
        {
            image_flag = -99
        }
        if(image_flag == 100){
            return(list(
                src = "happy.jpg",
                width = 150,
                contentType = "image/jpg",
                alt = "Positive"
            ))
        } else {
            return(list(
                src = "sad.jpg",
                width = 150,
                filetype = "image/jpg",
                alt = "Negative"
            ))
        }
    }, deleteFile = FALSE)
})

