# data types:        Date         Time         active_p   react_p    voltage    intensity  sub_1      sub_2      sub_3
data.colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

# read in data
all.data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ';', colClasses = data.colClasses, na.strings = '?')

# select the sample from Feb. 1/2, 2007
feb.sample <- all.data[all.data$Date == "1/2/2007" | all.data$Date == "2/2/2007",]
  # feb.sample has 2880 observations:
  # 2880 obs. / 1 obs. per minute / 60 minutes per hour = 48 hours of data, as expected

# finds position of first Friday observation
friday.index = min(which(feb.sample$Date == "2/2/2007"))

# starts the png graphics device
png(filename = "plot3.png", width = 504, height = 504, units="px", bg="transparent")

# creates the desired line plot
plot(feb.sample$Sub_metering_1,
     type = "n", # suppresses plotting data so that lines() may be used later
     ylab = "Energy sub metering",
     xlab = "",
     xaxt = "n") # suppresses default axis ticks
lines(feb.sample$Sub_metering_1, col = "black")
lines(feb.sample$Sub_metering_2, col = "red")
lines(feb.sample$Sub_metering_3, col = "blue")
axis(side = 1, # makes default axis ticks
     labels = c("Thu", "Fri", "Sat"),
     at = c(1, friday.index, nrow(feb.sample)))
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1, # specifies line weight of legend lines
       col = c("black", "red", "blue"))

# closes the graphics device
dev.off()