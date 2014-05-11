#Read in data
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")

str(data) #check to see if read-in successful 

#Subset data
powerConsumption= data[data$Date %in% c("1/2/2007", "2/2/2007")]

#Convert to date and time classes
powerConsumption$Date = as.Date(powerConsumption$Date, format = "%d/%m/%Y")
powerConsumption$Time = strptime(powerConsumption$Time, format = "%H:%M:%S", tz="")

## Create Plot2 
png(file = "Plot2.png")

with(powerConsumption, 
	 plot(Global_active_power, type= "l", 
	ylab = "Global Active Power", xlab ="", xaxt = "n"))
axis(1,at=c(1, 2880/2, 2880), labels= c("Thu", "Fri","Sat"))

dev.off()