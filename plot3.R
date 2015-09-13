## Loading necessary libraries
library(lubridate)

## Reading the full dataset 
hpcData <- read.table("I:/workspace/4/1/household_power_consumption.txt", header = TRUE, sep = ";",
                      colClasses =c(rep("character", 2), rep("numeric", 7)), na ="?")

## Subsetting the required dataset
hpc <- hpcData[hpcData$Date %in% c("1/2/2007", "2/2/2007"), ]

## Tidy up the data 
hpc$Date <- dmy(hpc$Date)
hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time))

##Creating the plot 
plot(hpc$Sub_metering_1~hpc$DateTime, type="l", ylab="Energy sub metering", xlab = "")
lines(hpc$Sub_metering_2~hpc$DateTime, type="l", col = "red")
lines(hpc$Sub_metering_3~hpc$DateTime, type="l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, lwd = 2)



