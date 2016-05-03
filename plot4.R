x <- read.table("C:/Users/shreyas/datasciencecoursera/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")


y <- x[x$Date %in% c("1/2/2007","2/2/2007") ,]

q <- strptime(paste(y$Date, y$Time, sep = ""), "%d/%m/%Y %H:%M:%S")
z <- as.numeric(y$Global_active_power)

z[z %in% c("?")] <- 0
o <- as.numeric(y$Voltage)

y$Sub_metering_1 <- as.numeric(y$Sub_metering_1)
y$Sub_metering_2 <- as.numeric(y$Sub_metering_2)
y$Sub_metering_3 <- as.numeric(y$Sub_metering_3)

m <- as.numeric(y$Global_reactive_power)

par(mfrow = c(2,2))
plot(q,z, type = "l", xlab="", ylab = "Global Active Power(Kilowatts)")
plot(q,o, type = "l", xlab="datetime", ylab = "voltage")

with(y, {
  plot(q, y$Sub_metering_1,  type = "l",  ylab="Global Active Power (kilowatts)", xlab="" )
  lines(q, y$Sub_metering_2, type = "l", col= "Red")
  lines(q, y$Sub_metering_3, type = "l",  col = 'Blue')
  
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),   col=c("black", "red", "blue"), lty = 1, cex = 0.3, lwd=1, bty = "n" )
plot(q,m, type = "l", xlab="datetime", ylab = "Global Active Power(Kilowatts)")


dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()