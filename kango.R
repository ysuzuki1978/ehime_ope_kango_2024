#install packages(初回のみ)
install.packages("tidyverse")

#パッケージ読み込み

library(tidyverse)
library(gtsummary)



#ワーキングディレクトリ　セット
setwd("~/Dropbox/kango_kouen")

#データをクリア
rm(list=ls())


#CSVファイルの読み込み
df <- read_csv("~/Dropbox/kango_kouen/data.csv")
# CSVファイルを読み込む
data <- read_csv("path/to/your/data.csv")

# 'group'列を因子型に変換する
data <- data %>% mutate(group = as.factor(group))

# サマリーテーブルを生成する
table_summary <- data %>%
  select(group, sex, age, height, weight, pre_HR, pre_sBP, pre_dBP) %>%
  tbl_summary(by = group, 
              statistic = all_continuous() ~ "{mean} ({sd})",
              missing = "no") %>%
  add_p()

# サマリーテーブルを表示する
print(table_summary)