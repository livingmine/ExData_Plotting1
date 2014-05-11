fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="household_power_consumption.zip")
unzip(zipfile="household_power_consumption.zip")
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, as.is=TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subsetData <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

#Plot 2
png("plot2.png", width=480, height=480)
datetime <- as.POSIXlt(paste(subsetData$Date, subsetData$Time, sep=" "))
plot(datetime, subsetData$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)", cex.lab=0.8)
lines(datetime, subsetData$Global_active_power)
dev.off()