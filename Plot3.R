##Download file and unzip
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/ElectricPowerData.zip")
unzip(zipfile="./data/ElectricPowerData.zip",exdir="./data")

##Read in data
data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subset data for dates 2007-02-02 and 2007-02-02
subdata <- subset(data,Date=="2/2/2007"|Date=="1/2/2007")

##Combine and subset date and time
library(lubridate)
datetime <- dmy_hms(paste(subdata$Date,subdata$Time, sep=" "))

##Convert sub metering to numberic
Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)

##Create Plot3 and save as PNG file
png("Plot3.png", width=480, height=480)
plot(datetime, Sub_metering_1 , type="n",  xlab="", ylab="Energy sub metering")
lines(datetime, Sub_metering_1, type="l")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()