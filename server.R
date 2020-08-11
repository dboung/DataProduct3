library(shiny) # Load shiny package
data(iris) # Load the iris dataset


shinyServer(
    
    
    function(input, output) {
        
        output$text1 <- renderText({ 
            colm = as.numeric(input$var)
            colm1 = as.numeric(input$var2)
            paste("This is a scatterplot of ", 
                  names(iris[colm]), " and ", names(iris[colm1]))
            
        })
 
        output$scatter <- renderPlot(
            
            {
                colm = as.numeric(input$var)
                colm1 = as.numeric(input$var2)
                plot(iris[,colm], iris[,colm1],
                     col =input$colour, 
                     main = "Scatterplot",
                     xlab = names(iris[colm]),
                     ylab=names(iris[colm1]))
                if (input$line){
                    abline(lm(iris[,colm1]~iris[,colm]))
                }
            }
        ) 
        output$text2 <- renderText({ 
            colm2 = as.numeric(input$average)
            paste("The mean value of ",names(iris[colm2]),
                  " for each species is")})
        
        output$table1 <- renderTable({ 
            
            colm2 = as.numeric(input$average) 
            a = as.data.frame(tapply(iris[,colm2],iris$Species,mean))
            names(a)="average"
            a = data.frame(species=c("setosa","versicolor","virginica"),
                           average=a$average)
            a
            })
       
      
    }
)