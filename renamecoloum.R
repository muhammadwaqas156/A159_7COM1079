# Load necessary libraries
library(ggplot2)
library(dplyr)

# Read the CSV file
data <- read.csv("5- respiratory-infection-death-rate-who-mdb.csv")

# Rename columns for clarity
colnames(data) <- c("Entity", "Code", "Year", "Death_Rate")

