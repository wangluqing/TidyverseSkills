# tidyverse skills
# 统计学习|tidyverse|tidymodels
# R包

library(tidyverse)
library(ISLR2)

wage <- ISLR2::Wage

# library(tidyverse)
# remotes::install_github("taylordunn/dunnr")

library(dunnr) # My personal R package
library(patchwork) # For composing plots
extrafont::loadfonts(device = "win", quiet = TRUE)
theme_set(theme_td())
set_geom_fonts()
set_palette()


p1 <- wage %>%
  ggplot(aes(x = age, y = wage)) +
  geom_point(color = "lightgrey") +
  geom_smooth(color = "blue")
p2 <- wage %>%
  ggplot(aes(x = year, y = wage)) +
  geom_point(color = "lightgrey") +
  geom_smooth(method = "lm", color = "blue")
p3 <- wage %>%
  # Need to re-label the factor levels
  mutate(education = fct_relabel(education, ~str_extract(., "\\d"))) %>%
  ggplot(aes(x = education, y = wage)) +
  geom_boxplot(aes(fill = education)) +
  theme(legend.position = "none")
p1 + p2 + p3




# 可视化分析样例
library(dunnr)
library(ggplot2)
library(dplyr)
library(palmerpenguins)

p1 <- penguins %>%
  filter(!is.na(bill_length_mm)) %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point(aes(shape = species), size = 3, alpha = 0.5, show.legend = FALSE) +
  geom_smooth(method = "lm", formula = "y ~ x",
              se = FALSE, show.legend = FALSE) +
  scale_color_brewer(palette = "Set1") +
  labs(title = "Penguin bill dimensions",
       subtitle = "Bill length and depth for different penguin species",
       x = "Bill length (mm)", y = "Bill depth (mm)",
       color = "Penguin species", shape = "Penguin species",
       caption = "Data from the palmerpenguins package.") +
  facet_wrap(~species, nrow = 1)
p1 + theme_td()

# Refs:
# https://github.com/taylordunn/dunnr
# https://bookdown.org/taylordunn/islr-tidy-1655226885741/introduction.html
# https://bookdown.org/home/tags/tidyverse/


