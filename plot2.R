library(lubridate)
d <- read.csv("household_power_consumption.txt", sep=";", na="?", header=TRUE)
d$Date <- dmy(d$Date)
d$Time <- hms(d$Time)
png(filename="plot2.png", width=480, height=480)
sub <- subset(d, year(Date) == 2007 & month(Date) == 2 & (day(Date) == 1 | day(Date) == 2))
sub$Date_and_time <- sub$Date + sub$Time
with(sub, plot(Date_and_time, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l"))
dev.off()