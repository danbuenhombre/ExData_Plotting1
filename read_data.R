setwd("~/dataScience/explore_data/ExData_Plotting1")
pc <- read.csv2("./household_power_consumption.txt", stringsAsFactors = FALSE)
pc$DateTime <- paste(pc$Date, pc$Time, sep="-")
pc$Date <- as.Date(pc$Date, "%d/%m/%Y")
pc$DateTime <- strptime(pc$DateTime, "%d/%m/%Y-%H:%M:%S")
pc <- subset(pc, pc$Date >= as.Date("2007-02-01") & pc$Date < as.Date("2007-02-03"))
#pc$DoW <- weekdays(pc$Date, abbreviate = TRUE)
for (i in 3:9) {
  pc[,i] <- as.numeric(pc[,i])
}

