# Load the data
data <- read.csv("5- respiratory-infection-death-rate-who-mdb.csv")

# Assign the death rate column to a simpler variable
data$death_rate <- as.numeric(as.character(data$Age.standardized.deaths.that.are.from.respiratory.infections.per.100.000.people..in.both.sexes.aged.all.ages))

# Filter data for a specific country (e.g., Albania)
country_data <- subset(data, Entity == "Albania")

# Calculate the mean death rate for that country
mean_death_rate_country <- mean(country_data$death_rate, na.rm = TRUE)

# Print the result
print(mean_death_rate_country)
