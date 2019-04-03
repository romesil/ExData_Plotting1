setwd("C:/Users/silvi/Desktop/Coursera/Exploratory Data Analysis")

# Reading the Data
dataFile <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Selecting only 01 and 02 February 2007:
Feb_dates <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot 1, Global Active Power
Global_active_power <- as.numeric(Feb_dates$Global_active_power)

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot1.png", width=480, height=480)
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()