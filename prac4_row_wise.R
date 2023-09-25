# 问题：按着行做汇总
# row_wise函数

# 3个关键函数
# 1）rowwise()函数
# 2）c_across()函数
# 3）rowMeans()函数

library(tidyverse)
library(gapminder)
# data_url <- "https://raw.githubusercontent.com/cmdlinetips/data/master/gapminder/gapminder_lifeExp_wide.tsv"
# gapminder_wide <- read_tsv(data_url) %>%
#   head()

names(gapminder)
gapminder1 <- gapminder %>%
  select(country:lifeExp)

# 长数据转换为宽数据
gapminder_wide <- gapminder1 %>% pivot_wider(names_from = year,names_prefix = 'lifeExp', values_from = lifeExp)
gapminder_wide %>%
  head()

# 1) 按着行统计
# 观察每个国家伴随着年限的变化，期望寿命的平均值
gapminder_wide %>%
  select(-country, -continent) %>%
  rowwise() %>%
  summarise(row_mean = mean(c_across(everything())))

# 期望寿命的均值和方差
gapminder_wide %>%
  select(-country, -continent) %>%
  rowwise() %>%
  summarise(
    row_mean = mean(c_across(everything())),
    row_variance = var(c_across(everything()))
  )

# 新增两列
# 使用mutate函数
gapminder_wide %>%
  select(-country, -continent) %>%
  rowwise() %>%
  mutate(
    row_mean = mean(c_across(everything())),
    row_variance = var(c_across(everything()))
  ) %>%
  select(row_mean, row_variance, everything())

# 对于包括类别和数值的变量
# 使用筛选法则
gapminder_wide %>%
  rowwise() %>%
  summarise(
    row_mean = mean(c_across(where(is.numeric))),
    row_variance = mean(c_across(where(is.numeric)))
  )

gapminder_wide %>%
  rowwise() %>%
  summarise(lifeExp_mean=mean(c_across(lifeExp1952:lifeExp2007))) %>%
  head()

# Base R
# rowMeans()
gapminder_wide %>%
  select(-country, -continent) %>%
  rowMeans()

# Tidyverse R
gapminder_wide %>% 
  summarise(row_mean=rowMeans(across(where(is.numeric))))


# Base R
# Tidyverse





# Refs:
# https://cmdlinetips.com/2021/06/row-wise-operations-in-r/
