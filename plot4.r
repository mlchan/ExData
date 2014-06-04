data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors =FALSE)
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

date <- as.character(as.Date(subset$Date, "%d/%m/%Y"))
dateTime <- strptime(paste(date, subset$Time), "%Y-%m-%d %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2)) 

gap <- as.numeric(subset$Global_active_power)

plot(dateTime,
     gap, 
     type="l",
     ylab="Global Active Power",
     xlab="")

gap2 <- as.numeric(subset$Voltage)

plot(dateTime, 
     gap2, 
     type="l",
     ylab="Voltage", 
     xlab="datetime")

plot(dateTime, 
     as.numeric(subset$Sub_metering_1),
     type="l",
     ylab="Energy Submetering", 
     xlab="")

lines(dateTime,
      as.numeric(subset$Sub_metering_2), 
      type="l", 
      col="red")

lines(dateTime, 
      as.numeric(subset$Sub_metering_3),
      type="l", 
      col="blue")

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=2,
       lwd =2,
       col=c("black", "red", "blue"), 
       bty = "n")

gap3 <- as.numeric(subset$Global_reactive_power)

plot(dateTime,
     gap3, 
     type="l", 
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()