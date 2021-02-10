## First set working directory
setwd("/Users/lee_saxton/Documents/Data Science Specialisation/04 Exploratory Data Analysis/Week 1/Week 1 Assignment/ExData_Plotting1/")
## Next check for data directory and create it if necessary
if (!file.exists("data")) {
  dir.create("data")
}
## Download zipped data file
fileurl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile="./data/power.zip", method="curl")
## Unzip data set
unzip("./data/power.zip")
## Next, read the data
power_all <-read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
## Convert date format, capital Y as year is in 4 digits
power_all$Date <- as.Date(power_all$Date, format="%d/%m/%Y")
## select date range 2007-02-01 to 2007-02-02
power_select <- power_all[power_all$Date >= "2007-02-01" & power_all$Date <= "2007-02-02",]
## Combine date and time columns, create a vector of date and time combined
date_time <- paste(as.Date(power_select$Date), power_select$Time)
## Now insert vector in power_select as new column
power_select$DateTime <- as.POSIXct(date_time)
## Now create plot, it is a line plot so type=l, no x label
png("plot3.png", width=480, height=480)
plot(power_select$DateTime, power_select$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(power_select$DateTime, power_select$Sub_metering_2, type="l", col="red")
lines(power_select$DateTime, power_select$Sub_metering_3, type="l", col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()
