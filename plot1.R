# Loading the data, class of date column set to date and storing data for the specified date only 

library(datasets)
dataset <- read.csv(file = "household_power_consumption.txt", sep = ";")
dataset$Date <- strptime(dataset$Date, format = "%d/%m/%Y")
dataset$Date <- as.Date(dataset$Date)
data <- dataset[dataset$Date == as.Date(c("2007-02-02")) | dataset$Date == as.Date(c("2007-02-01")),]
data$Global_active_power <- as.numeric(levels(data$Global_active_power))[data$Global_active_power]

# Making required plot and saving it as PNG file with width and height set to 480 pixels


hist(data$Global_active_power, xlab = "Global Active Power (Killowatts)",col = "red" , main = "Global Active Power")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
