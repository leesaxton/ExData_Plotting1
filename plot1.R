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
## Now build the plot and create png
png("plot1.png", width=480, height=480)
hist(power_select$Global_active_power,breaks=15, col="red", xlab="Global Active Power (kilowats)", ylab="Frequency", main="Global Active Power")
dev.off()


