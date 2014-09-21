rm(list=ls())
cat("\014")

# ----- Question 1:
# 2013-11-07T13:25:07Z

# ----- Question 2:
## download csv 
# urlQ2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
# download.file(urlQ2,destfile="./Quiz2/Q2.csv",method="curl")

## read Q2 data as df
dataQ2 <- read.table("./Quiz2/Q2.csv",sep=",",header=TRUE)

## use sqldf package to query 
library("sqldf")
resultQ2 <- sqldf("select pwgtp1 from dataQ2 where AGEP < 50")


# ----- Question 3:
resultQ3 <- sqldf("select distinct AGEP from dataQ2")
resultQ3r <- unique(dataQ2$AGEP)


# ----- Question 4:
urlQ4 <- "http://biostat.jhsph.edu/~jleek/contact.html"
conQ4 <- url(urlQ4)
htmlCode = readLines(conQ4)
close(con)
iLines <- c(10,20,30,100)
sapply(htmlCode[iLines],nchar)

# ----- Question 5: there is a problem with this question (the correct answer is 32426.7)
dataQ5 <- read.fwf(
    file=url("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"),
    skip=4,
    widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))
sum(dataQ5[,6])