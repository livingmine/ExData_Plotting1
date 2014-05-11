fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="household_power_consumption.zip")
unzip(zipfile="household_power_consumption.zip")
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, as.is=TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subsetData <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

#Plot 3
png("plot3.png", width=480, height=480)
plot(datetime, subsetData$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering", cex.lab=0.8)
lines(datetime, subsetData$Sub_metering_1, col="black")
lines(datetime, subsetData$Sub_metering_2, col="red")
lines(datetime, subsetData$Sub_metering_3, col="blue")
temp <- legend("topright", legend=c(" ", " ", " "), lty=1, xjust=1, yjust=1, text.width=strwidth("sub_metering_1"), col=c("black", "red", "blue"), cex=0.75)
text(temp$rect$left + temp$rect$w, temp$text$y, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pos=2, cex=0.75)
dev.off()
