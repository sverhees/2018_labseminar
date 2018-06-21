

# Preparation -------------------------------------------------------------

# load packages

library(tidyverse)
library(lingtypology)

# set working directory

setwd("~/2018_labseminar")

# load data

map <- read_tsv("allev.csv")


# Evidential perfects -----------------------------------------------------


# subset glottolog points

glot <- map[complete.cases(map$evidentiality),]

# re-order elements in legend

glot$evidentiality <- factor(glot$evidentiality, levels = c("+", "-", "~"))

# draw map

map.feature(glot$Language,
            latitude = glot$Lat,
            longitude = glot$Lon,
            color = glot$group_color,
            features = glot$Group,
            tile = c("Esri.WorldGrayCanvas"),
            stroke.features = glot$evidentiality,
            stroke.title = "Evidential perfect",
            stroke.color = c("black", "honeydew1", "gray"))


# Evidential perfects + all villages by affiliation -----------------------


map.feature(map$Language,
            latitude = map$Lat,
            longitude = map$Lon,
            color = map$group_color,
            opacity = 0.5,
            features = map$Group,
            legend = F,
            tile = c("Esri.WorldGrayCanvas"),
            stroke.features = map$evidentiality,
            stroke.title = "Evidential perfect",
            stroke.color = c("black", "honeydew1", "gray"))
