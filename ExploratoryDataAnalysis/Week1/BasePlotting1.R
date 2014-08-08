# ----- ----- ----- ----- base plotting system ----- ----- ----- ----- # 
rm(list=ls())
cat("\014")

# ----- load annual average PM2.5 data
datpath <- "Week1/data/avgpm25.csv"
pollution <- read.csv(datpath,
                      colClasses=c("numeric","character","factor","numeric","numeric"))

# ----- simple six-number summary 
summary(pollution$pm25)

# ----- boxplot with overlay
boxplot(pollution$pm25,col="blue")
abline(h=12)

# ----- multiple boxplot
boxplot(pm25 ~ region,data=pollution, col="red")

# ----- histogram
hist(pollution$pm25,col="green",breaks=100,main="pm25")
rug(pollution$pm25)
abline(v=12,lwd=3)
abline(v=median(pollution$pm25),col="magenta",lwd=6)

# ----- barplot
barplot(table(pollution$region),col="wheat",main="number in each region")