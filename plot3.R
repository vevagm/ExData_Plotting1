# 1. read the data from the file 

# get the column names
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows= 1)
colNames <- names(data)
# det data just for the dates 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?", skip=66637, nrows= 2880, col.names = colNames)

# 2. Date and Time variables to Date/Time classes
data$Time <- strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S", tz = "")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# 3. open png device
png(filename = "plot3.png", width = 480, height = 480, units = "px")

# 4. construct the plot
plot(data$Time, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab="", col = "black")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

# 5. close device 
dev.off()