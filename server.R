library(shiny)
library(datasets)
data(presidents)

truman <- window(presidents, start=c(1945, 2), end=c(1952, 4)) 
eisenhower <- window(presidents, start=c(1953, 1), end=c(1960, 4)) 
kennedy <- window(presidents, start=c(1961, 1), end=c(1963, 4)) 
johnson <- window(presidents, start=c(1964, 1), end=c(1968, 4)) 
nixon <- window(presidents, start=c(1969, 1), end=c(1974, 3))
ford <- window(presidents, start=c(1974, 4), end=c(1974, 4)) 

shinyServer(
        function(input, output) {
                output$summary <- renderPrint({
                        if(input$select==1){
                                summary(truman)
                        } else {
                                if(input$select==2) {
                                        summary(eisenhower)
                                } else {
                                        if(input$select==3) {
                                                summary(kennedy)
                                        } else {
                                                if(input$select==4) {
                                                        summary(johnson)
                                                } else {
                                                        if(input$select==5) {
                                                                summary(nixon)
                                                        } else {
                                                                summary(ford)
                                                        }
                                                }
                                        }
                                }
                        }        
                })
                
                output$portrait <- renderImage({
                        filename <- normalizePath(file.path('./images',
                                                            paste('image', input$select, '.jpeg', sep='')))
                        list(src = filename, alt = paste("Image number", input$select))
                }, deleteFile = FALSE)
                
                output$boxPlot <- renderPlot({
                        if(input$select==1){
                                boxplot(truman, main = "Presidential Term (Q2 1945 - Q4 1952)", ylab = "Approval Rating")
                        } else {
                                if(input$select==2) {
                                        boxplot(eisenhower, main = "Presidential Term (Q1 1953 - Q4 1960)", ylab = "Approval Rating")
                                } else {
                                        if(input$select==3) {
                                                boxplot(kennedy, main = "Presidential Term (Q1 1961 - Q4 1963)", ylab = "Approval Rating")
                                        } else {
                                                if(input$select==4) {
                                                        boxplot(johnson, main = "Presidential Term (Q1 1964 - Q4 1968)", ylab = "Approval Rating")
                                                } else {
                                                        if(input$select==5) {
                                                                boxplot(nixon, main = "Presidential Term (Q1 1969 - Q3 1974)", ylab = "Approval Rating")
                                                        } else {
                                                                boxplot(ford, main = "Presidential Term (Q4 1974)", ylab = "Approval Rating")
                                                        }
                                                }
                                        }
                                }
                        }
                })
                
                output$linePlot <- renderPlot({
                        if(input$select==1){
                                plot(truman, main = "Approval Rating over Duration of Presidency", xlab = "Year", ylab = "Approval Rating")                        } else {
                                if(input$select==2) {
                                        plot(eisenhower, main = "Approval Rating over Duration of Presidency", xlab = "Year", ylab = "Approval Rating")                                } else {
                                        if(input$select==3) {
                                                plot(kennedy, main = "Approval Rating over Duration of Presidency", xlab = "Year", ylab = "Approval Rating")                                        } else {
                                                if(input$select==4) {
                                                        plot(johnson, main = "Approval Rating over Duration of Presidency", xlab = "Year", ylab = "Approval Rating")                                                } else {
                                                        if(input$select==5) {
                                                                plot(nixon, main = "Approval Rating over Duration of Presidency", xlab = "Year", ylab = "Approval Rating")                                                        } else {
                                                                        plot(ford, main = "*Ford was only President for Q4 1974*", xlab = "Year", ylab = "Approval Rating")                                                        }
                                                }
                                        }
                                }
                        }        
                })
                
                output$table <- renderTable({
                        if(input$select==1){
                                truman
                        } else {
                                if(input$select==2) {
                                        eisenhower
                                } else {
                                        if(input$select==3) {
                                                kennedy
                                        } else {
                                                if(input$select==4) {
                                                        johnson
                                                } else {
                                                        if(input$select==5) {
                                                                nixon
                                                        } else {
                                                                ford
                                                        }
                                                }
                                        }
                                }
                        }        
                })
                
        }
)