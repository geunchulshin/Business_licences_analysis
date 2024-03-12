#### Preamble ####
# Purpose: Replicated graphs analysis_data.csv
# Author: Geunchul Shin
# Date: 12 March 2024
# Contact: joey.shin@mail.utoronto.ca
# Pre-requisites: 02-data_cleaning.R
# Any other information needed? no


#### Workspace setup ####
library(tidyverse)
library(ggplot2)
library(rstanarm)
library(bayesplot)

#### Load data ####
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")
g <- ggplot(analysis_data, aes(x = Category, 
                              y = Issue_duration, fill=Num_Endorsements)) +
  geom_boxplot() +
  labs(title = "Licence Duration given to each 
       Category, group wise comparison", 
       x = "Category", y = "Average Licence Duration (months)") +
  theme_minimal() + coord_flip()
print(g)

first_model <- readRDS("models/first_model.rds")
pp_check(first_model)
residuals <- residuals(first_model)
predicted <- predict(first_model)
plot(predicted, residuals)

par(mfrow=c(2, 2))
first_model_lm <- readRDS("models/first_model_lm.rds")
plot(first_model_lm, ask = FALSE)

second_model <- readRDS("models/second_model.rds")
plot(second_model, ask = FALSE)

