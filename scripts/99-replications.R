#### Preamble ####
# Purpose: Replicated graphs from... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(ggplot2)
library(rstanarm)
library(bayesplot)
# [...UPDATE THIS...]

#### Load data ####
# [...ADD CODE HERE...]
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

