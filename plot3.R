#Download The File and Unzips it.
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
setwd("/Users/Robert/Desktop/DataScienceTrack")
setwd("EDA")
getwd()
download.file(url,"hpc.zip","curl")
unzip("hpc.zip")

#Loads the unzipped file as a Data Table.
library(data.table)
dt <- data.table(fread("household_power_consumption.txt"))

rawDates <- dt$Date
dates <- as.Date(rawDates,format="%d/%m/%Y")

i<- which(dates=="2007-02-01")
i<- c(i,which(dates=="2007-02-02")) 

#Makes a smaller data table of information over only the needed dates.
dtActual <- dt[i,]

dtActual$Global_active_power <- as.numeric(dtActual$Global_active_power)
dtActual$Date <- as.Date(dtActual$Date,format="%d/%m/%Y")

dateTime <- strptime(paste(dtActual$Date,dtActual$Time),"%Y-%m-%d %H:%M:%S")

#

dev.new()
plot(dateTime,dtActual$Sub_metering_1,,type="l",ylab="Energy sub metering",xlab="")
lines(dateTime,dtActual$Sub_metering_2,col=2)
lines(dateTime,dtActual$Sub_metering_3,col=4)

legend("topright", lty = 1, col = c("1", "2","4"),legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.75)

dev.copy(png,file="plot3.png")
dev.off()
