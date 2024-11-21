# Load necessary libraries
library(ggplot2)
library(dplyr)

# Read the CSV file
data <- read.csv("5- respiratory-infection-death-rate-who-mdb.csv")

# Rename columns for clarity
colnames(data) <- c("Entity", "Code", "Year", "Death_Rate")

# Convert Death_Rate to numeric (if needed)
data$Death_Rate <- as.numeric(data$Death_Rate)

# Aggregate data: calculate mean Death_Rate by Entity
entity_death_rate <- data %>%
  group_by(Entity) %>%
  summarise(Avg_Death_Rate = mean(Death_Rate, na.rm = TRUE)) %>%
  arrange(desc(Avg_Death_Rate))



