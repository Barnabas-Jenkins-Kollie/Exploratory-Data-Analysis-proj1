##before running this code, ensure working directory is set to folder containing data


##read data from file
household_powerdata <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?", header=TRUE)

##add column with POSIXct date/time

household_powerdata$DateTime <- as.POSIXct(strptime(paste(household_powerdata$Date, household_powerdata$Time), format="%d/%m/%Y %H:%M:%S"))

##filter only data containing relevant days using Date column

household_powerdata_sub <- household_powerdata[household_powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

##create plot 2 and save to jpg

png(filename = "Plot 2.png", width = 480, height = 480)
plot(household_powerdata_sub$DateTime, household_powerdata_sub$Global_active_power, type="l", xlab = NA, ylab = "Global Active Power (kilowatts)")
dev.off()