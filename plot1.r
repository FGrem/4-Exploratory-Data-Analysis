# Plot 1 
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
#Generates plot1.png
png(filename="./Plots/plot1.png", width=480, height=480)
hist(ConsumptionSub$Global_active_power, col="RED", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
