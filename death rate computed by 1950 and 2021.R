# Load necessary libraries
library(ggplot2)
library(dplyr)

# Read the data
data <- read.csv("5- respiratory-infection-death-rate-who-mdb.csv")

# Rename the long column for simplicity
colnames(data)[4] <- "DeathRate"

# Filter data for the years 1950 and 2021
filtered_data <- data %>% filter(Year %in% c(1950, 2021))

# Create a histogram with a normal distribution line, faceted by year
ggplot(filtered_data, aes(x = DeathRate)) +
  geom_histogram(aes(y = ..density..), binwidth = 10, fill = "steelblue", color = "black", alpha = 0.7) +
  stat_function(
    fun = dnorm,
    args = list(mean = mean(filtered_data$DeathRate, na.rm = TRUE),
                sd = sd(filtered_data$DeathRate, na.rm = TRUE)),
    color = "red", size = 1
  ) +
  facet_wrap(~ Year) +
  theme_minimal() +
  labs(
    title = "Histogram of Death Rates for 1950 and 2021 with Normal Distribution",
    x = "Death Rate (per 100,000 people)",
    y = "Density"
  )
