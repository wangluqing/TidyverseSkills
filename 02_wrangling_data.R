# 数据整理
# tidy data 定义
# 1）每个变量存储在一个列中
# 2）每个观察都存储在一个行中
# 3）行列构成的每个单元格存储一个值

# 知识点1：数据重塑 ----
# 宽数据和长数据
# 1）定义
# 2）相互转换操作
# 3）方便总结和可视化，选择合适的数据形式

# 宽数据
# 每个变量有一列
# 每个观察有一行

# 长数据
# 长数据有一列记录变量的类型

# 实操
library(tidyverse)

# 自带数据集
# 使用tibble数据格式存储
airquality <- as_tibble(airquality)
airquality


# 使用tidyr包的函数
# 1）pivot_longer() 宽数据转换为长数据
# 2）pivot_wider() 长数据转换为宽数据

gathered <- airquality %>%
  pivot_longer(everything())
gathered

# 重命名列名
gathered <- airquality %>%
  pivot_longer(everything(), names_to = "variable", values_to = "value")
gathered

# 选择需要参与变换为长数据的变量名
sel_cols <- c("Ozone", "Solar.R", "Wind", "Temp")
gathered <- airquality %>%
  pivot_longer(cols = sel_cols, names_to = "variable", values_to = "value")
gathered

# pivot_wider()函数
# 长数据转换为宽数据
spread_data <- gathered %>%
  pivot_wider(names_from = "variable", values_from = "value")
spread_data

# 知识点2：数据整理 ----
# 确定合适的数据结构后（长或者宽）
# 工具库
# dplyr 包
# 核心函数集
# %>% 管道操作
# glimpse函数 数据概览函数
# filter函数 获取行
# select函数 选择列，重命名，重排序列
# rename函数 重命名列
# arrange函数 重排序行
# mutate函数 创建新的列
# group_by函数 变量分组操作
# summarize函数 数据汇总操作
# left_join函数，数据关联操作，左连接
# inner_join函数，数据关联操作，内连接
# tally函数
# count函数
# add_count函数
# add_tally函数

# tidyr包
# 核心函数集
# unite函数 多列合并
# separate函数 列的拆分

# janitor包
# 核心函数集
# clean_names函数 名字清晰
# tabyl函数 变量的总结
# get_dupes函数 识别重复的观察
# install.packages('janitor')
library(janitor)

# skimr包
# 核心函数集
# skim函数 数据汇总操作
# install.packages('skimr')
library(skimr)

# 管道操作
# 简洁有效
# 更好理解
# 举例说明
# A %>% B 等价于 B(A)

# 2.1 filter函数 ----
library(ggplot2)
glimpse(msleep)

msleep %>%
  filter(order == "Carnivora")
msleep %>%
  filter(order == "Carnivora", sleep_total > 10)
msleep %>%
  filter(order == "Carnivora" & sleep_total > 10)

# 2.2 select函数 ----
msleep %>%
  filter(order == "Carnivora" & sleep_total > 10) %>%
  select("sleep_total", "sleep_rem", "sleep_cycle")


msleep %>%
  filter(order == "Carnivora" & sleep_total > 10) %>%
  select(sleep_total, sleep_rem, sleep_cycle)

# 使用select函数做重命名操作
msleep %>%
  filter(order == "Carnivora" & sleep_total > 10) %>%
  select(total = sleep_total, rem = sleep_rem, cycle = sleep_cycle)





