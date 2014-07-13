# read the data
rawdata <- read.csv("household_power_consumption.txt", sep=";", na.strings= "?", header = TRUE)

# create subsets
data1 <- subset(rawdata, rawdata$Date == '1/2/2007')
data2 <- subset(rawdata, rawdata$Date == '2/2/2007')

# row bind the data
data <- rbind(data1, data2)

# create a datetime field
data$Date_Time <- paste(data$Date, data$Time, sep =" ")
data$Date_Time <- strptime(data$Date_Time, format="%d/%m/%Y %H:%M:%S")

# create the .png
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
