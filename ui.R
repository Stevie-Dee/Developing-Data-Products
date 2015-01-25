library(shiny)
shinyUI(fluidPage(
        titlePanel("Summarized Presidential Approval Ratings (1945-1974)"),
        
        sidebarPanel(
                selectInput("select", label = ("Choose a President:"), 
                                        choices = list('Harry Truman' = 1,
                                        'Dwight Eisenhower' = 2, 
                                        'John F. Kennedy' = 3, 
                                        'Lyndon Johnson' = 4, 
                                        'Richard Nixon' = 5, 
                                        'Gerald Ford' = 6)
                ),
                imageOutput("portrait"),
                helpText("Presidential approval ratings have been in existence since 1945, and
                                          give a general idea about the popularity of the President at the time the survey was taken.
                                          On the tabs, you can see a summary of a President's approval rating during their time in office. You can also
                                          see a box plot of their approval ratings, to get an idea
                                          of their overall spread, as well as a line plot, so you can see how the ratings changed over time. 
                                          On the final tab, you can see a table of their approval ratings by quarter."),
                align = "center"
        ),
        
        mainPanel(
                tabsetPanel(type = "tabs",
                        tabPanel("Summary", h4("Statistical Summary of Approval Ratings"), verbatimTextOutput("summary")),
                        tabPanel("Box Plot", plotOutput("boxPlot")),
                        tabPanel("Line Plot", plotOutput("linePlot"),
                                 helpText("Any breaks in a graph are due to the fact that no approval rating was available.")
                        ),
                        tabPanel("Table", h4("Approval Ratings by Quarter"), tableOutput("table"))
                ),
                align = "center"
        )
))