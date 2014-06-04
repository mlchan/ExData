data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors =FALSE)
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot1.png", width = 480, height = 480)

gap <-as.numeric(subset$Global_active_power)

hist(gap, 
     col="red", 
     main = "Global Active Power",
     ylab="Frequency",
     xlab="Global Active Power (kilowatts)")
dev.off()