#### Preamble ####
# Purpose: Cleans the raw occupancy and capacity data recorded in the raw dataset
# Author: Victoria Zheng
# Date: 23 September 2024
# Contact: victoria.zheng@mail.utoronto.ca
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(lubridate)
library(dplyr)


#### Clean data ####
# Read 2021-2024 raw datasets
raw_data_2021 <- read_csv("data/raw_data/raw_data_2021.csv")
raw_data_2022 <- read_csv("data/raw_data/raw_data_2022.csv")
raw_data_2023 <- read_csv("data/raw_data/raw_data_2023.csv")
raw_data_2024 <- read_csv("data/raw_data/raw_data_2024.csv")

# Convert occupancy_date into date format
raw_data_2021$OCCUPANCY_DATE <- as.Date(raw_data_2021$OCCUPANCY_DATE, format = "%y-%m-%d")
raw_data_2022$OCCUPANCY_DATE <- as.Date(raw_data_2022$OCCUPANCY_DATE, format = "%y-%m-%d")
raw_data_2023$OCCUPANCY_DATE<- as.Date(raw_data_2023$OCCUPANCY_DATE, format="%Y-%m-%dT%H:%M:%S")
raw_data_2024$OCCUPANCY_DATE <- as.Date(raw_data_2024$OCCUPANCY_DATE, format = "%y-%m-%d")

# Combine 2021-2024 datasets into one dataset
raw_data <- rbind(raw_data_2021, raw_data_2022, raw_data_2023, raw_data_2024)

# Clean, mutate and select wanted columns
cleaned_data <-
  raw_data |>
  janitor::clean_names() |> 
  mutate(year = year(occupancy_date)) |> 
  select(year, 
         occupancy_date, 
         overnight_service_type, 
         service_user_count, 
         capacity_type, 
         capacity_actual_bed,
         occupancy_rate_beds,
         capacity_actual_room,
         occupancy_rate_rooms) |> 
  drop_na(overnight_service_type)

# View the cleaned dataset (optional)
head(cleaned_data)

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
