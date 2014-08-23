source("load_data.R")

## 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
NEI$year <- as.factor(NEI$year)
NEI$Pollutant <- as.factor(NEI$Pollutant)
total_emissions_over_years <- tapply(NEI$Emissions, NEI$year, sum)
png(file="./plot1.png",width=480, height=480)
# las: 0=parallel, 1=all horizontal, 2=all perpendicular to axis, 3=all vertical
plot1bar <- barplot(total_emissions_over_years, main="Total Emissions from PM2.5", 
                    xlab="Years", las=1)
lines(x=plot1bar, y=total_emissions_over_years*0.9, lw=3, col="red")
points(x=plot1bar, y=total_emissions_over_years*0.9, lw=3, col="red")
dev.off()

## 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?