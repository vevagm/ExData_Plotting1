# 1. read the data from the file 

# get the column names
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows= 1)
colNames <- names(data)
# det data just for the dates 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?", skip=66637, nrows= 2880, col.names = colNames)

# 2. Date and Time variables to Date/Time classes
data$Time <- strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S", tz = "")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")


# 3. construct the plot
plot(data$Time, data$Global_active_power, type= "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# 4. save to png. 
dev.copy(png, filename = "plot2.png", width = 480, height = 480, units = "px")
dev.off()