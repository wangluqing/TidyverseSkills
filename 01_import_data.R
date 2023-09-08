# 代码学习法
# tidyverse skills
# 数据导入

# 重要性分析：
# 把数据成功导入是任何数据科学项目的第一步，也是一个挑战性的任务。
# 在获得数据洞见之前，数据必须导入和统一为一致的格式。
# 数据分散在不同的系统，采取不同的存储格式，使用数据导入技术，实现跨系统，跨部门
# 跨格式，把数据获取和整合，以形成丰富而一致的数据生产要素资源。
# 掌握数据导入技术，服务后续的可视化，分析和建模工作。

# 知识点1：tibbles ----
# tibbles 是 data.frame的更新版和升级版。
# tibbles 是 tidyverse生态常用的数据格式。
# tibbles 和 data.frame 对比分析
# 1）变量导入是类型不发生变化，前者保持原状，后者把字符变量默认转换为因子
# 2）变量的名称保持不变
# 3）row.names()函数不可使用
# 4）输出前10行和适屏操作

# 如何创建tibbles?
library(tidyverse)
# 自定义数据集
trees
as_tibble(trees) # 数据结构转换 data.frame --> tibbles
as_tibble(trees) |> View()
as_tibble(trees) %>% 
  print(n = 5, width = Inf)
# 随机检视
as_tibble(trees) %>% slice_sample(n = 10)
as_tibble(trees) %>% slice_head(n = 5)
as_tibble(trees) %>% slice_tail(n = 5)

# 生成tibble数据结构
tibble(
  a = 1:5,
  b = 6:10,
  c = 1,
  z = (a + b)^2 + c
)


# 命名更加灵活化
tibble(
  `two words` = 1:5,
  `12` = 'numeric',
  `:)` = 'smile',
  
)

# 如何获取子集？
df <- tibble(
  a = 1:5,
  b = 6:10,
  c = 1,
  z = (a + b)^2 + c
)
# [[]]使用位置或者名称
# $使用名称

df[[4]]
df[['z']]
df$z

# 知识点2：电子表格获取 ----
# 微软或者谷歌的电子表格
# 电子表格使用行和列把信息存储在网格中
# 微软电子表格
# 数据格式：后缀名.xls或者xlsx
library(readxl)
example <- readxl_example("datasets.xlsx")
example
# 数据导入
df <- read_excel(example)
df
# 或者
df1 <- read_excel('./data/datasets.xlsx')
df1

# 获取谷歌电子表格
# 备注：没有测试通过
# install.packages("googlesheets4")
# library(googlesheets4)
# gs4_auth() # 获取权限
# googlesheets4::gs4_find()
# 
# survey_sheet <- read_sheet("https://docs.google.com/spreadsheets/d/1FN7VVKzJJyi\
# fZFY5POdz_LalGTBYaC4SLB-X9vyDnbY/", sheet = 2)

## 知识点3：CSVs



