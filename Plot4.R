# Creates a data frame with the power text file
power<-read.table("power.txt", fill=TRUE)
# Helps name the column names in the data frame "power"
colnames(power)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
power <- data.table(power)
powerFeb <- power[Date == "1/2/2007" | Date == "2/2/2007",]
powerFeb$Global_active_power <- as.numeric(powerFeb$Global_active_power)
powerFeb$Global_reactive_power <- as.numeric(powerFeb$Global_reactive_power)
powerFeb$Voltage <- as.numeric(powerFeb$Voltage)
powerFeb$Global_intensity <- as.numeric(powerFeb$Global_intensity)
powerFeb$Sub_metering_1 <- as.numeric(powerFeb$Sub_metering_1)
powerFeb$Sub_metering_2 <- as.numeric(powerFeb$Sub_metering_2)
powerFeb<-cbind(powerFeb, "DateTime" = as.POSIXct(paste(powerFeb$Date, powerFeb$Time)))
View(powerFeb)
png(filename='plot4.png', width=480, height=480, units='px')
plot(powerFeb$Global_reactive_power ~ powerFeb$DateTime, type="l", xlab="Datetime", ylab = "Global_reactive_power")
dev.off()