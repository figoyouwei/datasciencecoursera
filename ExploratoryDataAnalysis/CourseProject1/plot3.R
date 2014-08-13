source("./CourseProject1/get_and_clean_data.R")

datplot$Sub_metering_1 <- as.numeric(datplot$Sub_metering_1)
datplot$Sub_metering_2 <- as.numeric(datplot$Sub_metering_2)
datplot$Sub_metering_3 <- as.numeric(datplot$Sub_metering_3)

png(file="./CourseProject1/plot3.png",width=480, height=480)
plot(datplot$Sub_metering_1, type="l", col="black", 
     xlab="", ylab="Energy sub meeting", axes=FALSE)
lines(datplot$Sub_metering_2, type="l", col="red")
lines(datplot$Sub_metering_3, type="l", col="blue")
axis(side=1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
axis(side=2, at=c(0,10,20,30), labels=c(0,10,20,30))
legend("topright", lwd=c(2,2,2),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue")) 
box()
dev.off()