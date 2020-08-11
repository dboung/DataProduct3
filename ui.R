# Install the shiny package if not already installed
# install.packages("shiny")

library(shiny) # load the shiny package

# Define UI for application
shinyUI(fluidPage(
    
    # Header or title Panel 
    titlePanel(h4('Interactive Scatterplot', align = "center")),
    
    h5("This Shinny Application will build a scatterplot of a variables from your choice of variables, choice of color, 
       fit a regression and compute the mean of your desired variable for 3 different species in five steps."),
    
    h5("The data for this app is taken from iris dataset."),
    
    
    # Sidebar panel
    sidebarPanel(
       
        
        selectInput("var", label = "1. Select X Variable to plot", 
                    choices = c("Sepal.Length" = 1, "Sepal.Width" = 2, "Petal.Length" = 3, "Petal.Width"=4),
                    selected = 3), 
        
        selectInput("var2", label = "2. Select Y Variable to plot", 
                    choices = c("Sepal.Length" = 1, "Sepal.Width" = 2, "Petal.Length" = 3, "Petal.Width"=4),
                    selected = 2),
        
        radioButtons("colour", label = "3. Select the color of histogram",
                     choices = c("Blue", "Red",
                                 "Orange","Purple","Black"), selected = "Blue"),
    
        checkboxInput("line",label="4. Fit a regression line", FALSE),
        
        selectInput("average", label = "5. Select a Variable to find mean", 
                    choices = c("Sepal.Length" = 1, "Sepal.Width" = 2, "Petal.Length" = 3, "Petal.Width"=4),
                    selected = NULL)),
    
    
    # Main Panel
    mainPanel(
        textOutput("text1"),
        plotOutput("scatter"),
        textOutput("text2"),
        tableOutput("table1")
        
    )
    
)
)
