# This is an exercise to practice cleaning up data, looking at some preliminary results, and keeping GitHub updated

# clear workspace
rm(list = ls())

# call packages
library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)


batdat <-  read_csv("Data/Belize_data_upload.csv")

# tidy the data and pivot for analysis
battemp <- batdat %>% 
  select(!c("Individual", "Sampling time")) %>%
  pivot_longer(cols = c("Pectoralis", "Biceps", "Forearm", "Rectal", "Air"), names_to = "variable", values_to = "value")

# create plots of temperate of the different body parts of bats and
ggplot(battemp) + 
  geom_boxplot(aes(y = value, x = Species), fill = "#DBF1D4", col = "#1B4414") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1), panel.background = element_rect(fill = "#F6FBF4", colour = "#F6FBF4", size = 0.5, linetype = "solid")) +
  facet_wrap(vars(variable), scales = "free")
  

  