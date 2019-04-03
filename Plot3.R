setwd("C:/Users/silvi/Desktop/Coursera/Exploratory Data Analysis")

# Reading the Data
dataFile <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Selecting only 01 and 02 February 2007:
Feb_dates <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
Feb_dates_time <- strptime(paste(Feb_dates$Date, Feb_dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Plot 3, Energy Sub Metering
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
Sub_metering_1 <- as.numeric(Feb_dates$Sub_metering_1)
Sub_metering_2 <- as.numeric(Feb_dates$Sub_metering_2)
Sub_metering_3 <- as.numeric(Feb_dates$Sub_metering_3)

png("plot3.png", width=480, height=480)
 plot(Feb_dates_time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(Feb_dates_time, Sub_metering_2, type="l", col="red")
lines(Feb_dates_time, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  col=c("black", "red", "blue"))
dev.off()