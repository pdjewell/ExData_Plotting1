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

##Convert Global_active_power to numeric and subset
Global_active_power <- as.numeric(subdata$Global_active_power)

##Create Plot2 and save as PNG file
png("Plot2.png", width=480, height=480)
plot(datetime, Global_active_power, type="l",  xlab="", ylab="Global Active Power (kilowatts)")
dev.off()