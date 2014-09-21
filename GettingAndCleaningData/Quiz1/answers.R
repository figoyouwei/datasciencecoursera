rm(list=ls())
cat("\014")

## ----- Q1
fileURL_Q1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL_Q1,destfile="./Data/Quiz1_Q1.csv",method="curl")
fileURL_pdf <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
download.file(fileURL_pdf,destfile="./Data/Quiz1_Q1.pdf",method="curl")
data_Q1 <- read.table("./Data/Quiz1_Q1.csv",sep=",",header=TRUE)
# found variable name from cookbook, and calculate 
indices <- data_Q1$VAL >= 24
sum(indices, na.rm=TRUE)


## ----- Q2 
# Tidy data has one variable per column.

# ----- Q3
fileURL_Q3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL_Q3,destfile="./Data/Quiz1_Q3.xlsx",method="curl")
library(xlsx)
rows <- 18:23 
cols <- 7:15
data_Q3 <- read.xlsx("./Data/Quiz1_Q3.xlsx",sheetIndex=1,
                     rowIndex=rows,colIndex=cols,header=TRUE)
sum(data_Q3$Zip*data_Q3$Ext,na.rm=TRUE) 

# ----- Q4: Baltimore Restaurants
fileURL_Q4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileURL_Q4,destfile="./Data/Quiz1_Q4.xml",method="curl")
library(XML)
doc <- xmlTreeParse("./Data/Quiz1_Q4.xml",useInternal=TRUE)
content <- xmlRoot(doc)
zipcodes <- xpathSApply(content,"//zipcode",xmlValue)
sum(zipcodes == 21231)

# ----- Q5:
library(data.table)
fileURL_Q5 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL_Q5,destfile="./Data/Quiz1_Q5.csv",method="curl")
DT <- fread("./Data/Quiz1_Q5.csv")

# data.table is faster apply ...
ptm <- proc.time()
DT[,mean(pwgtp15),by=SEX]
proc.time() - ptm

# this method is nice ... team-up apply to each team. 
# apply calculation (mean) on pwgtp15, based on SEX. 
ptm <- proc.time()
tapply(DT$pwgtp15,DT$SEX,mean)
proc.time() - ptm

ptm <- proc.time()
sapply(split(DT$pwgtp15,DT$SEX),mean)
proc.time() - ptm
