library(dplyr)
# Filter data for the years 2020 and 2021 without using %>%
df2_subset <- filter(df, year == 1950 | year == 2021)
# Base R alternative without using dplyr
df_subset <- df2_subset[df2_subset$year == 1950 | df2_subset$year == 2021, ]
# Perform the t-test on Death count for these two years
t_test_result <- t.test(df_subset$Death ~ df_subset$year)
# Print the p-value and test results
print(t_test_result)



wilcox.test(df_subset$Death ~ df_subset$year) # for non parametric data
          