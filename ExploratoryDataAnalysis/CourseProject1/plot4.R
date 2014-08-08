# source("./CourseProject1/get_and_clean_data.R")

# open device and set panel dimensions
png(file="./CourseProject1/plot4.png",width=480, height=480)
par("mfcol"=c(2,2))
# (1,1)
datplot$Global_active_power <- as.numeric(datplot$Global_active_power)
plot(datplot$Global_active_power, type="l", col="black",  
     xlab="", ylab="Global Active Power", lwd=1, axes=FALSE)
axis(side=1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
axis(side=2, at=c(0,2,4,6), labels=c(0,2,4,6))
box()
# (2,1)
datplot$Sub_metering_1 <- as.numeric(datplot$Sub_metering_1)
datplot$Sub_metering_2 <- as.numeric(datplot$Sub_metering_2)
datplot$Sub_metering_3 <- as.numeric(datplot$Sub_metering_3)
plot(datplot$Sub_metering_1, type="l", col="black", 
     xlab="", ylab="Energy sub meeting", axes=FALSE)
lines(datplot$Sub_metering_2, type="l", col="red")
lines(datplot$Sub_metering_3, type="l", col="blue")
axis(side=1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
axis(side=2, at=c(0,10,20,30), labels=c(0,10,20,30))
legend("topright", lwd=c(2,2,2),bty="n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue")) 
box()
# (1,2)
datplot$Voltage <- as.numeric(datplot$Voltage)
plot(datplot$Voltage, type="l", col="black",  
     xlab="datetime", ylab="Voltage", lwd=1, axes=FALSE)
axis(side=1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
axis(side=2, at=c(234,238,242,246), labels=c(234,238,242,246))
box()
# (2,2)
datplot$Global_reactive_power <- as.numeric(datplot$Global_reactive_power)
plot(datplot$Global_reactive_power, type="l", col="black",  
     xlab="datetime", ylab="Global_reactive_power", lwd=1, axes=FALSE)
axis(side=1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
axis(side=2, at=seq(0.0,0.5,0.1), labels=seq(0.0,0.5,0.1))
box()
# close device
dev.off()

