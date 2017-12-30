##Download file and unzip
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/ElectricPowerData.zip")
unzip(zipfile="./data/ElectricPowerData.zip",exdir="./data")

##Read in data
data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subset data for dates 2007-02-02 and 2007-02-02
subdata <- subset(data,Date=="2/2/2007"|Date=="1/2/2007")

##Create Plot1 and save as PNG file
png("Plot1.png", width=480, height=480)
hist(as.numeric(subdata$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()