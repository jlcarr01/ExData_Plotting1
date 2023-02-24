#assumes data has already been downloaded through plot1 script, reread data

largefile <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",
                      colClasses = c("character","character",rep("numeric",7)))
table <- filter(largefile, Date == "1/2/2007"| Date == "2/2/2007" )
rm(largefile)
table <- mutate(table, DateTime = dmy_hms(paste(table$Date, table$Time)))
table$Date <- dmy(table$Date)

## make plot
## PNG file, default = 480x480
png(file = "plot3.png")

plot(table$DateTime, table$Sub_metering_1, type = "l",
     xlab = NULL, ylab = "Energy Sub Metering" )
points(table$DateTime, table$Sub_metering_2, type = "l",
       col = "red")
points(table$DateTime, table$Sub_metering_3, type = "l",
       col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), lwd = 1
            )
dev.off()
