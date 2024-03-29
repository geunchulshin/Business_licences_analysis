#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Geunchul Shin
# Date: 12 March 2024
# Contact: joey.shin@mail.utoronto.ca
# Pre-requisites: 02-data_cleaning.R
# Any other information needed? no


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(bayesplot)

#### Read data ####
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")


### Model data ####

# Fit the linear model
first_model <- stan_glm(
  formula = Issue_duration ~ Category + Num_Endorsements,
  data = analysis_data,
  family = gaussian(),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_aux = exponential(rate = 1, autoscale = TRUE),
  seed = 853
)

# Print the summary of the model
print(summary(first_model))


#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)

model <- lm(Issue_duration ~ Category + Num_Endorsements, 
            data = analysis_data)
summary(model)
saveRDS(
  model,
  file = "models/first_model_lm.rds"
)

log_model <- lm(log(Issue_duration) ~ Category + log(Num_Endorsements), 
                data = analysis_data)
summary(log_model)
saveRDS(
  log_model,
  file = "models/second_model.rds"
)