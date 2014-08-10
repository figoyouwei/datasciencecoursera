# ----- clear workspace and console
rm(list=ls())
cat("\014")

# ----- load dataset 
datpath <- "./CourseProject1/data/household_power_consumption.txt"
dat <- read.table(datpath,sep=";",header=TRUE,colClasses = "character")

# ----- * extract the subset from only the dates 2007-02-01 and 2007-02-02
# ----- * convert string to date and time format
# dat$dates <- as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")
library(chron) # use times function
dat$dates <- as.Date(dat$Date,format='%d/%m/%Y')
dat$times <- chron(times=dat$Time)

datplot <- dat[(dat$dates == as.Date("2007-02-01") | 
                dat$dates == as.Date("2007-02-02")),]
