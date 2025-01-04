# Load necessary library
library(ggplot2)

# Load the dataset
data <- read.csv("5- respiratory-infection-death-rate-who-mdb.csv")

# Rename columns for clarity
colnames(data) <- c("Entity", "Code", "Year", "Death_Rate")

# Filter data for the years 2000 to 2015 and the specific countries
filtered_data <- subset(data, Year >= 2000 & Year <= 2015 & Entity %in% c("South Africa", "Guatemala"))


# Calculate the mean death rates for each country
mean_death_rates <- aggregate(Death_Rate ~ Entity, data = filtered_data, FUN = mean)
print(mean_death_rates)


# Perform wilcox test
mann_whitney_result <- wilcox.test(Death_Rate ~ Entity, data = filtered_data)
print(mann_whitney_result)

