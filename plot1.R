
library(dplyr)
library(lubridate)

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "exdata_data_household_power_consumption.zip", mode = "wb")
unzip("exdata_data_household_power_consumption.zip")


largefile <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",
  colClasses = c("character","character",rep("numeric",7)))

## Filter to just Feb 1 and Feb 2 2007. Note that 
## dates are D(D)/M(M)/YYYY. 
## Then remove the large file to free up memory

table <- filter(largefile, Date == "1/2/2007"| Date == "2/2/2007" )
rm(largefile)

## add a column that saves date/time as one variable, converts to POSIXct
table <- mutate(table, DateTime = dmy_hms(paste(table$Date, table$Time)))
## Convert Date column to date  object
table$Date <- dmy(table$Date)

## PNG file, default = 480x480
png(file = "plot1.png")

hist(table$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)" )

dev.off()


