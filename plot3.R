# Loading the data, class of date column set to date and storing data for the specified date only 

dataset <- read.csv(file = "household_power_consumption.txt", sep = ";")
dataset$Date <- strptime(dataset$Date, format = "%d/%m/%Y")
dataset$Date <- as.Date(dataset$Date)
data <- dataset[dataset$Date == as.Date(c("2007-02-02")) | dataset$Date == as.Date(c("2007-02-01")),]
dateTime <- paste(data$Date, data$Time)
dateTime <- strptime(dateTime, format = "%Y-%m-%d %H:%M:%S")
data$Sub_metering_1<-as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_2<-as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)



# Making required plot and saving it as PNG file with width and height set to 480 pixels

png(file = "plot3.png", width=480, height=480)

plot(dateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dateTime, data$Sub_metering_2, type = "l", col = "Red")
lines(dateTime, data$Sub_metering_3, type = "l", col = "Blue")
legend("topright", lty = 1, pch = NA, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()