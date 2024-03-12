#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Geunchul Shin
# Date: 12 March 2024
# Contact: joey.shin@mail.utoronto.ca
# Pre-requisites: 02-data_cleaning.R
# Any other information needed? no


#### Workspace setup ####
library(tidyverse)
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

#### Test data ####
# test that issued_year is numeric
all(sapply(analysis_data$Issued_year, is.numeric))

# test for range and validity
all(analysis_data$Num_Endorsements >= 0)
all(analysis_data$Issued_year >= 2000 & analysis_data$Issued_year <= format(Sys.Date(), "%Y"))
all(analysis_data$Issue_duration > 0)

# test for missing value
!any(is.na(analysis_data$Category))
!any(is.na(analysis_data$Num_Endorsements))
!any(is.na(analysis_data$Issue_duration))