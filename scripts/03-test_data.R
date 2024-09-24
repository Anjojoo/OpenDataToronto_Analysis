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
data <- read_csv("data/raw_data/raw_data.csv")

# Test for negative numbers in numerical columns
data$SERVICE_USER_COUNT |> min() >= 0

# Test for NA in categorial columns
all(!is.na(data$OVERNIGHT_SERVICE_TYPE))
all(!is.na(data$CAPACITY_TYPE))


