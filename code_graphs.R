

# Preparation -------------------------------------------------------------

# load packages

library(tidyverse)
library(ggplot2)

# set working directory

setwd("~/2018_labseminar")

# load data

pnarr <- read_tsv("pnarr.csv")

# filter by values P and not P from column P

pnarr2 <- filter(pnarr, p %in% c("P", "not P"))

# group these by perspective and summarise their occurrence

pf <- pnarr2 %>%
  group_by(p, perspective) %>%
  summarise(occurrence = n())


# draw a barplot

ggplot(pf, aes(x = perspective, 
               y = occurrence)) +geom_bar(stat="identity", 
                                          aes(fill = p), 
                                          position = "dodge") + labs(x = "", y = "", fill = "Form")



# Bagvalal ----------------------------------------------------------------

# create a subset for Bagvalal

p_bagv <- pnarr2[(pnarr2$language=='Bagvalal'),]

# summarise occurrences

pfb <- p_bagv %>%
  group_by(p, perspective) %>%
  summarise(occurrence = n())

# draw a barplot

ggplot(pfb, aes(x = perspective, 
               y = occurrence)) +geom_bar(stat="identity", 
                                          aes(fill = p), 
                                          position = "dodge") + labs(x = "", y = "", fill = "Form")


# take a random sample

bsample <- p_bagv[sample(1:nrow(p_bagv), 50, replace = F),]

# summarise occurrences

bsample_50 <- bsample %>%
  group_by(p, perspective) %>%
  summarise(occurrence = n())

# draw a barplot

ggplot(bsample_50, aes(x = perspective, 
                y = occurrence)) +geom_bar(stat="identity", 
                                           aes(fill = p), 
                                           position = "dodge") + labs(x = "", y = "", fill = "Form")


# Tsakhur -----------------------------------------------------------------

# create a subset for Tsakhur

p_tsakh <- pnarr2[(pnarr2$language=='Tsakhur'),]

# summarise occurrences

pft <- p_tsakh %>%
  group_by(p, perspective) %>%
  summarise(occurrence = n())

# draw a barplot

ggplot(pft, aes(x = perspective, 
               y = occurrence)) +geom_bar(stat="identity", 
                                          aes(fill = p), 
                                          position = "dodge") + labs(x = "", y = "", fill = "Form")

# take a random sample

tsample <- p_tsakh[sample(1:nrow(p_tsakh), 50, replace = F),]

# summarise occurrences

tsample_50 <- tsample %>%
  group_by(p, perspective) %>%
  summarise(occurrence = n())

# draw a barplot

ggplot(tsample_50, aes(x = perspective, 
                       y = occurrence)) +geom_bar(stat="identity", 
                                                  aes(fill = p), 
                                                  position = "dodge") + labs(x = "", y = "", fill = "Form")

# type of forms used

table(p_tsakh$form)

# = more present tenses and various moods

table(p_bagv$form)

# = less diverse
