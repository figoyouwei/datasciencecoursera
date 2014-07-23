rm(list=ls())
cat("\014")

# ----- Question 1:
## download csv 
urlQ1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(urlQ1,destfile="./Quiz3/Q1.csv",method="curl")
## read Q1 data as df
dataQ1 <- read.table("./Quiz3/Q1.csv",sep=",",header=TRUE)
agricultureLogical <- which(dataQ1$ACR == 3 & dataQ1$AGS == 6)
head(agricultureLogical,3)

# ----- Question 2:
## download jpeg image
urlQ2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(urlQ2,destfile="./Quiz3/jeff.jpg",method="curl")
library(jpeg)
jeff <- readJPEG("./Quiz3/jeff.jpg", native=TRUE)
quantile(jeff,probs=c(0.3,0.8))

# ----- Downloading the dataset for question 3-5
# urlGDP <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
# download.file(urlGDP,destfile="./Quiz3/countriesGDP.csv",method="curl")
countriesGDP <- read.csv("./Quiz3/countriesGDP.csv",head=TRUE)

# urlEDU <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
# download.file(urlEDU,destfile="./Quiz3/countriesEDU.csv",method="curl")
countriesEDU <- read.csv("./Quiz3/countriesEDU.csv",head=TRUE)

# ----- Question 3: to merge the two tables ...
## change variable names
library(data.table)
setnames(countriesGDP, "X", "ShortCode")
setnames(countriesGDP, "Gross.domestic.product.2012", "GDP.Ranking")
setnames(countriesGDP, "X.2", "Long.Name")
setnames(countriesGDP, "X.3", "Millions.Of.US.Dollar")

## drop non-valuable rows and cols
GDP_Rs <- countriesGDP[-c(1:4,195:330),-which(names(countriesGDP) %in% c("X.1","X.4","X.5","X.6","X.7","X.8"))]

## merge 
merged <- base::merge(GDP_Rs,countriesEDU,by.x="ShortCode",by.y="CountryCode")

# ----- Question 4: calculate average of specific group using %in%
library(plyr)
as.numeric.factor <- function(x) {as.numeric(levels(x))[x]}
merged$GDP.Ranking <- as.numeric.factor(merged$GDP.Ranking) 
dataQ4 <- arrange(merged,desc(GDP.Ranking))
cat(sprintf("%d,%s", nrow(dataQ4), dataQ4[13,"Long.Name.x"]))

# ----- Question 5: xtabs
merged$Income.Group <- as.character.factor(merged$Income.Group)
OECD <- mean(merged[merged$Income.Group %in% c("High income: OECD"),"GDP.Ranking"])
nonOECD <- mean(merged[merged$Income.Group %in% c("High income: nonOECD"),"GDP.Ranking"])
cat(sprintf("%.5f,%.5f", OECD, nonOECD))

# ----- Question 6: 
dataQ6 <- arrange(merged,GDP.Ranking)
sum((dataQ6$Income.Group=="Lower middle income")[1:38])
