library(sqldf)
file <- "./data/household_power_consumption.txt"
data <- read.csv.sql(file,"select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",sep=";")

datetimeCombine <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(data$Global_active_power)

png("plot2.png")
plot(datetimeCombine, globalActivePower, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()