# get the data and load it to the r studio
df <- read.csv('student-mat.csv', sep = ";")
head(df)
str(df)
library(ggplot2)
library(ggthemes)
library(dplyr)
library(corrplot)

install.packages("seriation")
install.packages('corrgram', dependencies = TRUE) ## installed locally
library(corrgram)
library(dendextend)
library(corrplot)
library(mclust)
install.packages("drat", repos="https://cran.rstudio.com")
drat:::addRepo("dmlc")
install.packages("mxnet")
kernlab, gap, prabclus, fpc, dendextend, seriation,


# Num only
num.col <- sapply (df,is.numeric)
num.col

#To look how many NA we have
sapply(df, function(x) sum(is.na(x)))

# I want to see the correlations bitween of the numeric colomn in data
# filter
cor.data <- cor(df[, num.col])
print(cor.data)

#  let's try corrgram for making plot
print(corrplot(cor.data))
print(corrplot(cor.data, method = 'color'))

## to make corrgram
corrgram(df)
