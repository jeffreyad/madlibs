library(shiny)

ui <- fluidPage(
  titlePanel("Mad Libs"),
  sidebarLayout(
    sidebarPanel(
      textInput("noun", "Noun:"),
      textInput("verb", "Verb:"),
      textInput("adjective", "Adjective:"),
      actionButton("go", "Create Story")
    ),
    mainPanel(
      textOutput("story")
    )
  )
)

server <- function(input, output) {
  
  story <- eventReactive(input$go, {
    paste0(
      "Once upon a time, there was a ", input$adjective, " ", input$noun,
      " who loved to ", input$verb, " all day long."
    )
  })
  output$story <- renderText({
    story()
  })
}

shinyApp(ui, server)