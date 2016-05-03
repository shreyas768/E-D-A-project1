x <- read.table("C:/Users/shreyas/datasciencecoursera/household_power_consumption.txt", nrows=2075259, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

y <- x[x$Date %in% c("1/2/2007", "2/2/2007"),]
y$dt <- strptime(paste(y$Date, y$Time, sep = ""), "%d/%m/%Y %H:%M:%S")


y$Sub_metering_1 <- as.numeric(y$Sub_metering_1)
y$Sub_metering_2 <- as.numeric(y$Sub_metering_2)
y$Sub_metering_3 <- as.numeric(y$Sub_metering_3)

with(y, {
  plot(y$dt, y$Sub_metering_1,  type = "l",  ylab="Global Active Power (kilowatts)", xlab="" )
  lines(y$dt, y$Sub_metering_2, type = "l", col= "Red")
  lines(y$dt, y$Sub_metering_3, type = "l",  col = 'Blue')
  
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, col=c("black", "red", "blue"))
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()

