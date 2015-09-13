## Loading necessary libraries
library(lubridate)

## Reading the full dataset 
hpcData <- read.table("I:/workspace/4/1/household_power_consumption.txt", header = TRUE, sep = ";",
                      colClasses =c(rep("character", 2), rep("numeric", 7)), na ="?")

## Subsetting the required dataset
hpc <- hpcData[hpcData$Date %in% c("1/2/2007", "2/2/2007"), ]

## Tidy up the data 
hpc$Date <- dmy(hpc$Date)

## Creaing the plot to the screen device
hist(hpcData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", col = "red")

## Copying it to png using dev.copy
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")

## Closing off the connection to screen device
dev.off()
