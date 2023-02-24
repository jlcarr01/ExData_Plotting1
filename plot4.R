#assumes data has already been read to through plot1 script

par(mfrow=c(2,2),mar=c(4,4,2,1))
## plot 1 (top left)
plot(table$DateTime, table$Global_active_power, type = "l",
     xlab = NULL, ylab = "Global Active Power (kilowatts)" )


## plot 2 (top right)
plot(table$DateTime, table$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage" )


## plot 3 (bottom left)
plot(table$DateTime, table$Sub_metering_1, type = "l",
     xlab = NULL, ylab = "Energy Sub Metering" )
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
