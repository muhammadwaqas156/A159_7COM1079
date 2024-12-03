# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the dataset
data <- read.csv("5- respiratory-infection-death-rate-who-mdb.csv")

# Rename columns for clarity
colnames(data) <- c("Entity", "Code", "Year", "Death_Rate", "Region")  # Ensure 'Region' is in the dataset

# Filter data for the years 2000 to 2015
filtered_data <- subset(data, Year >= 2000 & Year <= 2015)

# Summarize by region, including variance
region_summary <- filtered_data %>%
  group_by(Region) %>%
  summarize(
    Mean_Death_Rate = mean(Death_Rate, na.rm = TRUE),
    Variance_Death_Rate = var(Death_Rate, na.rm = TRUE),  # Variance calculation
    Median_Death_Rate = median(Death_Rate, na.rm = TRUE),
    SD_Death_Rate = sd(Death_Rate, na.rm = TRUE),
    Min_Death_Rate = min(Death_Rate, na.rm = TRUE),
    Max_Death_Rate = max(Death_Rate, na.rm = TRUE),
    Count = n()
  )

# Print summary
print(Region)

# Optional: Create a barplot for the variance of death rate by region
ggplot(region_summary, aes(x = reorder(Region, -Variance_Death_Rate), y = Variance_Death_Rate, fill = Region)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Variance in Death Rate by Region (2000-2015)",
    x = "Region",
    y = "Variance in Death Rate"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "none")

