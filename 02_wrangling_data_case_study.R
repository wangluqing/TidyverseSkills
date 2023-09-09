# 数据整理技术
# 案例

# R包
library(tidyverse)
library(janitor)
library(tidytext)

# 数据导入
# 使用url方式导入数据集
url <- 
  "https://d3c33hcgiwev3.cloudfront.net/Rj3GCXMzSNW9xglzM1jVpg_f5aa2a757a614dfabb12d4b73705cd65_data_complaints.csv?Expires=1678147200&Signature=USj774E41uC27xeXkIXRIRRUDTQ89f1iGnxf0MbsMTR9vjEHwtx7ZiWP34fXSL1ZdH7LjPOe~yfVBMdC5JJg3CIlXldAO1-gtD0ARxAUKt00I61WMiZuDLDtuAtJjyXwmxdxZO2awmNbKs7OwS064UvTUDKtcRbW~d4tysEBDtY_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A"

complaints <- 
  read_csv(file = url) %>% 
  clean_names()