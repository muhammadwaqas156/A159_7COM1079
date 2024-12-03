# Load necessary libraries
library(ggplot2)
library(dplyr)

# Read the data
data <- read.csv("5- respiratory-infection-death-rate-who-mdb.csv")

# Rename columns for clarity (if necessary)
colnames(data)[4] <- "DeathRate"  # Rename death rate column
colnames(data)[5] <- "Cause_of_Death"  # Ensure the column for cause of death is correctly named

# Filter data for specific years if needed
filtered_data <- data %>% filter(Year >= 2000 & Year <= 2020)  # Adjust the years as needed

# Create a boxplot grouped by cause of death
ggplot(filtered_data, aes(x = Cause_of_Death, y = DeathRate, fill = Cause_of_Death)) +
  geom_boxplot(outlier.color = "red", outlier.shape = 16, notch = FALSE) +
  stat_summary(fun = mean, geom = "point", shape = 18, color = "darkorange", size = 3) +  # Add mean as a point
  labs(
    title = "Boxplot of Death Rates by Cause of Death",
    x = "Cause of Death",
    y = "Death Rate (per 100,000 people)"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),  # Rotate x-axis labels for readability
    legend.position = "none"
  )

