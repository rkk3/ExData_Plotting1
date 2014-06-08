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



#
dtActual$Global_active_power <- as.numeric(dtActual$Global_active_power)

dev.new()
hist(dtActual$Global_active_power,main = "Global Active Power", xlab = "Global Active Power (Kilowatts)",col="Red")
dev.copy(png,file="plot1.png")
dev.off()
