rm(list=ls())
dat <- read.csv2("data/household_power_consumption.txt",sep = ";",
                header = TRUE,stringsAsFactors = FALSE,as.is = TRUE)
dat1<-dat[which(grepl('*/2/2007',dat[,1])),]
dat1$DateTime <- as.POSIXct(strptime(paste(dat1[,1],dat1[,2]),"%d/%m/%Y %H:%M:%S"))
dat1$Date <- as.Date(dat1$Date,format = "%d/%m/%Y")

date_condition_index<-which(dat1$Date>=as.Date('1/2/2007',format = "%d/%m/%Y")
                           & dat1$Date<=as.Date('2/2/2007',format = "%d/%m/%Y"))

dat1<-dat1[date_condition_index,]

dat1$Sub_metering_1<-as.numeric(dat1$Sub_metering_1)
dat1$Sub_metering_2<-as.numeric(dat1$Sub_metering_2)
dat1$Sub_metering_3<-as.numeric(dat1$Sub_metering_3)

png('plot3.png', width = 480, height = 480,units = "px")
plot(x=dat1$DateTime,y=dat1$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="datetime")
points(x=dat1$DateTime,y=dat1$Sub_metering_2,type="l",col='red')
points(x=dat1$DateTime,y=dat1$Sub_metering_3,type="l",col='blue')
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       border='black',col=c('black','red','blue'),lty = c(1, 1, 1))
dev.off()

