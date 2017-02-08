# Geocoding Early Literacy Resources in Pittsburgh

library(ggmap)

load.lit <- read.csv("./literacy-map-resources.csv")

load.lit$fullAddress <- paste0(load.lit$Street.Address, ", Pittsburgh, PA ", load.lit$Zip.Code)

load.lit$XY <- geocode(load.lit$fullAddress)

wa# load.snow_angel.1$Address_Street <- paste0(load.snow_angel.1$Address_Street,", Pittsburgh, PA ", load.snow_angel.1$ARC_ZIP)
# 2
# XY <- geocode(load.snow_angel.1$Address_Street)
# 3
# load.snow_angel <- cbind(load.snow_angel.1, XY) 