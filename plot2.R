#assumes data has already been read to through plot1 script

plot(table$DateTime, table$Global_active_power, type = "l",
     xlab = NULL, ylab = "Global Active Power (kilowatts)" )
