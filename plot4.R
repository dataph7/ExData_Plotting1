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