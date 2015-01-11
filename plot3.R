library(lubridate)
d <- read.csv("household_power_consumption.txt", sep=";", na="?", header=TRUE)
d$Date <- dmy(d$Date)
d$Time <- hms(d$Time)
png(filename="plot3.png", width=480, height=480)
sub <- subset(d, year(Date) == 2007 & month(Date) == 2 & (day(Date) == 1 | day(Date) == 2))
sub$Date_and_time <- sub$Date + sub$Time
with(sub, {
    plot(Date_and_time, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
    lines(Date_and_time, Sub_metering_2, col="red")
    lines(Date_and_time, Sub_metering_3, col="blue")
    legend('topright',
           legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
           col=c('black', 'red', 'blue'),
           lty='solid')
  })
dev.off()