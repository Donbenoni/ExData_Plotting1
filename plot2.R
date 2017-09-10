dataHPC <- "household_power_consumption.txt"
data1 <- read.table(dataHPC, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Feb07 <- data1[data1$Date %in% c("1/2/2007","2/2/2007") ,]
dt <- strptime(paste(Feb07$Date, Feb07$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(Feb07$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dt, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()