library(sqldf)
file <- "./data/household_power_consumption.txt"
data <- read.csv.sql(file,"select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",sep=";")

#datetimeCombine <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(data$Global_active_power)

png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()