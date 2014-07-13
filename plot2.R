# read the data
rawdata <- read.csv("household_power_consumption.txt", sep=";", na.strings= "?", header = TRUE)

# create subsets
data1 <- subset(rawdata, rawdata$Date == '1/2/2007')
data2 <- subset(rawdata, rawdata$Date == '2/2/2007')

# row bind the data
data <- rbind(data1, data2)

# create datetime field
data$Date_Time <- paste(data$Date, data$Time, sep =" ")
# convert to actual date type
data$Date_Time <- strptime(data$Date_Time, format="%d/%m/%Y %H:%M:%S")

# create the .png file
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(data$Date_Time, data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
