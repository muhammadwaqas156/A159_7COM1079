# Load necessary library
library(ggplot2)

# Load the dataset
data <- read.csv("5- respiratory-infection-death-rate-who-mdb.csv")

# Rename columns for clarity
colnames(data) <- c("Entity", "Code", "Year", "Death_Rate")

# Filter data for the years 2000 to 2015 and specific countries
filtered_data <- subset(data, Year >= 2000 & Year <= 2015)

# Select a subset of countries (e.g., top 3 countries with most data entries)
top_countries <- unique(filtered_data$Entity)[1:3]  # Modify to select three countries
filtered_countries <- subset(filtered_data, Entity %in% top_countries)

# Create the boxplot
ggplot(filtered_countries, aes(x = Entity, y = Death_Rate, fill = Entity)) +
  geom_boxplot(outlier.color = "red", outlier.shape = 16, notch = FALSE) +
  stat_summary(fun = mean, geom = "point", shape = 18, color = "darkorange", size = 3) +  # Add mean as a point
  labs(title = "Boxplot of Death Rates by Country",
       x = "Country",
       y = "Death Rate (per 100,000 people)") +
  theme_minimal() +
  theme(legend.position = "none")

