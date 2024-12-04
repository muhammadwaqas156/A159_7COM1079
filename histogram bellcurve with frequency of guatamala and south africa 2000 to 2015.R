# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the data
data <- read.csv("5- respiratory-infection-death-rate-who-mdb.csv")

# Rename columns for clarity
colnames(data) <- c("Entity", "Code", "Year", "Death_Rate")

# Convert Death_Rate to numeric and filter for relevant countries and years
data$Death_Rate <- as.numeric(data$Death_Rate)
filtered_data <- data %>%
  filter(Entity %in% c("Guatemala", "South Africa") & Year >= 2000 & Year <= 2015)

# Fit a normal distribution
mean_value <- mean(filtered_data$Death_Rate, na.rm = TRUE)
sd_value <- sd(filtered_data$Death_Rate, na.rm = TRUE)

# Generate the bell curve scaled for frequency
x <- seq(min(filtered_data$Death_Rate, na.rm = TRUE), max(filtered_data$Death_Rate, na.rm = TRUE), length = 32)
bin_width <- diff(range(filtered_data$Death_Rate, na.rm = TRUE)) / 20 # Approximate bin width
y <- dnorm(x, mean = mean_value, sd = sd_value) * nrow(filtered_data) * bin_width

# Plot the histogram with bell curve
ggplot(filtered_data, aes(x = Death_Rate)) +
  geom_histogram(binwidth = bin_width, fill = "skyblue", color = "black") +
  geom_line(aes(x = x, y = y), color = "red", size = 1) +
  labs(
    title = "Histogram of Respiratory Infection Death Rates\n(Guatemala & South Africa, 2000-2015)",
    x = "Death Rate per 100,000",
    y = "Frequency"
  ) +
  theme_minimal()
