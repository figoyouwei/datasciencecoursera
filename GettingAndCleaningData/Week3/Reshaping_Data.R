rm(list=ls())
cat("\014")

# ----- start with reshaping 
library(reshape2)
head(mtcars)

# ----- melt data frames into tall and skinny form
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),
                measure.vars=c("mpg","hp"))

# ----- dcast to summarize some data
cylData <- dcast(carMelt,cyl~variable)
cylData <- dcast(carMelt,cyl~variable,mean)

# ----- averaging values 
head(InsectSprays)
View(InsectSprays)

# ----- tapply is to apply a function along a index 
tapply(InsectSprays$count,InsectSprays$spray,sum) 

# ----- another way to split / table, then apply sum
spIns <- split(InsectSprays$count,InsectSprays$spray)
table(InsectSprays$count,InsectSprays$spray)
spCount <- lapply(spIns,sum)

# ----- another way to apply statistics, plyr package
library(plyr)
ddply(InsectSprays,"spray",summarize,sum=sum(count))
ddply(InsectSprays,"spray",summarize,sum=ave(count,FUN=sum)) # output same dim