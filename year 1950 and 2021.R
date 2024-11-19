# Load necessary libraries
library(ggplot2)
library(dplyr)

# Read the data
data <- read.csv("5- respiratory-infection-death-rate-who-mdb.csv")

# Rename the long column for simplicity
colnames(data)[4] <- "DeathRate"

# Filter data for the years 1950 and 2021
filtered_data <- data %>% filter(Year %in% c(1950, 2021))

# Create the boxplot
ggplot(filtered_data, aes(x = as.factor(Year), y = DeathRate)) +
  geom_boxplot(outlier.color = "red", outlier.shape = 16, outlier.size = 2) +
  theme_minimal() +
  labs(
    title = "Boxplot of Death Rates for 1950 and 2021",
    x = "Year",
    y = "Death Rate (per 100,000 people)"
  )

