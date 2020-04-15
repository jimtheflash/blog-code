library(tidyverse)
set.seed(123)
# make some data
plot_data <- tibble(timepoint = 1:31,
                    x = runif(31) + 5,
                    y = runif(31) + 15,
                    z = runif(31) + 20,
                    v = 1 + (1.1^timepoint)) %>%
  pivot_longer(-timepoint, names_to = "Things to count", values_to = "vals") %>%
  mutate(`Things to count` = fct_relevel(`Things to count`, c("v", "z", "y", "x")))
# plot the data
ggplot(plot_data, aes(timepoint, vals, color = `Things to count`)) +
  geom_point() +
  geom_line() +
  theme_minimal() +
  labs(x = NULL, y = "Count", title = "Count of Things Over 31 Timepoints")
