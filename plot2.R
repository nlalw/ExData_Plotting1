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
png("plot2.png", width=480, height=480)
plot(new_houshold_with_time$newTime, new_houshold_with_time$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()