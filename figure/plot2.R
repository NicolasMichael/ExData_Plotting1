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
png(filename="plot2.png", height=480, width=480)
# Create plot
plot(ConsumptionData$DateTime, ConsumptionData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# Close file
dev.off()