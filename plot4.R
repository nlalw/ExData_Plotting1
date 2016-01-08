#Read household_power_consumption.txt file
household_data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
head(household_data)

##Read data for only two days
household_part <- household_data[household_data$Date %in% c("1/2/2007","2/2/2007"),]
head(household_part)

##read date and time column together in given format
newTime <- strptime(paste(household_part$Date, household_part$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
newTime

#combine newly formed column into main data frame
new_houshold_with_time<-cbind(household_part,newTime)
new_houshold_with_time

##Plot png graph
png("plot4.png", width=480, height=480)

attach(mtcars)
par(mfrow=c(2,2))

##First plot
plot(new_houshold_with_time$newTime, new_houshold_with_time$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

#Second Plot
plot(new_houshold_with_time$newTime, new_houshold_with_time$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")

##Thrid plot
columnlines <- c("black","red","blue")
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
plot(new_houshold_with_time$newTime, new_houshold_with_time$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
##Use lines for extra elements
lines(new_houshold_with_time$newTime, new_houshold_with_time$Sub_metering_2, type="l", col=columnlines[2], xlab="", ylab="Energy sub metering")
lines(new_houshold_with_time$newTime, new_houshold_with_time$Sub_metering_3, type="l", col=columnlines[3], xlab="", ylab="Energy sub metering")
##Add legend
legend("topright", legend = labels, col = columnlines, lty = "solid")

##Forth Plot
plot(new_houshold_with_time$newTime, new_houshold_with_time$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")


dev.off()
