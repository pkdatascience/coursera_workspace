rm(list=ls())
dat <- read.csv2("data/household_power_consumption.txt",sep = ";",
                 header = TRUE,stringsAsFactors = FALSE,as.is = TRUE)
dat1<-dat[which(grepl('*/2/2007',dat[,1])),]
dat1$DateTime <- as.POSIXct(strptime(paste(dat1[,1],dat1[,2]),"%d/%m/%Y %H:%M:%S"))
dat1$Date <- as.Date(dat1$Date,format = "%d/%m/%Y")

date_condition_index<-which(dat1$Date>=as.Date('1/2/2007',format = "%d/%m/%Y")
                            & dat1$Date<=as.Date('2/2/2007',format = "%d/%m/%Y"))
dat1<-dat1[date_condition_index,]
dat1$Global_active_power<-as.numeric(dat1$Global_active_power)
dat1$Global_reactive_power<-as.numeric(dat1$Global_reactive_power)
dat1$Global_intensity<-as.numeric(dat1$Global_intensity)
dat1$Sub_metering_1<-as.numeric(dat1$Sub_metering_1)
dat1$Sub_metering_2<-as.numeric(dat1$Sub_metering_2)
dat1$Sub_metering_3<-as.numeric(dat1$Sub_metering_3)

png('plot1.png', width = 480, height = 480,units = "px")
hist(dat1$Global_active_power,ylab = "Frequency",
     xlab = "Global Active Power(kilowatts)",
     main="Global Active Power",col='red')
dev.off()

