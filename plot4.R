library(sqldf)
file <- "./data/household_power_consumption.txt"
data <- read.csv.sql(file,"select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",sep=";")

datetimeCombine <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(data$Global_active_power)
voltage <- as.numeric(data$Voltage)
sub1 <- as.numeric(data$Sub_metering_1)
sub2 <- as.numeric(data$Sub_metering_2)
sub3 <- as.numeric(data$Sub_metering_3)
globalReactivePower <- as.numeric(data$Global_reactive_power)

png("plot4.png")

#prepare to have 4 plots
par(mfrow = c(2,2))

#first
plot(datetimeCombine, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#second
plot(datetimeCombine, voltage, type="l", xlab="datetime", ylab="Voltage")

#third
plot(datetimeCombine, sub1, type = "l", xlab = "", ylab="Energy sub metering")
lines(datetimeCombine, sub2, type = "l",col = "red")
lines(datetimeCombine, sub3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

#fourth
plot(datetimeCombine, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()