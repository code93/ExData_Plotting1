# Loading the data, class of date column set to date and storing data for the specified date only 

dataset <- read.csv(file = "household_power_consumption.txt", sep = ";")
dataset$Date <- strptime(dataset$Date, format = "%d/%m/%Y")
dataset$Date <- as.Date(dataset$Date)
data <- dataset[dataset$Date == as.Date(c("2007-02-02")) | dataset$Date == as.Date(c("2007-02-01")),]
data$Global_active_power <- as.numeric(levels(data$Global_active_power))[data$Global_active_power]
dateTime <- paste(data$Date, data$Time)
dateTime <- strptime(dateTime, format = "%Y-%m-%d %H:%M:%S")

# Making required plot and saving it as PNG file with width and height set to 480 pixels

plot(dateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Killowatts)")


dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()