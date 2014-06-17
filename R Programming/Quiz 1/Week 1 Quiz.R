# clear console ...
rm(list=ls())
cat("\014")

# Question 11, load hw1_data.csv
data <- read.csv("hw1_data.csv")

# Question 12
print(data[1:2,])

# Question 13
cat("number rows of data: ", nrow(data), "\n")

# Question 14
print(data[152:153,])

# Question 15
print(data[47,"Ozone"])

# Question 16
df16 = na.omit(data["Ozone"])
ans16 = nrow(data["Ozone"]) - nrow(df16)
print(ans16)

# Question 17
ans17 = colMeans(df16)
print(ans17)

# Question 18
df18 = subset(data, Temp>90 & Ozone>31, select=c("Ozone","Temp","Solar.R"))
ans18 = colMeans(df18["Solar.R"])
print(ans18)

# Question 19
df19 = subset(data, Month==6, select="Temp")
ans19 = colMeans(df19)
print(ans19)

# Question 20
df20 = subset(data, Month==5, select="Ozone")
ans20 = max(df20,na.rm=TRUE)
print(ans20)
