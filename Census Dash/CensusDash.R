library(shiny)
library(ggplot2)

# Load the data file
data <- read.csv("county_data.csv")

# Define the Shiny app
ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("county", "Select a county:", 
                  choices = unique(data$county_name))
    ),
    mainPanel(
      plotOutput("county_plot")
    )
  )
)

server <- function(input, output) {
  output$county_plot <- renderPlot({
    county_data <- data[data$county_name == input$county, ]
    ggplot(county_data, aes(x = population_variable, y = population_value)) +
      geom_bar(stat = "identity")
  })
}

shinyApp(ui = ui, server = server)


git clone https://github.com/lordoferos/kenya_census.git
