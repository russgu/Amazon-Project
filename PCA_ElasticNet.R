setwd('/Users/guzi/Desktop/SignalDataScience/final project')

library(dplyr)
library(caret)
library(readr)
library(pROC)
library(glmnet)

df=read_csv("elastic_net.csv")
df=df[-1]
response.pca=df$response
features.pca= scale(df[1:200])

floor(nrow(features.pca)*0.9)

m = glmnet(features.pca[1:185380,], response.pca[1:185380], family = "binomial", alpha = 0, lambda = 0)
prob.pca= predict(m, s='lambda.min', newx=features.pca[185380:231725,], type="response")
r=roc(response.pca[185380:231725],prob.pca)
plot(r)


