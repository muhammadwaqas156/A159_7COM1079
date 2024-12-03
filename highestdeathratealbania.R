# Load necessary library
library(dplyr)

# Read the data
data <- read.csv("5- respiratory-infection-death-rate-who-mdb.csv")

# Rename columns for clarity
colnames(data)[4] <- "DeathRate"  # Rename the death rate column

# Filter data for Albania and the specified years
albania_data <- data %>%
  filter(Entity == "Albania" & Year >= 1987 & Year <= 2012)

# Find the highest death rate
highest_death_rate <- albania_data %>%
  summarize(
    Year = Year[which.max(DeathRate)],
    DeathRate = max(DeathRate, na.rm = TRUE)
  )

# Print the result
print(highest_death_rate)

