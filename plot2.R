#assumes data has already been downloaded through plot1 script, reread data

largefile <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",
                      colClasses = c("character","character",rep("numeric",7)))
table <- filter(largefile, Date == "1/2/2007"| Date == "2/2/2007" )
rm(largefile)
table <- mutate(table, DateTime = dmy_hms(paste(table$Date, table$Time)))
table$Date <- dmy(table$Date)

## make plot
## PNG file, default = 480x480
png(file = "plot2.png")

plot(table$DateTime, table$Global_active_power, type = "l",
     xlab = NULL, ylab = "Global Active Power (kilowatts)" )
dev.off()
