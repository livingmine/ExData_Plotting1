fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="household_power_consumption.zip")
unzip(zipfile="household_power_consumption.zip")
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, as.is=TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subsetData <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

#Plot 1
png("plot1.png", width=480, height=480)
par(mar=c(4, 4, 3, 2))
histinfo <- hist(x=as.numeric(subsetData$Global_active_power), col="red", main= "", xlab="", ylab="", breaks=seq(from=0, to=8, by=0.5), xlim=c(0, 6), ylim=c(0,1200), right=FALSE, axes=FALSE)
title(main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", cex.lab=0.8, cex.main=1)
axis(side=1, at=c(0, 2, 4, 6), cex.axis=0.7)
axis(side=2,  at=seq(from=0, to=1200, by=200), cex.axis=0.7)
dev.off()
