##download file from Web
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.txt")

##read in file and subset to appropriate dates
file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")
df <- file[file$Date %in% c("1/2/2007","2/2/2007"), ]

##start saving file
png("plot4.png", width=480, height=480)

#inialize in order to have 4 plots, entered column-wise
par(mfcol = c(2,2))

##First column, first row plot
Global_active_power <- as.numeric(df$Global_active_power)
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##First column, second row plot
Sub_metering_1 <- as.numeric(df$Sub_metering_1)
Sub_metering_2 <- as.numeric(df$Sub_metering_2)
Sub_metering_3 <- as.numeric(df$Sub_metering_3)
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##initialize plot
plot(datetime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")

##add lines
lines(datetime, Sub_metering_1, type = "l")
lines(datetime, Sub_metering_2, col = "red", type = "l")
lines(datetime, Sub_metering_3, col = "blue", type = "l")

##add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), bty = "n", col = c("black", "red", "blue"))

#Second column, first row plot
Voltage <- as.numeric(df$Voltage)
plot(datetime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

#Second column, second row plot
global_reactive_power <- as.numeric(df$Global_reactive_power)
plot(datetime, global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()