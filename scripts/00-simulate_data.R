#### Preamble ####
# Purpose: Simulates the 
# Author: Angel Xu
# Date: 21 September 2024
# Contact: anjojoo.xu@mail.utoronto.ca
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(102)

# Set the start date and end date
start_date <- as.Date("2021-01-01")
end_date <- as.Date("2024-09-01")

# Number of occupancy & capacity data to simulate
number_of_datas <- 100

# Define each categorical variable types
overnight_service_type <- c("24-Hour Respite Site", "24-Hour Women's Drop-in", 
                            "Alternative Space Protocol", 
                            "Isolation/Recovery Site", "Motel/Hotel Shelter", 
                            "Shelter", "Top Bunk Contingency Space", 
                            "Warming Centre")
capacity_type <- c("Room Based Capacity", "Bed Based Capacity")

# Simulate data 
simulated_data <- tibble(
  id = 1:number_of_datas, 
  OCCUPANCY_DATE = as.Date(runif(n = number_of_dates, min = as.numeric(start_date), 
                                        max = as.numeric(end_date)),
  origin = "1970-01-01"),
  OVERNIGHT_SERVICE_TYPE = sample(overnight_service_type, number_of_datas, replace = TRUE), 
  SERVICE_USER_COUNT = sample(1:660, number_of_datas, replace = TRUE), 
  CAPACITY_TYPE = sample(capacity_type, number_of_datas, replace = TRUE), 
  CAPACITY_ACTUAL_BED = ifelse(CAPACITY_TYPE != "Bed Based Capacity", 0, 
                               sample(1:278, number_of_datas, replace = TRUE)), 
  OCCUPIED_BEDS = ifelse(CAPACITY_TYPE != "Bed Based Capacity", 0, 
                         sample(1:CAPACITY_ACTUAL_BED, number_of_datas, replace = TRUE)), 
  OCCUPANCY_RATE_BEDS = OCCUPIED_BEDS / CAPACITY_ACTUAL_BED * 100, 
  CAPACITY_ACTUAL_ROOM = ifelse(CAPACITY_TYPE == "Bed Based Capacity", 0, 
                                sample(1:329, number_of_datas, replace = TRUE)), 
  OCCUPIED_ROOMS = ifelse(CAPACITY_TYPE == "Bed Based Capacity", 0, 
                          sample(1:CAPACITY_ACTUAL_ROOM, number_of_datas, replace = TRUE)), 
  OCCUPANCY_RATE_ROOMS = OCCUPIED_ROOMS / CAPACITY_ACTUAL_ROOM * 100
)

#### Write_csv ####
write_csv(poll_data, file = "data/raw_data/simulated_data.csv")

