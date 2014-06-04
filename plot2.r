data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors =FALSE)
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

date <- as.character(as.Date(subset$Date, "%d/%m/%Y"))
dateTime <- strptime(paste(date, subset$Time), "%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480)

gap <-as.numeric(subset$Global_active_power)
plot(dateTime,
     gap,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")
dev.off()