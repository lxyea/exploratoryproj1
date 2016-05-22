#load and filter data - can use plot1 code/data
fn <- "./data/household_power_consumption.txt"
dt <- read.table(fn, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]

#generate the date and time variable
datetime <- strptime(paste(subsdt$Date, subsdt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsdt$Global_active_power)
globalReactivePower <- as.numeric(subsdt$Global_reactive_power)
voltage <- as.numeric(subsdt$Voltage)
subMetering1 <- as.numeric(subsdt$Sub_metering_1)
subMetering2 <- as.numeric(subsdt$Sub_metering_2)
subMetering3 <- as.numeric(subsdt$Sub_metering_3)

#open the png device
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) #setup the frames parameter

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red") #overlap the lines
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power") #plot the 4th chart

dev.off() #close the device
