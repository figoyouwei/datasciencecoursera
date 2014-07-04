# ---------- aggregate data by dates, e.g. monthly ----- # 

## clear workspace and console ...
rm(list=ls())
cat("\014")

## fake some dates and data x
library(lubridate)
df <- data.frame(
    date = today() + days(1:300),
    x = runif(300)
)

## put daily date of every month to the same 
df$monthly <- floor_date(df$date, "month")

## apply function to data.x
library(plyr)
ddply(df, "monthly", summarise, y = mean(x))
