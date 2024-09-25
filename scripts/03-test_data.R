#### Preamble ####
# Purpose: Sanity check of the raw occupancy and capacity data
# Author: Angel Xu
# Date: 24 Spetember 2024
# Contact: anjojoo.xu@mail.utoronto.ca
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)

#### Test data ####
<<<<<<< HEAD
data <- read_csv("data/analysis_data/analysis_data.csv")

# Test for negative numbers in numerical columns
data$service_user_count |> min() >= 0
any_negative_bed<- any(data$capacity_actual_bed |> min() >= 0, na.rm = TRUE)
any_negative_room<- any(data$capacity_actual_room |> min() >= 0, na.rm = TRUE)
any_negative_rate_bed<- any(data$occupancy_rate_beds |> min() >= 0, na.rm = TRUE)
any_negative_rate_room<- any(data$occupancy_rate_rooms |> min() >= 0, na.rm = TRUE)
all(any_negative_bed, any_negative_room, any_negative_rate_bed, any_negative_rate_room)

# Test for NA in categorial columns
all(!is.na(data$overnight_service_type))
all(!is.na(data$capacity_type))
=======
data <- read_csv("data/raw_data/raw_data.csv")

# Test for negative numbers in numerical columns
data$SERVICE_USER_COUNT |> min() >= 0

# Test for NA in categorial columns
all(!is.na(data$OVERNIGHT_SERVICE_TYPE))
all(!is.na(data$CAPACITY_TYPE))
>>>>>>> origin/main


