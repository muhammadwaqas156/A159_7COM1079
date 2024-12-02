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

# Get the top 2 entities with the highest death rates
top_entities <- head(entity_death_rate, 2)

# Calculate mean and standard deviation of the death rates
mean_rate <- mean(top_entities$Avg_Death_Rate, na.rm = TRUE)
sd_rate <- sd(top_entities$Avg_Death_Rate, na.rm = TRUE)

# Total number of observations
total_obs <- nrow(data)

# Create a bar chart for the top 2 countries
ggplot(top_entities, aes(x = Entity, y = Avg_Death_Rate, fill = Entity)) +
  geom_bar(stat = "identity", color = "black", width = 0.6) +
  scale_fill_manual(values = c("orange", "skyblue")) +
  labs(
    title = "Average Death Rates for Top 2 Countries",
    x = "Country",
    y = "Death Rate (per 100,000)"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "none"
  )
