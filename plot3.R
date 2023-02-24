#assumes data has already been read to through plot1 script

plot(table$DateTime, table$Sub_metering_1, type = "l",
     xlab = NULL, ylab = "Energy Sub Metering" )
points(table$DateTime, table$Sub_metering_2, type = "l",
       col = "red")
points(table$DateTime, table$Sub_metering_3, type = "l",
       col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), lwd = 1
            )