#Required Libraries
library(ggmap)
library(leaflet)
library(knitr)
library(maps)
library(sp)
library(shiny) 



ui <- (fluidPage(
  leafletOutput('map'),
  windowTitle = "Early Literacy Resources in Pittsburgh",
  title = "Early Literacy Resources in Pittsburgh")
)
   
# Define server logic required to draw map
server <- (function(input, output) {
   output$map <- renderLeaflet({
     map <- leaflet(data = full.lit) %>% 
       setView(lng = -79.9959, lat = 40.4406, zoom = 12) %>% 
       addProviderTiles('OpenStreetMap.HOT',
                        options = providerTileOptions(noWrap = TRUE)) %>% 
       addMarkers(
         clusterOptions = NULL,
         ~lon, ~lat, 
         popup = ~paste('<b>Program Name:</b>', full.lit$Program.Name, 
                        '<br><b>Location:</b>', full.lit$Resource.Name, 
                        '<br><b>Address:</b>', full.lit$fullAddress, 
                        '<br><b>Resource Type:</b>', full.lit$Resource.Type, 
                        '<br><b>Age Group:</b>', full.lit$Age.Population, 
                        '<br>', '<a href="',full.lit$Website,'">Website</a>' ))
     map
   })
})

 

# Run the application 
shinyApp(ui = ui, server = server)

