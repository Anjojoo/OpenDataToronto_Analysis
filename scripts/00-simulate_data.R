#### Preamble ####
# Purpose: Simulates the occupancy and capacity data
# Author: Victoria Zheng
# Date: 21 September 2024
# Contact: victoria.zheng@mail.utoronto.ca
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(lubridate)

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
  OCCUPANCY_DATE = as.Date(runif(n = number_of_datas, min = as.numeric(start_date), 
                                        max = as.numeric(end_date)), 
  origin = "1970-01-01"), 
  Year = year(OCCUPANCY_DATE), 
  OVERNIGHT_SERVICE_TYPE = sample(overnight_service_type, number_of_datas, replace = TRUE), 
  SERVICE_USER_COUNT = rpois(n = number_of_datas, lambda = 330), 
  CAPACITY_TYPE = sample(capacity_type, number_of_datas, replace = TRUE), 
  CAPACITY_ACTUAL_BED = ifelse(CAPACITY_TYPE != "Bed Based Capacity", 0, 
                               rpois(n = number_of_datas, lambda = 150)), 
  OCCUPANCY_RATE_BEDS = ifelse(CAPACITY_TYPE != "Bed Based Capacity", 0, 
                               sample(0:100, number_of_datas, replace = TRUE)), 
  CAPACITY_ACTUAL_ROOM = ifelse(CAPACITY_TYPE == "Bed Based Capacity", 0, 
                                rpois(n = number_of_datas, lambda = 170)), 
  OCCUPANCY_RATE_ROOMS = ifelse(CAPACITY_TYPE != "Bed Based Capacity", 0, 
                                sample(0:100, number_of_datas, replace = TRUE))
)

#### Write_csv ####
write_csv(simulated_data, file = "data/raw_data/simulated_data.csv")

