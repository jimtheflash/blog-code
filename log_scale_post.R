library(tidyverse)
# make some exponentially growing data
n0 <- 10 # starting point
r1 <- 1.1 # growth for group1
r2 <- 1.5 # growth for group2
r3 <- 2 # growth for group3
df <- tibble(Time = 1:20, # time points
             g1 = n0 + r1^Time,
             g2 = n0 + r2^Time,
             g3 = n0 + r3^Time) %>%
  pivot_longer(-Time, names_to = 'Group', values_to = 'Cases') # make it a long df for easier plotting

# add title
p1 <- ggplot(df, aes(Time, Cases, color = Group)) +
  geom_line(alpha = .5, size = 2) + 
  theme_minimal(base_size = 14) +
  scale_y_log10(labels = scales::comma) +
  ggtitle("Cases Over Time By Group (Log Scale)")
ggsave('p1.png', p1, height = 4.5, width = 8)

# add subtitle
p2 <- ggplot(df, aes(Time, Cases, color = Group)) +
  geom_line(alpha = .5, size = 2) + 
  theme_minimal(base_size = 14) +
  scale_y_log10(labels = scales::comma) +
  ggtitle("Cases Over Time By Group",
          subtitle = "Cases On Log Scale")
ggsave('p2.png', p2, height = 4.5, width = 8)

# make axis text bold
p3 <- ggplot(df, aes(Time, Cases, color = Group)) +
  geom_line(alpha = .5, size = 2) + 
  theme_minimal(base_size = 14) +
  scale_y_log10(labels = scales::comma) +
  ggtitle("Cases Over Time By Group (Log Scale)") +
  theme(axis.text.y = element_text(face = 'bold'))
ggsave('p3.png', p3, height = 4.5, width = 8)

# make axis text larger
p3.5 <- ggplot(df, aes(Time, Cases, color = Group)) +
  geom_line(alpha = .5, size = 2) + 
  theme_minimal(base_size = 14) +
  scale_y_log10(labels = scales::comma) +
  ggtitle("Cases Over Time By Group (Log Scale)") +
  theme(axis.text.y = element_text(face = 'bold', size = 14),
        axis.text.x = element_text(size = 14))
ggsave('p35.png', p3.5, height = 4.5, width = 8)

# make annotation
p4 <- ggplot(df, aes(Time, Cases, color = Group)) +
  geom_line(alpha = .5, size = 2) + 
  annotate('text', x = 5, y = 10000, 
           label = '*Cases on log scale', size = 6, fontface = 'italic') +
  theme_minimal(base_size = 14) +
  scale_y_log10(labels = scales::comma) +
  ggtitle("Cases Over Time By Group")
ggsave('p4.png', p4, height = 4.5, width = 8)

# make footer explaining log scale
p5 <- ggplot(df, aes(Time, Cases, color = Group)) +
  geom_line(alpha = .5, size = 2) + 
  theme_minimal(base_size = 14) +
  scale_y_log10(labels = scales::comma) +
  ggtitle("Cases Over Time By Group (Log Scale)") +
  labs(caption = "Each unit on a log scale is raised to some power;\nin this chart, major units move from 1, to 10, to 100, to 1000, to 10,000, etc.") +
  theme(plot.caption = element_text(face = 'italic', size = 11, hjust = 0),
        plot.caption.position = 'plot')
ggsave('p5.png', p5, height = 4.5, width = 8)

# title, big axis text, caption
p6 <- ggplot(df, aes(Time, Cases, color = Group)) +
  geom_line(alpha = .5, size = 2) + 
  theme_minimal(base_size = 14) +
  scale_y_log10(labels = scales::comma) +
  ggtitle("Cases Over Time By Group (Log Scale)") +
  labs(caption = "Each unit on a log scale is raised to some power;\nin this chart, major units move from 1, to 10, to 100, to 1000, to 10,000, etc.") +
  theme(axis.text = element_text(size = 14),
        axis.text.y = element_text(face = 'bold'),
        plot.caption = element_text(face = 'italic', size = 11, hjust = 0),
        plot.caption.position = 'plot')
p6
ggsave('p6.png', p6, height = 4.5, width = 8)
