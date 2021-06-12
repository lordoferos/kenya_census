# This is the script used to acquire the various datasets that will be used
# for this project

# Get the Data data manually
library(rKenyaCensus)
library(tidyverse)

# Add other useful datasets

# Household size and population
households <- V1_T2.3
# Population and gender by county
pop_county <- V1_T2.2
# Births last 5 years by county
births_county <- V4_T2.40
# Assets
assets_owned <- V4_T2.36
# Searched and bought goods online
goods_online <- V4_T2.34



# Clean the datasets
library(janitor)
library(tools)

# Remove row containing Kenya (sum total)
households <- households %>% slice(-1) %>% 
  clean_names()

# Remove row containing total counts for the sexes
pop_county <- pop_county %>% slice(-1) %>% 
  clean_names()

# Remove first 3 rows of rural and urban and whole of Kenya
# Change county names to sentence case
births_county <- births_county %>% 
  slice(-c(1:3)) %>% 
  mutate(County = toTitleCase(tolower(County)))%>% 
  clean_names()

# Remove first three rows of rural and urban and whole of Kenya
# Remove subcounties
# standardize the naming system
assets_owned <- assets_owned %>% 
  ungroup(County) %>%
  filter(AdminArea == "County") %>% 
  mutate(County = toTitleCase(tolower(County))) %>% 
  select(-SubCounty) %>% 
  clean_names()

# Remove first three rows of rural and urban and whole of Kenya
# Remove subcounties
# standardize the naming system
goods_online <- goods_online %>% 
  ungroup(County) %>%
  filter(AdminArea == "County") %>% 
  mutate(County = toTitleCase(tolower(County))) %>% 
  select(-SubCounty) %>% 
  clean_names()


# Write the datasets into csv files
write_csv(households, "data/households.csv")
write_csv(pop_county, "data/pop_county.csv")
write_csv(births_county, "data/births_county.csv")
write_csv(assets_owned, "data/assets_owned.csv")
write_csv(goods_online, "data/goods_online.csv")

