rm(list=ls())
cat("\014")

# ----- Question 1:
dataQ1 <- read.table("./Quiz4/Q1.csv",sep=",",header=TRUE)
varNames <- names(dataQ1)

# ----- Question 2:
## load data
countriesGDP <- read.csv("./Quiz4/countriesGDP.csv",head=TRUE)
## change variable names
library(data.table)
setnames(countriesGDP, "X", "ShortCode")
setnames(countriesGDP, "Gross.domestic.product.2012", "GDP.Ranking")
setnames(countriesGDP, "X.2", "Long.Name")
setnames(countriesGDP, "X.3", "Millions.Of.US.Dollar")
## drop non-valuable rows and cols
GDP_Rs <- countriesGDP[-c(1:4,195:330),-which(names(countriesGDP) %in% c("X.1","X.4","X.5","X.6","X.7","X.8"))]
## remove comma in the factor
GDP_Rs$Millions.Of.US.Dollar <- as.character(GDP_Rs$Millions.Of.US.Dollar)
GDP_Rs$Millions.Of.US.Dollar <- gsub(pattern=",",replacement="",GDP_Rs$Millions.Of.US.Dollar)
GDP_Rs$Millions.Of.US.Dollar <- gsub(pattern=" ",replacement="",GDP_Rs$Millions.Of.US.Dollar)
GDP_Rs$Millions.Of.US.Dollar <- as.numeric(GDP_Rs$Millions.Of.US.Dollar)
print(paste("Answer 2 is:",mean(GDP_Rs$Millions.Of.US.Dollar,sep="")))

# ----- Question 3:
print(paste("Answer 3 is:",length(grep("^United",GDP_Rs$Long.Name))))

# ----- Question 4:
countriesEDU <- read.csv("./Quiz4/countriesEDU.csv",head=TRUE)
countriesEDU$Special.Notes <- as.character(countriesEDU$Special.Notes)
p1 <- grep(pattern="Fiscal",countriesEDU$Special.Notes)
fiscal <- countriesEDU$Special.Notes[p1]
june <- grep(pattern="June",fiscal)
print(paste("Answer 4 is:",length(june)))

# ----- Question 5: 
# 1. How many values were collected in 2012 ? 
# 2. How many values were collected on Mondays in 2012?
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
amazon <- data.frame(date=index(amzn), coredata(amzn))

library(lubridate)
amazon$byMonth <- floor_date(amazon$date, "month")
sum(year(amazon$byMonth) == 2012 & wday(amazon$byMonth) == 2)
y2012 <- which(year(amazon$byMonth) == 2012)
sum(wday(amazon$byMonth[y2012]) == ) 