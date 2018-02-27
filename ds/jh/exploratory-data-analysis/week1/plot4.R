rm(list=ls())

dat <- read.table("data/household_power_consumption.txt", header = TRUE,
                 sep = ";", stringsAsFactors = FALSE,
                 colClasses=c("character","character", 
                              rep("numeric",7)), na.strings=c('?'))

dat1<-dat[which(grepl('*/2/2007',dat[,1])),]
dat1$DateTime <- as.POSIXct(strptime(paste(dat1[,1],dat1[,2]),"%d/%m/%Y %H:%M:%S"))
dat1$Date <- as.Date(dat1$Date,format = "%d/%m/%Y")

date_condition_index<-which(dat1$Date>=as.Date('1/2/2007',format = "%d/%m/%Y")
                           & dat1$Date<=as.Date('2/2/2007',format = "%d/%m/%Y"))

dat1<-dat1[date_condition_index,]

png('plot4.png', width = 480, height = 480,units = "px")

par(mfrow=c(2,2))
plot(x=dat1$DateTime,y=dat1$Global_active_power,type="l",
     ylab = "Global Active Power(kilowatts)",xlab="datetime")

plot(x=dat1$DateTime,y=dat1$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(x=dat1$DateTime,y=dat1$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="datetime")
points(x=dat1$DateTime,y=dat1$Sub_metering_2,type="l",col='red')
points(x=dat1$DateTime,y=dat1$Sub_metering_3,type="l",col='blue')
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
       ,col=c('black','red','blue'),lty = c(1, 1, 1), bty = "n")

plot(x=dat1$DateTime,y=dat1$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

par(mfrow=c(1,1))
dev.off()