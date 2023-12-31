# tidyverse skills 
# 数据可视化技术

# 重要性分析
# 数据可视化是数据科学项目的一个重要部分
# 一方面，当数据导入和整理后，数据可视化帮你理解数据
# 另一方面，分析结束后，给相关利益人做汇报时，数据可视化帮你有效沟通

# 解决的问题
# 1 数据可视化是什么
# 2 常用的数据可视化类型

# ggplot2包
# 工业标准
# 让人满意
# 可视化图形

# 数据可视化背景
# 图形或者汇总数据的表格

# 好的可视化，通用的特点
# 1 轴标注和清晰
# 2 文字能够清晰可见
# 3 数据展示合适

# 两种可视化类型
# 探索性可视化类型，发现和理解数据潜藏的模式
# 解释性可视化类型，与他人交流见解

# 图像类型
library(tidyverse)


# 使用包自带的数据集
library(carData)

Davis <- carData::Davis

Davis %>% View

# 直方图
# 单一连续变量的分布情况

# 核密度曲线图
# 光滑曲线
# 概率密度函数

# 散点图
# 两个连续变量时，采用散点图
# 研究两个连续变量的关系

# 柱状图
# 离散变量的统计可视化

# 分组柱状图
# 堆叠柱状图

# 盒箱图
# 不同组别下，连续变量的摘要分析
# 这个组别可以是目标标记

# 线图
# 时间趋势变化的图形
# 线状图







# 从代码中学习
# 学习他人的代码，不断地输入，经过思考后，再迁移和输出

# 如何设计和生成好的图形？
# 数据分析项目，数据可视化的目标是改进对数据的理解和解读。

# 1）选择正确的图像类型
# 2）选择颜色时要用心 红绿色盲，交互
# 3）坐标轴要标注清晰的信息
# 4）确保文本可读
# 5）确保关键数字添加
# 6）确保数字和图形一致
# 7）确保对比清晰可见
# 8）确保y坐标轴从0开始
# 9）Keep is simple


library(tidyverse)

diamonds <- as_tibble(diamonds)
diamonds

# 理解元数据，弄清楚每个变量的字段含义
help("diamonds")

# 散点图
# 研究钻石重量和价格的关系
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price))


# 数据可视化
# 1 ggplot2简介
# 2 可视化增强
# 3 可视化其他

# ggplot2简介
# tidyverse的核心库
# 设计和构建强大且高度可定制的可视化
# Hadley Wickham 2015
# 图形语法
# 图形分层的概念和逻辑

library(tidyverse)
library(datasets)
library(patchwork)

data('mtcars')

# 图形语法7个要素
# 1 数据，用于可视化的数据
# 2 几何形状，用于绘制的图形类型
# 几何形状的选择，要绘制的数据和要传递的信息
# 3 Aesthetics，图形中可以看到，例如x,y轴，颜色，几何形状，透明度，线宽和类型
# 4 统计，可选项，计数或者求和，或者回归曲线拟合
# 5 坐标，笛卡尔坐标或者极坐标
# 6 Facets，同一幅图实现分组观察
# 7 Themes，装饰和美观

# ggplot2包绘图基础
# 4个问题
# 1）使用什么样的数据集？（数据获取和整理）
# 2）绘制什么样类型的图形？（依赖数据和传递信息）
# 3）坐标轴分别是什么？
# 4）图形标题是什么？

# 类似模板
# What is the dataset to be used?
ggplot(data) +
  # What kind of graphic to be plotted? (scatterplot)
  geom_point(
    # What goes on the X and Y axes?
    mapping= aes(x= X, y= Y) ) +
  # What is the title?
  ggtitle('Title for my graphic')

# 创建数据集
set.seed(1234)
df <- data.frame(
  var1 = runif(20),
  var2 = rnorm(20))
# What is the dataset to be used?
ggplot(df) +
  # What kind of graphic?
  geom_point(
    # What goes on X and Y?
    mapping= aes(x=var1, y=var2 ) ) +
  # What is the graphic title?
  ggtitle('My first ggplot2 graphic')

# 直方图
# 研究单变量的分布
# 采用了分箱技术
df <- mtcars
# What is the dataset to be used?
ggplot(df) +
  # What kind of graphic?
  geom_histogram(
    # What goes on x, what is the color, fill color and number of bins?
      mapping= aes(x= mpg), 
      bins= 5,
      color="red", 
      fill="royalblue") +
  # What is the graphic title?
  ggtitle("Histogram of Miles per Gallon")

# 备注：
# color="lightgray" and fill="royalblue" to set up the border and filling color of the bars

# 盒箱图
# 1）发现异常值
# 2）比较不同组的差异分析
# 单个连续变量的盒箱图
# Boxplot of MPG
# Dataset
ggplot( df ) +
  # Geometry, Y and filling color
  geom_boxplot( aes(y=mpg), fill="royalblue" ) +
  # title
  ggtitle("Boxplot of Miles per gallon")
# 不同组下单个连续变量的盒箱图
# Dataset
ggplot( df ) +
  # Geometry, X, Y and filling color
  geom_boxplot( aes(x= factor(vs), y=mpg), fill="royalblue" ) +
  # overwrite the X label
  labs(x="Engine shape") +
  # Title
  ggtitle("A comparison between V-shaped vs line-shaped engines
and the effect on MPG")








































# 相关资料：
# 1 https://r-graph-gallery.com/
# 2 https://datavizproject.com/
# 3 https://github.com/EmilHvitfeldt/r-color-palettes
# 4 https://lisacharlottemuth.com/2016/04/22/Colors-for-DataVis/




















