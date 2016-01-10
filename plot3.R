##download file from Web
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.txt")

##read in file and subset to appropriate dates
file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")
df <- file[file$Date %in% c("1/2/2007","2/2/2007"), ]

##start saving file
png("plot3.png", width=480, height=480)

##cast as numeric vectors so Sub_metering_x can be graphed
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
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))

dev.off()

