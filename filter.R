# Load necessary libraries
library(ggplot2)
library(dplyr)

# Read the data
data <- read.csv("5- respiratory-infection-death-rate-who-mdb.csv")

# Rename the long column for simplicity
colnames(data)[4] <- "DeathRate"

# Filter the dataset for the years 1950 and 2021
filtered_data <- data %>% filter(Year %in% c(1950, 2021))

# Create a histogram for the death rates, faceted by year
ggplot(filtered_data, aes(x = DeathRate)) +
  geom_histogram(binwidth = 10, fill = "steelblue", color = "black", alpha = 0.7) +
  facet_wrap(~ Year) +
  theme_minimal() +
  labs(
    title = "Histogram of Death Rates for 1950 and 2021",
    x = "Death Rate (per 100,000 people)",
    y = "Frequency"
  )


print(filtered_data)