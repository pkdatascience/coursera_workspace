library(manipulate)
library(ggplot2)
library(UsingR)
data(galton)
myHist<-function(mu){
  mse <- mean((galton$child-mu)^2)
  g<-ggplot(galton,aes(x=child)) + geom_histogram(fill="salmon" , color="black",binwidth=1)
  g <- g+geom_vline(xintercept=mu, size = 3)
  g <- g + ggtitle(paste("mu= ", mu,", MSE =",round(mse,2),sep="") )
  g
}

manipulate(myHist(mu),mu=slider(62,74,step=0.5))

x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)

mu<-sum(w*x)/sum(w)
sum(w*(x-mu)^2)

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

coef(lm(y~x-1))


#Do data(mtcars) from the datasets package and fit the regression model with mpg 
#as the outcome and weight as the predictor. Give the slope coefficient.
data(mtcars)
coef(lm(mtcars,formula = mpg~wt))[2]
cor(mtcars$mpg,mtcars$wt)*sd(mtcars$mpg)/sd(mtcars$wt)

x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
(x-mean(x))/sd(x)


x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
coef(lm(y~x))

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)

mean(x)