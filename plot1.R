x <- read.table("C:/Users/shreyas/datasciencecoursera/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
y <- x[x$Date %in% c("1/2/2007","2/2/2007") ,]

z <- as.numeric(y$Global_active_power)
na <- z[z == "?"]
z <- na.omit(z)

hist(z, col = "red", main = "Global Active Power", xlab = "Global active power(kilowatts")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()


