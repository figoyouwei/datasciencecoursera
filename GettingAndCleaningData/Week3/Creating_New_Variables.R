rm(list=ls())
cat("\014")

# ----- Getting the data from the web
# fileURL <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
# download.file(fileURL,destfile="./Week3/restaurants.csv",method="curl")
restData <- read.csv("./Week3/restaurants.csv")

# ----- Creating binary variables
restData$zipWrong <- ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong)
table(restData$zipWrong,restData$zipWrong)
# change flip the wrong zipcode
which(restData$zipWrong == TRUE)
restData[1157,"zipCode"] <- -restData[1157,"zipCode"]

# ----- easier cutting, category variable to create factor variable
library(Hmisc)
quantile(restData$zipCode)
table(cut(restData$zipCode,breaks=quantile(restData$zipCode)))
table(cut2(restData$zipCode,g=5))
