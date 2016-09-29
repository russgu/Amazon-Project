setwd('/Users/guzi/Desktop/SignalDataScience/final project')

library(dplyr)
library(caret)
library(readr)
library(pROC)
library(glmnet)

#read features and response for bag of words
features.bag=readMM("bagging_feature.mtx")
response.bag=read_csv("bagging_target.csv")
response.bag=response.bag[-1]

model = glmnet(features.bag[1:185380,], unlist(response.bag)[1:185380], family = "binomial", alpha = 1, lambda = 0)
prob.bag= predict(model, s='lambda.min', newx=features.bag[185380:231725,], type="response")
r1=roc(unlist(response.bag)[185380:231725],prob.bag)
plot(r1)



