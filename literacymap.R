# Geocoding Early Literacy Resources in Pittsburgh

#Required Libraries
library(ggmap)
library(leaflet)
library(knitr)
library(maps)
library(sp)
library(shiny)

ui <- fluidPage(
  leafletOutput("map")
)

# Doing funky stuff to load the needed data and geocode all locations

# load.lit <- read.csv("./literacy-map-resources.csv")
# load.lit$fullAddress <- paste0(load.lit$Street.Address, ", Pittsburgh, PA ", load.lit$Zip.Code)
# # load.lit$XY <- geocode(load.lit$fullAddress)
# test.load <- load.lit
# 
# XY <- geocode(test.load$fullAddress)
# load.lit <- cbind(load.lit,XY)
# 
# write.csv(load.lit, "./geocoded_literacy_map.csv")

full.lit <- read.csv("./geocoded_literacy_map.csv")

server <- function(input, output, session) {

# Let's get this show on the road...

output$map <- renderLeaflet({
  (data = full.lit) %>% 
    setView(lng = -79.9959, lat = 40.4406, zoom = 12)
  map %>% addProviderTiles("OpenStreetMap.HOT") %>% 
    addMarkers(~lon, ~lat, popup = ~paste('<b>Program Name:</b>', load.lit$Program.Name, '<br><b>Location:</b>', load.lit$Resource.Name, '<br><b>Address:</b>', load.lit$fullAddress, '<br><b>Resource Type:</b>', load.lit$Resource.Type, '<br><b>Age Group:</b>', load.lit$Age.Population, '<br>', '<a href="',load.lit$Website,'">Website</a>' ))
  
})




 
} 

shinyApp(ui, server)