setwd('/Users/guzi/Desktop/SignalDataScience/final project')

library(tm)
library(wordcloud)
library(readr)


df = read_csv("pca_words.csv"); df = df[-1]
j = 6
pdf = cbind(df["words"], df[j])
p1 = paste(head(pdf[order(pdf[2]),][["words"]], 75), collapse = " ")
p2 = paste(tail(pdf[order(pdf[2]),][["words"]], 75), collapse = " ")
vs = VectorSource(c(p2, p1))
vc = VCorpus(vs)
# help("comparison.cloud")
pal <- brewer.pal(8, "Dark2")
mat = as.matrix(TermDocumentMatrix(vc))
arr = c(paste("PC",j, "+", sep = ""), paste("PC",j, "-", sep = ""))
colnames(mat) = arr
comparison.cloud(mat, scale = c(1.2, 2), vfont=c("serif", "plain"), colors = c("brown","purple"),title.size = 1)
