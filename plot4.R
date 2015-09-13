setwd("/Users/rpsandell/Desktop/Programming and Statistics/EDA") # set working directory where the power usage data lives

library(sqldf) # load sqldf package to use sql queries in reading in data

power.data <- read.csv.sql("household_power_consumption.txt", header=T, sep=";", sql = 'select * FROM file WHERE Date = "1/2/2007" OR Date = "2/2/2007"') # visual examination of the text file shows that semicolon is used as separating character; sql query selects only data from the range of two dates
# resulting data frame has 2880 rows

# Making Plot 4: group of four plots
png(filename = "plot4.png")
par(mfcol=c(2,2)) # 2x2 display of plots by column; reset with par(mfrow=c(1,1))
# First plot reproduces Plot 2
plot(1:2880, power.data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=" ", xaxt="n") #supress plotting the x-axis
axis(side=1, at=c(0, 1441, 2880), labels=c("Thu", "Fri", "Sat")) # add label of days at x=0 (beginning of Thu), x=1441 (beginning of Fri), and x=2880 (end of Fri)
# Second plot reproduces plot 3
plot(1:2880, power.data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=" ", xaxt="n") #supress plotting the x-axis
lines(1:2880, power.data$Sub_metering_2, col="red")
lines(1:2880, power.data$Sub_metering_3, col="blue")
axis(side=1, at=c(0, 1441, 2880), labels=c("Thu", "Fri", "Sat")) # add label of days at x=0 (beginning of Thu), x=1441 (beginning of Fri), and x=2880 (end of Fri)
# Third plot shows voltage over the two-day period
plot(1:2880, power.data$Voltage, type="l", ylab="Voltage", xlab=" ", xaxt="n")
axis(side=1, at=c(0, 1441, 2880), labels=c("Thu", "Fri", "Sat"))
# Fourth plot shows global reactive power over the two-day period
plot(1:2880, power.data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab=" ", xaxt="n")
axis(side=1, at=c(0, 1441, 2880), labels=c("Thu", "Fri", "Sat"))
dev.off()
