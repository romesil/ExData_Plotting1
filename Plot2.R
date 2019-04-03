setwd("C:/Users/silvi/Desktop/Coursera/Exploratory Data Analysis")

# Reading the Data
dataFile <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Selecting only 01 and 02 February 2007:
Feb_dates <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
Feb_dates_time <- strptime(paste(Feb_dates$Date, Feb_dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Plot 2, Global Active Power
Global_active_power2 <- as.numeric(Feb_dates$Global_active_power)

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot2.png", width=480, height=480)
plot(Feb_dates_time, Global_active_power2, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()