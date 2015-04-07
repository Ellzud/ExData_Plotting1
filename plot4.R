## Read raw data
data1 <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

data1$Date <- as.Date(data1$Date, "%d/%m/%Y") ##convert variable to R date
library(dplyr)
## filter the rows that have a date of 2007-02-01 or 2007-02-02
dates <- filter(data1, Date == "2007-02-01" | Date == "2007-02-02")

## convert "Time" variable to R time with correct date
tiempo <- paste(dates$Date, " ", dates$Time)
dates$Time <- strptime(tiempo, "%Y-%m-%d %H:%M:%S")

## call to parameters to be able to plot multiple graphs
par(mfrow= c(2,2))
## plot 1
plot(dates$Time, dates$Global_active_power, type="n", xlab="", ylab="Global Active Power")
lines(dates$Time, dates$Global_active_power, type="l")
## plot 2
plot(dates$Time, dates$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(dates$Time, dates$Voltage, type="l")
## plot 3
plot(dates$Time, dates$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(dates$Time, dates$Sub_metering_1, type="l")
lines(dates$Time, dates$Sub_metering_2, type="l", col="red")
lines(dates$Time, dates$Sub_metering_3, type="l", col="blue")
## add the legend
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty= c(1,1), ## symbols in the legend (lines)
       col= c("black", "red", "blue"),
       bty="n")
## plot 4
plot(dates$Time, dates$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(dates$Time, dates$Global_reactive_power, type="l")


## write plot to a file
dev.copy(png, file="plot4.png")  ## create file
dev.off ## close device