# tidyverse包
# PCA算法  无监督学习
# 线性降维策略

library(tidyverse)
theme_set(theme_bw(16))
library(palmerpenguins)

library(broom)
packageVersion('broom')

# 数据集检视
penguins %>% head()
penguins %>% glimpse()

# 数据清洗处理
penguins %>%
  drop_na() %>%
  select(where(is.numeric)) %>%
  select(-year) %>%
  scale() %>%
  head()

penguins %>%
  drop_na() %>%
  select(where(is.numeric)) %>%
  select(-year) %>%
  colMeans()

penguins %>%
  drop_na() %>%
  select(where(is.numeric)) %>%
  select(-year) %>%
  scale() %>%
  colMeans()


# PCA分析
pca_fit <- penguins %>%
  drop_na() %>%
  select(where(is.numeric)) %>%
  select(-year) %>%
  scale() %>%
  prcomp()

str(pca_fit)

# PCA结果
pca_fit

pca_fit %>%
  tidy("pcs")  

pca_fit %>%
  tidy("d") 

pca_fit %>%
  tidy(matrix="eigenvalues") 

# 主成分贡献度分析
pca_fit %>%
  tidy("pcs") %>%
  ggplot(aes(x=PC, y=percent))+
  geom_col(fill="dodgerblue", alpha=0.7) +
  scale_y_continuous(labels=scales::label_percent(),
                     breaks = scales::breaks_pretty(n=6))+
  labs(y= "Variance explained",
       title="Scree plot")

# 主成分贡献度的累积可视化
pca_fit %>%
  tidy("pcs") %>%
  ggplot(aes(x=PC, y=cumulative))+
  geom_point(size=4) +
  geom_line(color="dodgerblue", size=2)+
  scale_y_continuous(labels=scales::label_percent(),
                     breaks = scales::breaks_pretty(n=6))+
  labs(y= "Cumulative Variance explained",
       title="Scree plot")


pca_fit %>%
  tidy("x")
pca_fit %>%
  tidy("scores")
pca_fit %>%
  tidy("u")
pca_fit %>%
  tidy("samples")

pca_fit %>%
  tidy("v")

pca_fit %>%
  tidy("rotation")

pca_fit %>%
  tidy("loadings")

pca_fit %>%
  tidy("variables")

# PCA Plot
pca_fit %>%
  augment(penguins %>% drop_na()) %>%
  head()

pca_fit %>%
  augment(penguins %>% drop_na()) %>%
  rename_with(function(x){gsub(".fitted","",x)}) %>%
  head()

variance_exp <- pca_fit %>%  
  tidy("pcs") %>% 
  pull(percent)

pca_fit %>%
  augment(penguins %>% drop_na()) %>%
  rename_with(function(x){gsub(".fitted","",x)}) %>%
  ggplot(aes(x = PC1, y = PC2, color=species))+
  geom_point()+
  labs(x = paste0("PC1: ",round(variance_exp[1]*100), "%"),
       y = paste0("PC2: ",round(variance_exp[2]*100), "%"))


# 可视化表示

pca_fit %>%
  augment(penguins %>% drop_na()) %>%
  rename_with(function(x){gsub(".fitted","",x)}) %>%
  ggplot(aes(x = species, y = PC1, color=species))+
  geom_boxplot(outlier.shape = NA)+
  geom_jitter(width=0.15)+
  labs(y = paste0("PC1: ",round(variance_exp[1]*100), "%"))+
  theme(legend.position = "none")

pca_fit %>%
  augment(penguins %>% drop_na()) %>%
  rename_with(function(x){gsub(".fitted","",x)}) %>%
  ggplot(aes(x = species, y = PC1, color=sex))+
  geom_boxplot(outlier.shape = NA)+
  geom_point(position=position_jitterdodge())+
  labs(y = paste0("PC1: ",round(variance_exp[1]*100), "%"))+
  theme(legend.position = "top")
ggsave("./figs/PC1_vs_species_sex_PCA_with_tidyverse.png")

pca_fit %>%
  augment(penguins %>% drop_na()) %>%
  rename_with(function(x){gsub(".fitted","",x)}) %>%
  ggplot(aes(x = PC1, y = body_mass_g, color=species))+
  geom_point()+
  geom_smooth(method="lm")+
  labs(x = paste0("PC1: ",round(variance_exp[1]*100), "%"))+
  theme(legend.position = "top")
ggsave("./figs/PC1_vs_body_mass_PCA_with_tidyverse.png")


library(corrr)
pca_fit %>%
  augment(penguins %>% drop_na()) %>%
  rename_with(function(x){gsub(".fitted","",x)}) %>%
  select(-.rownames) %>%
  select(where(is.numeric)) %>%
  select(-year) %>%
  correlate() %>% 
  shave() 


library(corrr)
pca_fit %>%
  augment(penguins %>% drop_na()) %>%
  rename_with(function(x){gsub(".fitted","",x)}) %>%
  select(-.rownames) %>%
  select(where(is.numeric)) %>%
  select(-year) %>%
  correlate() %>% 
  shave() %>%
  rplot(shape = 15)+
  scale_x_discrete(guide = guide_axis(n.dodge=2)) +
  theme_bw(16)

ggsave("./figs/PCs_correlation_PCA_with_tidyverse.png", width=9, height=6)

# Refs:
# https://cmdlinetips.com/2022/12/pca-with-tidyverse/

