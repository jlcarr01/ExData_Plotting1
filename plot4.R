#assumes data has already been downloaded through plot1 script, reread data

largefile <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",
                      colClasses = c("character","character",rep("numeric",7)))
table <- filter(largefile, Date == "1/2/2007"| Date == "2/2/2007" )
rm(largefile)
table <- mutate(table, DateTime = dmy_hms(paste(table$Date, table$Time)))
table$Date <- dmy(table$Date)

## make plot
## PNG file, default = 480x480
png(file = "plot4.png")

## set up multiple frames
par(mfrow=c(2,2),mar=c(4,4,2,1))
## plot 1 (top left)
plot(table$DateTime, table$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power" )


## plot 2 (top right)
plot(table$DateTime, table$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage" )


## plot 3 (bottom left)
plot(table$DateTime, table$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy Sub Metering" )
points(table$DateTime, table$Sub_metering_2, type = "l",
       col = "red")
points(table$DateTime, table$Sub_metering_3, type = "l",
       col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), lwd = 1
            )

## plot 4 (bottom right)
plot(table$DateTime, table$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "global_reactive_power" )

dev.off()
