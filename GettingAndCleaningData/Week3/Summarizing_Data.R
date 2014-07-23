rm(list=ls())
cat("\014")

# ----- Getting the data from the web
# fileURL <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
# download.file(fileURL,destfile="./Week3/restaurants.csv",method="curl")
restData <- read.csv("./Week3/restaurants.csv")

# ----- Look at a bit of the data
head(restData,3)
tail(restData,4)
summary(restData)
str(restData)

# ----- Quantiles of quantitative variables
quantile(restData$councilDistrict,na.rm=TRUE)
quantile(restData$councilDistrict,probs=seq(0.1,1.0,0.1),na.rm=TRUE)

# ----- table to count
table(restData$zipCode,useNA="no")
table(restData$councilDistrict,restData$zipCode,useNA="no")

# ----- check for missing values
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)

# ----- table to count logical output
table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212","21213"))
restData[restData$zipCode %in% c("21212"),]

# ----- cross tabs (xtabs)
data(UCBAdmissions)
DF <- as.data.frame(UCBAdmissions)
summary(DF)
xt <- xtabs(Freq ~ Gender + Dept + Admit,data=DF)

# ----- Flat tables
ftable(xt)

# ----- size of a data object
object.size(restData)
print(object.size(restData),units="Mb")