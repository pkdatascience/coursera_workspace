set.seed(1234)
data<-rnorm(100)
str(data)
summary(data)


pnorm(0.05)
dnorm(0.5)


set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 1)
x1<-rnorm(10,10,20)
x2<-rnorm(10,3,3)
y <- 0.5 + 2 * x + e

y<-0.5 + 0.3*x1 + 7*x2 + e
x1<-rnorm)

plot(x,y)

library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)


summaryRprof()

set.seed(1)
rpois(5, 2)

getwd()
