library(sqldf)
file <- "./data/household_power_consumption.txt"
data <- read.csv.sql(file,"select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",sep=";")

datetimeCombine <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

sub1 <- as.numeric(data$Sub_metering_1)
sub2 <- as.numeric(data$Sub_metering_2)
sub3 <- as.numeric(data$Sub_metering_3)

png("plot3.png")
plot(datetimeCombine, sub1, type = "l", xlab = "", ylab="Energy sub metering")
lines(datetimeCombine, sub2, type = "l",col = "red")
lines(datetimeCombine, sub3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()