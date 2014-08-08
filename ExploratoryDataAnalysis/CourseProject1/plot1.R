source("./CourseProject1/get_and_clean_data.R")

datplot$Global_active_power <- as.numeric(datplot$Global_active_power)

png(file="./CourseProject1//plot1.png",width=480, height=480)
hist(datplot$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (kilowatts)",ylab="Frequency",
     col="red")
dev.off()
