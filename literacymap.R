# Geocoding Early Literacy Resources in Pittsburgh



load.snow_angel.1$Address_Street <- paste0(load.snow_angel.1$Address_Street, ", Pittsburgh, PA ", load.snow_angel.1$ARC_ZIP)
2
XY <- geocode(load.snow_angel.1$Address_Street)
3
load.snow_angel <- cbind(load.snow_angel.1, XY) 