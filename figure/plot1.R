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
# Save to png file
png(filename="plot1.png", height=480, width=480)
# Create plot
hist(ConsumptionData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")
# Close file
dev.off()