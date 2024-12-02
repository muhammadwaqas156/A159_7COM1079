
library(dplyr)

# Load the dataset
file_path <- "5- respiratory-infection-death-rate-who-mdb.csv"
data <- read_csv("5- respiratory-infection-death-rate-who-mdb.csv")

# Display the first few rows to understand the structure
head(data)

# Summarize deaths by region code
summary_by_region <- data %>%
  group_by(Entity) %>% # Group data by region code
  summarize(Death_Rate = sum(Deaths, na.rm = TRUE)) %>% # Summarize total deaths
  arrange(desc(Death_Rate)) # Optional: Arrange in descending order

# Print the summarized data
print(summary_by_region)

# (Optional) Save the summary to a CSV file
write_csv(summary_by_region, "summary_by_region.csv")
