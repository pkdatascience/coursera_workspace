library(datasets)
library(dplyr)
data(iris)
data(mtcars)

apply(iris[which(iris$Species=="virginica"),-5],2,mean)


apply(iris[, 1:4], 2, mean)

sapply(split(mtcars$mpg, mtcars$cyl), mean)

with(mtcars, tapply(mpg, cyl, mean))

hp<-tapply(mtcars$hp,mtcars$cyl,mean)

hp[3]-hp[1]
