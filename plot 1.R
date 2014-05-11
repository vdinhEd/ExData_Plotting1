#Read in data
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")

str(data) #check to see if read-in successful 

#Subset data
powerConsumption= data[data$Date %in% c("1/2/2007", "2/2/2007")]

#Convert to date and time class
powerConsumption$Date = as.Date(powerConsumption$Date, format = "%d/%m/%Y")
powerConsumption$Time = strptime(powerConsumption$Time, format = "%H:%M:%S", tz="")

## Create Plot 1
png(file = "plot1.png")

with(powerConsumption, hist(Global_active_power, main = "Global Active Power", 
	col = "red", xlab = "Global Active Power (kilowatts)"))

dev.off()