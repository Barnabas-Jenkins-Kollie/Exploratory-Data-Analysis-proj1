
# the data is being store/loaded in the same working directory I am working in.
##read data from file

household_powerdata <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?", header=TRUE)

#viewing the data to get a glance of what is going on.
#View(household_powerdata)

##add column with POSIXct date/time

subSetData <- household_powerdata[household_powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()