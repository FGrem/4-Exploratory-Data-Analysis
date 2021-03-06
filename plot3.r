# Plot 3
setwd("C:\\Estudos\\R\\Exercicios\\4-Exploratory Data Analysis") 

# download / unzip file
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file( URL, destfile = "Consumption.zip" )
unzip( "Consumption.zip" )

# read file and load on table
Consumption <- read.table( "household_power_Consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")     

# create a subset with dates between 2007-02-01 and 2007-02-02.
ConsumptionSub <- subset (Consumption, subset= Consumption$Date %in% c("1/2/2007", "2/2/2007"))
# Create a new column TimeStamp 
ConsumptionSub$TimeStamp <- paste(ConsumptionSub$Date, ConsumptionSub$Time) 
ConsumptionSub$TimeStamp <- strptime(ConsumptionSub$TimeStamp, format = "%d/%m/%Y %H:%M:%S")

#Generate plot3.png
png(filename="./Plots/plot3.png", width=480, height=480)
ylimit <- 0
ylimit[2] <- max(ConsumptionSub$Sub_metering_1, ConsumptionSub$Sub_metering_2, ConsumptionSub$Sub_metering_3)
#plot(ConsumptionSub$TimeStamp, ConsumptionSub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(ConsumptionSub$TimeStamp, ConsumptionSub$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering", ylim=ylimit)
lines(ConsumptionSub$TimeStamp, ConsumptionSub$Sub_metering_2, col="red")
lines(ConsumptionSub$TimeStamp, ConsumptionSub$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3 "), lty=1, col=c('black', 'red', 'blue'))
dev.off()
