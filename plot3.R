# Read raw data - Assumes source data is in working directory
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
png("./plot3.png")

# set one chart for entire area
par(mfcol=c(1,1))

# establish the x,y range for the lines.  
# Since they're from the same data set they will have the same length
x <- range(pc$DateTime)
y <- range(pc$Sub_metering_1)
# set plot without displaying points
plot(x, y, type="n", xlab="", ylab="Energy sub metering")
# sub metering 1 in black
lines(pc$DateTime, pc$Sub_metering_1, type="l", col="black")
# sub metering 2 in red
lines(pc$DateTime, pc$Sub_metering_2, type="l", col="red")
# sub metering 3 in blue
lines(pc$DateTime, pc$Sub_metering_3, type="l", col="blue")
# Ensure border around the legend per the example given
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="o", col=c("black", "red", "blue"))

# Close file
dev.off()