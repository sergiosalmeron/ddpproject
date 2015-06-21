
library(shiny)

fahToCel<-  function(fahrenheit) ((fahrenheit-32)*(5/9))

milespermeter<-0.00062137
inchespermeter<-39.37007874

distanceConv<- function(inputdist, inputmeas, outputmeas) {
        if (inputmeas=="meters"){
                if (outputmeas=="\"meters\""){
                        inputdist
                }
                else if (outputmeas=="miles"){
                        inputdist*milespermeter
                }
                else  if (outputmeas=="inches"){
                        inputdist*inchespermeter
                }
        }
        else if (inputmeas=="miles"){
                if (outputmeas=="meters"){
                        inputdist/milespermeter
                }
                else if (outputmeas=="miles"){
                        inputdist
                }
                else  if (outputmeas=="inches"){
                        (inputdist/milespermeter)*inchespermeter
                }
        }
        else if (inputmeas=="inches"){
                if (outputmeas=="meters"){
                        inputdist/inchespermeter
                }
                else if (outputmeas=="miles"){
                        (inputdist/inchespermeter)*milespermeter
                }
                else  if (outputmeas=="inches"){
                        inputdist
                }
        }
}


shinyServer(function(input, output) {
        output$inputdistance<-renderPrint({input$inputdistance})
        output$outputdistance<-renderPrint({distanceConv(input$inputdistance, input$inputmeasure, input$outputmeasure)})
        output$inputmeasure<-renderPrint({input$inputmeasure})
        output$outputmeasure<-renderPrint({input$outputmeasure})

        })