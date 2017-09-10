dataHPC <- "household_power_consumption.txt"
data1 <- read.table(dataHPC, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Feb07 <- data1[data1$Date %in% c("1/2/2007","2/2/2007") ,]
dt <- strptime(paste(Feb07$Date, Feb07$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(Feb07$Global_active_power)
globalReactivePower <- as.numeric(Feb07$Global_reactive_power)
voltage <- as.numeric(Feb07$Voltage)
subMetering1 <- as.numeric(Feb07$Sub_metering_1)
subMetering2 <- as.numeric(Feb07$Sub_metering_2)
subMetering3 <- as.numeric(Feb07$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dt, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dt, voltage, type="l", xlab="dt", ylab="Voltage")

plot(dt, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, subMetering2, type="l", col="red")
lines(dt, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dt, globalReactivePower, type="l", xlab="dt", ylab="Global_reactive_power")

dev.off()