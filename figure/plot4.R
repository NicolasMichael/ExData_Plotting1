# Load "sqldf" library
library(sqldf)
# Data source variable
FilePath <- "household_power_consumption.txt"
# SQL statement
SqlString <- "SELECT * FROM file WHERE Date IN ('1/2/2007','2/2/2007')"
# Load required dates
ConsumptionData <- read.csv.sql(file=FilePath, sql=SqlString, header=TRUE, sep=";", row.names=FALSE)
# Close connection
closeAllConnections()
# Create a new variable datetime 
ConsumptionData$DateTime <- strptime(paste(ConsumptionData$Date, ConsumptionData$Time), format="%d/%m/%Y %H:%M:%S")
# Save to png file
png(filename="plot4.png", height=480, width=480)
# Adjust the global graphics parameters
par(mfrow=c(2,2))
# Create plot #1 - Global Active Power
plot(ConsumptionData$DateTime, ConsumptionData$Global_active_power, type="l", xlab="", ylab="Global Active Power")
# Create plot #2 - Voltage
plot(ConsumptionData$DateTime, ConsumptionData$Voltage, type="l", xlab="datetime", ylab="Voltage")
# Create plot #3 - Enegry sub metering
plot(ConsumptionData$DateTime, ConsumptionData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
# Add line - Sub metering 2
lines(ConsumptionData$DateTime, ConsumptionData$Sub_metering_2, type="l", col="Red")
# Add line - Sub metering 3
lines(ConsumptionData$DateTime, ConsumptionData$Sub_metering_3, type="l", col="Blue")
# Finally add legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("Black", "Red", "Blue"), lwd=1, bty="n")
# Create plot #4 - Global reactive power
plot(ConsumptionData$DateTime, ConsumptionData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
# Close file
dev.off()