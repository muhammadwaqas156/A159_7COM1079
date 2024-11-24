library(dplyr)
library(ggplot2)
library(forcats)


# Calculate mean death rate for each country
top_2_countries <- data %>%
  group_by(Entity) %>%
  summarise(Mean_Death_Rate = mean(Death_Rate, na.rm = TRUE)) %>%
  arrange(desc(Mean_Death_Rate)) %>%
  slice(1:2)  # Select top 2 countries

head(top_2_countries)

# Filter the dataset for only the  2 countries
filtered_data <- data %>%
  filter(Entity %in% top_2_countries$Entity)

# Plot boxplot for the  2 countries
ggplot(filtered_data, aes(x = fct_reorder(Entity, Death_Rate, .fun = mean, na.rm = TRUE), y = Death_Rate)) +
  geom_boxplot(fill = "skyblue", color = "black", outlier.color = "red", outlier.shape = 16) +
  stat_summary(fun = mean, geom = "point", shape = 18, color = "darkorange", size = 3) +  # Add mean as a point
  labs(title = "Boxplot of Death Rates for Top 2 Countries by Mean",
       x = "Country",
       y = "Death Rate (per 100,000 people)") +
  theme_minimal(base_size = 14) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10),
    plot.title = element_text(size = 16, face = "bold")
  )
