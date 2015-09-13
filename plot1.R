setwd("/Users/rpsandell/Desktop/Programming and Statistics/EDA/Assignment1") # set working directory where the power usage data lives

library(sqldf) # load sqldf package to use sql queries in reading in data

power.data <- read.csv.sql("household_power_consumption.txt", header=T, sep=";", sql = 'select * FROM file WHERE Date = "1/2/2007" OR Date = "2/2/2007"') # visual examination of the text file shows that semicolon is used as separating character; sql query selects only data from the range of two dates
# resulting data frame has 2880 rows

# Making Plot 1: a simple histogram
png(filename = "plot1.png")
hist(power.data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)")
dev.off()
