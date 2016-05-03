x <- read.table("C:/Users/shreyas/datasciencecoursera/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")



y <- x[x$Date %in% c("1/2/2007","2/2/2007") ,]

q <- strptime(paste(y$Date, y$Time, sep = ""), "%d/%m/%Y %H:%M:%S")
z <- as.numeric(y$Global_active_power)

z[z %in% c("?")] <- 0


plot(q,z, type = "l", xlab="", ylab = "Global Active Power(Kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()