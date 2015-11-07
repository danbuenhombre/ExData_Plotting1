# Read raw data - Assumes source file is in working directory
pc <- read.csv2("./household_power_consumption.txt", stringsAsFactors = FALSE)

# Create a new DateTime variable by combining Date and Time
pc$DateTime <- paste(pc$Date, pc$Time, sep="-")

# Convert Date to a date data type
pc$Date <- as.Date(pc$Date, "%d/%m/%Y")

# Convert DateTime to a POSIX date
pc$DateTime <- strptime(pc$DateTime, "%d/%m/%Y-%H:%M:%S")

# subset only 1 Feb 2007 and 2 Feb 2007
pc <- subset(pc, pc$Date >= as.Date("2007-02-01") & pc$Date < as.Date("2007-02-03"))

# Convert the other variables to numeric
for (i in 3:9) {
  pc[,i] <- as.numeric(pc[,i])
}

# Open a png file
png("./plot1.png")

# Plot the frequency of Global Active Power in a histogram
par(mfcol=c(1,1))
hist(pc$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")

# Close the file
dev.off()