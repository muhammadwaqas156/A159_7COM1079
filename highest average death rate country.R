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



# Get the top 10 entities with the highest death rates
top_entities <- head(entity_death_rate, 10)

# Create a bar plot
ggplot(top_entities, aes(x = reorder(Entity, Avg_Death_Rate), y = Avg_Death_Rate)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  coord_flip() +  # Flip coordinates for better readability
  labs(title = "Top 10 Entities with Highest Average Death Rates",
       x = "Entity",
       y = "Average Death Rate (per 100,000 people)") +
  theme_minimal(base_size = 12)
