##Please make sure you are in the same working 
#directory of the project dataset file to have a successful code execution.


#setup dependency
library(dplyr)

##read data from file
household_powerdata <- read.table("./household_power_consumption.txt", sep = ";", na.strings="?", header=TRUE)

##add column with POSIXct date/time

household_powerdata$DateTime <- as.POSIXct(strptime(paste(household_powerdata$Date, household_powerdata$Time), format="%d/%m/%Y %H:%M:%S"))


##filter only data containing relevant days using Date column
household_powerdata_sub <- filter(household_powerdata, Date == "1/2/2007" | Date == "2/2/2007")

##create plot 4
png(filename = "Plot 4.png", width = 480, height = 480)
par(mfcol = c(2, 2))

##top left plot
plot(household_powerdata_sub$DateTime, household_powerdata_sub$Global_active_power, type="l", xlab = NA, ylab = "Global Active Power")

##bottom left plot
plot(household_powerdata$DateTime, household_powerdata_sub$Sub_metering_1, type="l", xlab = NA, ylab = "Energy sub metering")
lines(household_powerdata_sub$DateTime, household_powerdata_sub$Sub_metering_2, type="l", col = "red")
lines(household_powerdata_sub$DateTime, household_powerdata_sub$Sub_metering_3, type="l", col = "blue")
legend("topright", legend = c(names(household_powerdata_sub)[7:9]), col = c("black", "red", "blue"), lty=1, cex=0.8, bty = "n")

##top right plot
plot(household_powerdata_sub$DateTime, household_powerdata_sub$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

##bottom right plot
plot(household_powerdata_sub$DateTime, household_powerdata_sub$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()