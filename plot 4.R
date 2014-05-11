#Read in data
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")

str(data) #check to see if read-in successful 

#Subset data
powerConsumption= data[data$Date %in% c("1/2/2007", "2/2/2007")]

#Convert to date and time classes
powerConsumption$Date = as.Date(powerConsumption$Date, format = "%d/%m/%Y")
powerConsumption$Time = strptime(powerConsumption$Time, format = "%H:%M:%S", tz="")


###### Plot4 ######
png(file = "Plot4.png")
par(mfrow= c(2,2), mar= c(4,4,2,1))

#Plot A
with(powerConsumption, 
	 plot(Global_active_power, type= "l", 
	ylab = "Global Active Power", xlab ="", xaxt = "n"))
axis(1,at=c(1, 2880/2, 2880), labels= c("Thu", "Fri","Sat"))

#Plot C
with(powerConsumption, 
	 plot(Voltage, type= "l", xlab ="datetime", xaxt = "n"))
axis(1,at=c(1, 2880/2, 2880), labels= c("Thu", "Fri","Sat"))

#Plot B
with(powerConsumption, { 
	plot(Sub_metering_1, type= "l", ylab = "Energy Sub Metering", xlab ="", xaxt = "n")
	lines(Sub_metering_2, type= "l", col = "red")
	lines(Sub_metering_3, type= "l", col = "blue")
	})
axis(1,at=c(1, 2880/2, 2880), labels= c("Thu", "Fri","Sat"))
legend("topright", lwd = 2, col =c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty= "n")

#Plot D
with(powerConsumption, 
	 plot(Global_reactive_power, type= "l", xlab = "datetime", xaxt = "n"))
axis(1,at=c(1, 2880/2, 2880), labels= c("Thu", "Fri","Sat"))

dev.off()