#### Preamble ####
# Purpose: Cleans the raw plane data
# Author: Geunchul Shin
# Date: 12 March 2024
# Contact: joey.shin@mail.utoronto.ca
# Pre-requisites: 01-download_data.R
# Any other information needed? no

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

sel_col_remove <- c("_id", "Licence No.", "Business Phone", 
                    "Plate No.",
                    "Business Phone Ext.", "Licence Address Line 1", 
                    "Licence Address Line 2", "Licence Address Line 3", 
                    "Free Form Conditions Line 1", 
                    "Free Form Conditions Line 2",
                    "Last Record Update")

count_words <- function(text) {
  words <- strsplit(text, ";")[[1]]
  return(length(words))
}

cleaned_data <- raw_data %>% select(-one_of(sel_col_remove)) %>% 
  mutate(Conditions = sub(";$", "", Conditions)) %>% 
  mutate(Endorsements = sub(";$", "", Endorsements)) %>% 
  mutate(Endorsements = sub("x", "", Endorsements)) %>% 
  mutate(Num_Endorsements = sapply(Endorsements, count_words)) %>% 
  mutate(Issued_year = lubridate::year(Issued),
         Issued_month = lubridate::month(Issued, 
                                         label = TRUE, abbr = TRUE)) %>% 
  mutate(Cancel_year = lubridate::year(`Cancel Date`),
         Cancel_month = lubridate::month(`Cancel Date`, 
                                         label = TRUE, abbr = TRUE)) %>% 
  mutate(Issue_duration = as.numeric(difftime(`Cancel Date`, 
                                              Issued, 
                                              units = "days") / 30.44)
)

cleaned_data$Endorsements <- NULL
cleaned_data$`Operating Name` <- NULL
cleaned_data$Issued <- NULL
cleaned_data$`Client Name` <- NULL
cleaned_data$Conditions <- NULL
cleaned_data$`Cancel Date` <- NULL
cleaned_data$`Issued_month` <- NULL
cleaned_data$`Cancel_month` <- NULL
cleaned_data$`Cancel_year` <- NULL

cleaned_data <- cleaned_data %>% filter(Issued_year >= 2000) %>% 
  filter(Issue_duration >0) %>% drop_na()

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
