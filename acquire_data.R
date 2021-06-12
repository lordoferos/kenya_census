# This is the script used to acquire the various datasets that will be used
# for this project

# Get the Data

# Read in with tidytuesdayR package 
# Install from CRAN via: install.packages("tidytuesdayR")
# This loads the readme and all the datasets for the week of interest

# Either ISO-8601 date or year/week works!

# Option to read the data using the TidyTuesdayR package

# tuesdata <- tidytuesdayR::tt_load('2021-01-19')
# tuesdata <- tidytuesdayR::tt_load(2021, week = 4)

# gender <- tuesdata$gender

# Or read in the data manually

library(tidyverse)

gender <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-01-19/gender.csv')
crops <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-01-19/crops.csv')
households <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-01-19/households.csv')

# Write the datasets into csv files
write_csv(gender, "data/gender.csv")
write_csv(crops, "data/crops.csv")
write_csv(households, "data/households.csv")
