# Load necessary library
library(ggplot2)

# Load the dataset
data <- read.csv("5- respiratory-infection-death-rate-who-mdb.csv")

# Rename columns for clarity
colnames(data) <- c("Entity", "Code", "Year", "Death_Rate")

# Filter data for the years 2000 to 2015 and the specific countries
filtered_data <- subset(data, Year >= 2000 & Year <= 2015 & Entity %in% c("South Africa", "Guatemala"))

# Create histograms for the two countries
ggplot(filtered_data, aes(x = Death_Rate, fill = Entity)) +
  geom_histogram(binwidth = 5, alpha = 0.7, position = "dodge", color = "black") +
  labs(title = "Histogram of Death Rates (2000-2015)",
       x = "Death Rate (per 100,000 people)",
       y = "Frequency",
       fill = "Country") +
  theme_minimal()
