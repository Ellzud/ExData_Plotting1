## Read raw data
data1 <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

data1$Date <- as.Date(data1$Date, "%d/%m/%Y") ##convert variable to R date
library(dplyr)
## filter the rows that have a date of 2007-02-01 or 2007-02-02
dates <- filter(data1, Date == "2007-02-01" | Date == "2007-02-02")

## convert "Time" variable to R time with correct date
tiempo <- paste(dates$Date, " ", dates$Time)
dates$Time <- strptime(tiempo, "%Y-%m-%d %H:%M:%S")

## initialize the plot with correct labels and add the line graphs
plot(dates$Time, dates$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(dates$Time, dates$Sub_metering_1, type="l")
lines(dates$Time, dates$Sub_metering_2, type="l", col="red")
lines(dates$Time, dates$Sub_metering_3, type="l", col="blue")

## add the legend
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty= c(1,1), ## symbols in the legend (lines)
       col= c("black", "red", "blue"),
       cex=0.6)

## write plot to a file
dev.copy(png, file="plot3.png")  ## create file
dev.off ## close device

