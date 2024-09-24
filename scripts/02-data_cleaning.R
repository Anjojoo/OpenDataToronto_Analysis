#### Preamble ####
# Purpose: Cleans the raw occupancy and capacity data recorded in the raw dataset
# Author: Angel Xu
# Date: 23 September 2024
# Contact: anjojoo.xu@mail.utoronto.ca
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####
# Read the raw dataset
raw_data <- read_csv("data/raw_data/raw_data.csv")

# Clean and select wanted columns
cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  select(overnight_service_type, 
         service_user_count, 
         capacity_type, 
         capacity_actual_bed,
         occupied_beds,
         occupancy_rate_beds,
         capacity_actual_room,
         occupied_rooms,
         occupancy_rate_rooms)

# View the cleaned dataset (optional)
head(cleaned_data)

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
