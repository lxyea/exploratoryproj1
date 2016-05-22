#load and filter data - can use plot1 code/data
fn <- "./data/household_power_consumption.txt"
dt <- read.table(fn, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]

#generate data and time variable
datetime <- strptime(paste(subsdt$Date, subsdt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsdt$Global_active_power)

subMetering1 <- as.numeric(subsdt$Sub_metering_1)
subMetering2 <- as.numeric(subsdt$Sub_metering_2)
subMetering3 <- as.numeric(subsdt$Sub_metering_3)

#open the device of png
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off() #close the device
