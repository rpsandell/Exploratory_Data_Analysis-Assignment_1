setwd("/Users/rpsandell/Desktop/Programming and Statistics/EDA/Assignment1") # set working directory where the power usage data lives

library(sqldf) # load sqldf package to use sql queries in reading in data

power.data <- read.csv.sql("household_power_consumption.txt", header=T, sep=";", sql = 'select * FROM file WHERE Date = "1/2/2007" OR Date = "2/2/2007"') # visual examination of the text file shows that semicolon is used as separating character; sql query selects only data from the range of two dates
# resulting data frame has 2880 rows

# Making Plot 2: a line graph showing global power usage over the two-day period
png(filename = "plot2.png")
plot(1:2880, power.data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=" ", xaxt="n") #supress plotting the x-axis
axis(side=1, at=c(0, 1441, 2880), labels=c("Thu", "Fri", "Sat")) # add label of days at x=0 (beginning of Thu), x=1441 (beginning of Fri), and x=2880 (end of Fri)
dev.off()
