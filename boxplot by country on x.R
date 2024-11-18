ggplot(data, aes(x = Entity, y = DeathRate)) +
  geom_boxplot(outlier.color = "red", outlier.shape = 16, outlier.size = 2) +
  theme_minimal() +
  labs(
    title = "Boxplot of Death Rates by Country",
    x = "Country",
    y = "Death Rate (per 100,000 people)"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Rotate country names
