source("./CourseProject1/get_and_clean_data.R")

datplot$Global_active_power <- as.numeric(datplot$Global_active_power)

png(file="./CourseProject1/plot2.png",width=480, height=480)
plot(datplot$Global_active_power, type="l", col="black",  
     xlab="", ylab="Global Active Power (kilowatts)", lwd=1, axes=FALSE)
axis(side=1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
axis(side=2, at=c(0,2,4,6), labels=c(0,2,4,6))
box()
dev.off()
