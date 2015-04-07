## Read raw data
data1 <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

data1$Date <- as.Date(data1$Date, "%d/%m/%Y") ##convert variable to R date
library(dplyr)
## filter the rows that have a date of 2007-02-01 or 2007-02-02
dates <- filter(data1, Date == "2007-02-01" | Date == "2007-02-02")

## convert "Time" variable to R time with correct date
tiempo <- paste(dates$Date, " ", dates$Time)
dates$Time <- strptime(tiempo, "%Y-%m-%d %H:%M:%S")

## initialize the plot with correct labels and add the line graph
plot(dates$Time, dates$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(dates$Time, dates$Global_active_power, type="l")

## write plot to a file
dev.copy(png, file="plot2.png")  ## create file
dev.off ## close device