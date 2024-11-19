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

# Calculate mean and standard deviation of the death rates
mean_rate <- mean(top_entities$Avg_Death_Rate, na.rm = TRUE)
sd_rate <- sd(top_entities$Avg_Death_Rate, na.rm = TRUE)

# Create a histogram for Death Rates and overlay a normal curve
ggplot(data, aes(x = Death_Rate)) +
  geom_histogram(aes(y = ..density..), binwidth = 20, fill = "skyblue", color = "black", alpha = 0.7) +
  stat_function(fun = dnorm,
                args = list(mean = mean(data$Death_Rate, na.rm = TRUE),
                            sd = sd(data$Death_Rate, na.rm = TRUE)),
                color = "red", size = 1) +
  labs(title = "Histogram of Death Rates with Normal Curve",
       x = "Death Rate (per 100,000 people)",
       y = "Frequency") +
  theme_minimal(base_size = 12)
