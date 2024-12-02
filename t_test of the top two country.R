library(dplyr)

# Calculate mean death rate by country
country_means <- df %>%
  group_by(Country) %>%
  summarize(mean_death_rate = mean(Death, na.rm = TRUE)) %>%
  arrange(desc(mean_death_rate))

head(df)

# Select top 2 countries
top_2_countries <- head(country_means, 2)$Country

# Filter for top 2 countries
top_2_data <- df %>% filter(Country %in% top_2_countries)

# Verify data
print(unique(top_2_data$Country))

# Perform t-test
t_test_result <- t.test(Death ~ Country, data = top_2_data)
print(t_test_result)




