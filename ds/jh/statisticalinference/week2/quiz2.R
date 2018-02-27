
#2
pnorm(70,mean = 80,sd=10)
#3
qnorm(0.95,mean=1100,sd=75)
#4
qnorm(0.95,mean=1100,sd=75/sqrt(100))
#5
pbinom(q=4,size = 5,prob = 0.5,lower.tail = FALSE)
pbinom(q=5,size = 5,prob = 0.5,lower.tail = FALSE)

# 5 is pending
  
#6
mu<-15
sigma<-10/sqrt(100)
pnorm(16,mu,sigma)-pnorm(14,mu,sigma)
#7
mu<-0.5
sd<-1/sqrt(12*1000)

n<-1000

#8
ppois(10,lambda = 5*3)

