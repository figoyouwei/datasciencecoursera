# ----- clear workspace and console
rm(list=ls())
cat("\014")

# ----- load dataset (set colClasses as vector if necessary)
datpath <- "./CourseProject1/data/household_power_consumption.txt"
dat <- read.csv("./CourseProject1/data/household_power_consumption.txt", header=T, 
                sep=';', na.strings="?", nrows=2075259, check.names=F, 
                stringsAsFactors=F, comment.char="", quote='\"')
# The above solution is better maybe.
# dat <- read.table(datpath,sep=";",header=TRUE,colClasses = "character") 

# ----- * extract the subset from only the dates 2007-02-01 and 2007-02-02
# ----- * convert string to date and time format
# dat$dates <- as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")
library(chron) # use times function
dat$dates <- as.Date(dat$Date,format='%d/%m/%Y')
dat$times <- chron(times=dat$Time)
datplot <- dat[(dat$dates == as.Date("2007-02-01") | dat$dates == as.Date("2007-02-02")),]

# alternative solution for subsetting
datplot <- subset(dat, subset=(dates >= "2007-02-01" & dates <= "2007-02-02"))
rm(datetime)
rm(dat)
