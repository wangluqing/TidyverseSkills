# 问题：按列汇总
# 关键函数
# 1）across函数
# 2）colMeans()

library(tidyverse)
library(palmerpenguins)

# data_without_na <- penguins %>%
#   select(-year)%>%
#   drop_na()

penguins %>%
  select(where(is.numeric)) %>%
  summarise(across(everything(), mean))

penguins %>%
  summarise(across(where(is.numeric), mean))

penguins %>%
select(where(is.numeric)) %>% 
  colMeans(na.rm = TRUE)

