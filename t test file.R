library(dplyr)
# Filter data for the years 2020 and 2021
df_subset <- df2 %>% filter(year == 2020 | year == 2021)
# Filter data for the years 2020 and 2021 without using %>%
df_subset <- filter(df2, year == 2020 | year == 2021)
# Base R alternative without using dplyr
df_subset <- df2[df2$year == 2020 | df2$year == 2021, ]
# Perform the t-test on Death count for these two years
t_test_result <- t.test(df_subset$Death ~ df_subset$year)
# Print the p-value and test results
print(t_test_result)