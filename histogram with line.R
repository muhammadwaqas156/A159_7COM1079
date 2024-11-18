# Load necessary libraries
library(ggplot2)

# Read the data
data <- read.csv("5- respiratory-infection-death-rate-who-mdb.csv")

# Rename the long column for simplicity
colnames(data)[4] <- "DeathRate"

# Create the histogram with a normal distribution line
ggplot(data, aes(x = DeathRate)) +
  geom_histogram(aes(y = ..density..), binwidth = 10, fill = "steelblue", color = "black", alpha = 0.7) +
  stat_function(fun = dnorm, 
                args = list(mean = mean(data$DeathRate, na.rm = TRUE), 
                            sd = sd(data$DeathRate, na.rm = TRUE)), 
                color = "red", size = 1) +
  theme_minimal() +
  labs(
    title = "Histogram of Death Rates (All Years) with Normal Distribution",
    x = "Death Rate (per 100,000 people)",
    y = "Density"
  )
