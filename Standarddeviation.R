library(readr)

# Load the dataset
# Replace the file path with the location of your dataset
file_path <- "5- respiratory-infection-death-rate-who-mdb.csv"
data <- read_csv("5- respiratory-infection-death-rate-who-mdb.csv")

# Display the first few rows to understand the structure of the dataset
head(data)

# Calculate standard deviation for a specific column
Death_Rate <- "Death_Rate"
if (Death_Rate %in% colnames(data) <- c("Death_Rate")) {
  std_deviation <- sd(data[[Death_Rate]], na.rm = TRUE)
  cat("Standard Deviation of '", Death_Rate, "': ", std_deviation, "\n", sep = "")
} else {
  cat("Column '", Death_Rate, "' not found in the dataset.\n", sep = "")
}

# (Optional) Calculate standard deviation for all numeric columns
std_all <- sapply(data, function(x) if (is.numeric(x)) sd(x, na.rm = TRUE) else NA)
cat("\nStandard Deviation for all numerical columns:\n")
print(std_all)

