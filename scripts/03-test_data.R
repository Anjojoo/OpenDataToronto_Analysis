#### Preamble ####
# Purpose: Sanity check of the raw occupancy and capacity data
# Author: Angel Xu
# Date: 24 September 2024
# Contact: anjojoo.xu@mail.utoronto.ca
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)

#### Test simulated data ####
simulated_data <- read_csv("data/raw_data/simulated_data.csv")

# Test for negative numbers in numerical columns
simulated_data$SERVICE_USER_COUNT |> min() < 0
simulated_any_negative_bed <- any(simulated_data$CAPACITY_ACTUAL_BED |> min() < 0, 
                                  na.rm = TRUE)
simulated_any_negative_room <- any(simulated_data$CAPACITY_ACTUAL_ROOM |> min() < 0, 
                                   na.rm = TRUE)
simulated_any_negative_rate_bed <- any(simulated_data$OCCUPANCY_RATE_BEDS |> min() < 0, 
                                       na.rm = TRUE)
simulated_any_negative_rate_room <- any(simulated_data$OCCUPANCY_RATE_ROOMS |> min() < 0, 
                                        na.rm = TRUE)
all(simulated_any_negative_bed, simulated_any_negative_room, 
    simulated_any_negative_rate_bed, simulated_any_negative_rate_room)

# Test for NA in categorical columns
all(is.na(simulated_data$OVERNIGHT_SERVICE_TYPE))
all(is.na(simulated_data$CAPACITY_TYPE))
all(is.na(simulated_data$Year))

#### Test cleaned data ####
data <- read_csv("data/analysis_data/analysis_data.csv")

# Test for negative numbers in numerical columns
data$service_user_count |> min() < 0
any_negative_bed <- any(data$capacity_actual_bed |> min() < 0, na.rm = TRUE)
any_negative_room <- any(data$capacity_actual_room |> min() < 0, na.rm = TRUE)
any_negative_rate_bed <- any(data$occupancy_rate_beds |> min() < 0, na.rm = TRUE)
any_negative_rate_room <- any(data$occupancy_rate_rooms |> min() < 0, na.rm = TRUE)
all(any_negative_bed, any_negative_room, any_negative_rate_bed, any_negative_rate_room)

# Test for NA in categorial columns
all(is.na(data$overnight_service_type))
all(is.na(data$capacity_type))
all(is.na(data$year))


