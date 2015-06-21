library(shiny)

measures<-c("meters", "miles", "inches")
shinyUI(fluidPage(
        
  pageWithSidebar(
          headerPanel("Distance converter"),

          sidebarPanel(
                  helpText("To use this converter you only have to put the distance you want to convert, the origin measure and the destiny measure. After clicking 'submit' you will see in the right part of the screen the result of the conversion."),
                  numericInput('inputdistance', "Distance", 0, min=0, step=0.1),
                  selectizeInput(
                          'inputmeasure', 'Input measure',
                          choices = measures
                  ),
                  selectizeInput(
                          'outputmeasure', 'Output measure',
                          choices = measures
                  ),
                  submitButton("Submit")),
          
          # Show the Data Entered and the Calculation
          mainPanel(
                  h4("You entered:"),
                  verbatimTextOutput('inputdistance'),
                  verbatimTextOutput('inputmeasure'),
                  h4("The output is:"),
                  verbatimTextOutput('outputdistance'),
                  verbatimTextOutput('outputmeasure')))
 ))