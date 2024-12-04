# Load necessary library
library(ggplot2)

# Load the dataset
data <- read.csv("5- respiratory-infection-death-rate-who-mdb.csv")

# Rename columns for clarity
colnames(data) <- c("Entity", "Code", "Year", "Death_Rate")

# Filter data for the years 2000 to 2015 and the specific countries
filtered_data <- subset(data, Year >= 2000 & Year <= 2015 & Entity %in% c("South Africa", "Guatemala"))


# Create the boxplot
ggplot(filtered_data, aes(x = Entity, y = Death_Rate, fill = Entity)) +
  geom_boxplot(outlier.color = "red", outlier.shape = 16, notch = FALSE) +
  stat_summary(fun = mean, geom = "point", shape = 18, color = "darkorange", size = 3) +  # Add mean as a point
  labs(title = "Boxplot of Death Rates by Country (2000-2015)",
       x = "Country",
       y = "Death Rate (per 100,000 people)") +
  theme_minimal() +
  theme(legend.position = "none")
