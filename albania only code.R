colnames(data)
colnames(data)[colnames(data) == "Age.standardized.deaths.that.are.from.respiratory.infections.per.100.000.people..in.both.sexes.aged.all.ages"] <- "Death_Rate"
# Load necessary libraries
library(ggplot2)

# Load the dataset
data <- read.csv("5- respiratory-infection-death-rate-who-mdb.csv")
# Check column names
print(colnames(data))


names(data)[1] <- "Entity"
names(data)[2] <- "Code"
names(data)[3] <- "year"
names(data)[4] <- "Death"



# Check renaming
print(colnames(data))

# Filter data for Albania
albania_data <- subset(data, Entity == "Albania")

# Check if the Death_Rate column exists
print(head(albania_data))


# Create a histogram with a normal curve
ggplot(albania_data, aes(x = albania_data$Death)) +
  geom_histogram(aes(y = "frequency"), binwidth = 5, fill = "skyblue", color = "black", alpha = 0.7) +
  stat_function(
    fun = dnorm,
    args = list(mean = mean(albania_data$Death, na.rm = TRUE), 
                sd = sd(albania_data$Death, na.rm = TRUE)),
    color = "red",
    size = 1
  ) +
  labs(
    title = "Histogram of Respiratory Infection Death Rates in Albania with Normal Curve",
    x = "Death Rate (per 100,000)",
    y = "Frequency"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    axis.text = element_text(size = 10),
    axis.title = element_text(size = 12)
  )


print(summary(albania_data$Death_Rate))