## Read raw data
data1 <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

data1$Date <- as.Date(data1$Date, "%d/%m/%Y") ##convert variable to R date
library(dplyr)
## filter the rows that have a date of 2007-02-01 or 2007-02-02
dates <- filter(data1, Date == "2007-02-01" | Date == "2007-02-02")

dates$Time <- strptime(dates$Time, "%H:%M:%S") ## convert variable to R time
## create the histogram
hist(dates$Global_active_power, col="red", xlab="Global Active Power (kilowatts)")