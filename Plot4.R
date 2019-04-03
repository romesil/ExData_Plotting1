setwd("C:/Users/silvi/Desktop/Coursera/Exploratory Data Analysis")

# Reading the Data
dataFile <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Selecting only 01 and 02 February 2007:
Feb_dates <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
Feb_dates_time <- strptime(paste(Feb_dates$Date, Feb_dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Plot 4, global active and reactive power, sub metering, voltage
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
Global_active_power3 <- as.numeric(Feb_dates$Global_active_power)
Global_reactive_power <- as.numeric(Feb_dates$Global_reactive_power)
Sub_metering_1 <- as.numeric(Feb_dates$Sub_metering_1)
Sub_metering_2 <- as.numeric(Feb_dates$Sub_metering_2)
Sub_metering_3 <- as.numeric(Feb_dates$Sub_metering_3)
Voltage <- as.numeric(Feb_dates$Voltage)

png("plot4.png", width=480, height=480)

# 2x2 display
par(mfrow = c(2, 2)) 

# graph 1
plot(Feb_dates_time, Global_active_power3, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# graph 2
plot(Feb_dates_time, Voltage, type="l", xlab="datetime", ylab="Voltage")
# graph 3
plot(Feb_dates_time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(Feb_dates_time, Sub_metering_2, type="l", col="red")
lines(Feb_dates_time, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  col=c("black", "red", "blue"))
# graph 4
plot(Feb_dates_time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()