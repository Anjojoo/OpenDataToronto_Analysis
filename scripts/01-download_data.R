#### Preamble ####
# Purpose: Downloads and saves the data from OpenDataToronto
# Author: Angel Xu
# Date: 24 September 2024
# Contact: anjojoo.xu@mail.utoronto.ca
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####
# Download 2021 data
raw_data_2021 <- read_csv("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/21c83b32-d5a8-4106-a54f-010dbe49f6f2/resource/df7d621d-a7a0-4854-81b9-8a6dc29d73a6/download/daily-shelter-overnight-service-occupancy-capacity-2021.csv")

# Download 2022 data
raw_data_2022 <- read_csv("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/21c83b32-d5a8-4106-a54f-010dbe49f6f2/resource/55d58477-50f5-490c-8da8-5953e3b26ca4/download/daily-shelter-overnight-service-occupancy-capacity-2022.csv")

# Download 2023 data
raw_data_2023 <- read_csv("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/21c83b32-d5a8-4106-a54f-010dbe49f6f2/resource/79723018-8dc7-4cd4-8fb4-8652376ea531/download/daily-shelter-overnight-service-occupancy-capacity-2023.csv")

# Download 2024 data
raw_data_2024 <- read_csv("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/21c83b32-d5a8-4106-a54f-010dbe49f6f2/resource/ffd20867-6e3c-4074-8427-d63810edf231/download/Daily%20shelter%20overnight%20occupancy.csv")

#### Save data ####
write_csv(raw_data_2021, "data/raw_data/raw_data_2021.csv")
write_csv(raw_data_2022, "data/raw_data/raw_data_2022.csv")
write_csv(raw_data_2023, "data/raw_data/raw_data_2023.csv")
write_csv(raw_data_2024, "data/raw_data/raw_data_2024.csv")
