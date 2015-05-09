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
png(filename="plot3.png", height=480, width=480)
# Create main plot - Sub metering 1
plot(ConsumptionData$DateTime, ConsumptionData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
# Add line - Sub metering 2
lines(ConsumptionData$DateTime, ConsumptionData$Sub_metering_2, type="l", col="Red")
# Add line - Sub metering 3
lines(ConsumptionData$DateTime, ConsumptionData$Sub_metering_3, type="l", col="Blue")
# Finally add legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("Black", "Red", "Blue"), lwd=1)
# Close file
dev.off()