#load and filter data - can use plot1 code/data
fn <- "./data/household_power_consumption.txt"
dt <- read.table(fn, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]

#generate date and time variable
datetime <- strptime(paste(subsdt$Date, subsdt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsdt$Global_active_power)

#open the png device
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() #close the device
