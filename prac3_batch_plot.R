# 批量生成图片和保存图片
# 问题：基于类别变量分组，批量生成两个连续变量之间关系的散点图

# R包
library(tidyverse)
library(palmerpenguins)

penguins <- penguins %>%
  drop_na() %>%
  select(species:bill_depth_mm, sex)

penguins %>% head()

# 探索species取不同变量值，
# bill_length和bill_depth的关系

# 使用 base R 的split函数
penguins %>%
  split(.$species)

# 使用tidyverse的group_split函数
penguins %>%
  group_split(species)

# 一系列图表
# 第一步：如何生成一系列图片
# 使用purrr包的map函数
plots <- penguins %>%
  split(.$species) %>%
  map(~ggplot(.x, aes(bill_length_mm, bill_depth_mm, color=sex))+
        geom_point() +
        theme_bw(16))
plots

# 第二步：如何保存一系列图片
# 使用purrr包的pwalk函数
# 1) 创建用于保存的每个图像的名称和对应的格式，.png格式
file_names <- stringr::str_c(names(plots), ".png")
file_names

# 批量保存图片
pwalk(list(file_names, plots),
      ggsave,
      width = 8,
      height = 6,
      path = './figs/')
# 或者
plots <- penguins %>%
  split(.$species) %>%
  map(~ggplot(.x, aes(bill_length_mm, bill_depth_mm, color=sex)) + 
        geom_point()+
        theme_bw(16)+
        labs(title=.x %>% pull(species) %>% unique())) # 添加标题信息
pwalk(list(file_names, plots),
      ggsave, 
      width=8, 
      height=6,
      path = ".")

# Refs：
# https://cmdlinetips.com/2022/06/create-a-list-of-ggplot-objects-and-save-them-as-files/









