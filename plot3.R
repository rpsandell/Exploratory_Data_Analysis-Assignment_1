setwd("/Users/rpsandell/Desktop/Programming and Statistics/EDA") # set working directory where the power usage data lives

library(sqldf) # load sqldf package to use sql queries in reading in data

power.data <- read.csv.sql("household_power_consumption.txt", header=T, sep=";", sql = 'select * FROM file WHERE Date = "1/2/2007" OR Date = "2/2/2007"') # visual examination of the text file shows that semicolon is used as separating character; sql query selects only data from the range of two dates
# resulting data frame has 2880 rows

# Making Plot 3: a line graph showing energy sub metering over the two-day period
png(filename = "plot3.png")
plot(1:2880, power.data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=" ", xaxt="n") #supress plotting the x-axis
lines(1:2880, power.data$Sub_metering_2, col="red")
lines(1:2880, power.data$Sub_metering_3, col="blue")
axis(side=1, at=c(0, 1441, 2880), labels=c("Thu", "Fri", "Sat")) # add label of days at x=0 (beginning of Thu), x=1441 (beginning of Fri), and x=2880 (end of Fri)
legend("topright", pch="l", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
