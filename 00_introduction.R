# tidyverse包介绍
# 数据科学生命周期
# 开始于用数据回答或者驱动的问题
# 结束于问题的答案或者解决方案
# 总之：始于问题，结于答案，数据驱动。

# 问题和答案这段距离，历经各种步骤
# 问题定义
# 数据层面：什么数据可以使用，数据如何获得，数据如何规整，数据如何探索
# 结果层面：生成富有洞见的可视化图形，进行数据分析和挖掘工作
# 沟通层面：与相关利益方，进行沟通和汇报，获取反馈和下一步工作
# 总之，服务客户，创造价值

# 角色：
# 我是一名数据科学家
# 这个过程下来，数据科学家的时间和精力50%-80%花费在数据准备和整理上
# 因此，掌握和熟悉数据整理技术，这是基本功
# 挑战性的工作：
# 1）数据读入操作
# 2）把数据转换为用于回答问题的合适数据格式
# 因此，如何处理好上述步骤
# 概念框架和软件包，活跃设计和出现

# R社区解决方案
# 软件包：tidyverse包
# 什么是tidyverse包
# tidyvese包，一个服务于数据科学的具有一致性的R包集合，这些包遵守和共享统一的设计哲理，
# 语法和数据结构

# tidyverse技术
# 理解tidyverse这套设计原则和哲理
# 掌握tidyverse用于数据科学工作流
# 提升数据整理的效果和效果
# 学习如何有效地处理数据

# 数据科学家工作方式变革，tidyverse包
# tidy data 这种理念
# 如何基于这种理念去组织和管理数据以有利于后续分析和建模工作

# 解决的问题：
# non-tidy 如何转换成tidy-data?
# 数据科学生命周期的概念和理解，以及应用
# 基于tidyverse生态的数据科学工作方式

# 包括下面行动
# 1 数据导入
# 2 整洁数据以服务后续的工作
# 3 探索和可视化数据
# 4 设计和构建学习模型
# 5 设计和生成可重复性报告

# 连贯统一的方式
# 与其他数据科学工具做交互和互通

# 知识点1：tidy data ----
# 核心理念 tidy data
# 1 什么是tidy data?
# 整洁的数据集都是相似的，但是每个混乱的数据集都有自己的混乱方式。Hadley Wickham
# 通过设计，整洁的数据集更容易操作，可视化，分析和建模。

# 认识数据
# 1）数据集，值的集合，每个值属于观察和变量。
# 2）观察，完整角度下的一个个实例
# 3）变量，从不同角度或者维度观察
# 4）数据来源，多源数据的概念

# tidy data 原则
# 整洁的数据集易于操作、建模和可视化。
# 整洁的数据集有着特定的结构。
# 结构构造：
# 每个变量是一列
# 每个观察是一行
# 每种观察单元类型是一个表

# 知识点2：non-tidy --> tidy ----

# library(purrr)
# library(curl)
# 
# data_files <- c(
#   "australian_marriage_law_postal_survey_2017_-_participation_final.xls",
#   "australian_marriage_law_postal_survey_2017_-_response_final.xls"
# )
# base_url <- 
#   "https://marriagesurvey.abs.gov.au/results/files/"
# 
# walk(data_files, ~curl_download(url = paste0(base_url,.), destfile = .))

# 知识点3：数据科学生命周期 ----
# importing
# tidying
# visualizing
# analyzing

# 知识点4：tidyverse生态 ----
# 1 数据导入
# tibble包
# readr包
# googlesheets4包
# readxl包
# googledrive包
# haven包
# jsonlite&xml2包
# rvest包
# httr包

# 2 数据整洁
# dplyr包
# tidyr包
# janitor包
# forcats包
# stringr包
# lubridate包
# glue包
# skimr包
# tidytext包
# purrr包

# 3 数据可视化
# ggplot2包
# kableExtra包
# ggrepel包
# cowplot包
# patchwork包
# gganimate包


# 4 数据建模
# tidymodels包 
# broom包
# infer包
# tidyverts包，tsibble，feasts和fable

# 知识点5：数据科学项目组织 ----

# 知识点6：数据科学工作流 ----








