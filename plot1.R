# data types:        Date         Time         active_p   react_p    voltage    intensity  sub_1      sub_2      sub_3
data.colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

# read in data
all.data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ';', colClasses = data.colClasses, na.strings = '?')

# select the sample from Feb. 1/2, 2007
feb.sample <- all.data[all.data$Date == "1/2/2007" | all.data$Date == "2/2/2007",]
  # feb.sample has 2880 observations:
  # 2880 obs. / 1 obs. per minute / 60 minutes per hour = 48 hours of data, as expected

# starts the png graphics device
png(filename = "plot1.png", width = 504, height = 504, units="px", bg="transparent")

# creates the desired histogram
hist(feb.sample$Global_active_power,
    xlab = "Global Active Power (kilowatts)",
    main = "Global Active Power",
    breaks = 15,
    xlim = c(0,6),
    xaxp = c(0,6,3), # places three ticks (four, including the tick at 0) between x=0 and x=6
    col = "red")

# closes the graphics device
dev.off()