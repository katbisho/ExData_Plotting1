##download file from Web
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.txt")

##read in file and subset to appropriate dates
file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")
df <- file[file$Date %in% c("1/2/2007","2/2/2007"), ]

##start saving file
png("plot2.png", width=480, height=480)

#create plot on screen device
Global_active_power <- as.numeric(df$Global_active_power)
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()