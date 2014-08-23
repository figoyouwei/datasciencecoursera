## clear workspace & console, and import ggplot2
rm(list=ls())
cat("\014")

source("load_data.R")

## 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
## from 1999 to 2008?
NEI$year <- as.factor(NEI$year)
NEI$Pollutant <- as.factor(NEI$Pollutant)
NEI_Maryland <- NEI[NEI$fips == "24510",]
total_emissions_over_years_Maryland <- tapply(NEI_Maryland$Emissions, NEI_Maryland$year, sum)

# making the plot
png(file="./plot2.png",width=480, height=480)
plot2bar <- barplot(total_emissions_over_years_Maryland, 
                    main="Total Emissions from PM2.5 in the Baltimore City, Maryland", 
                    xlab="Years", las=1)
lines(x=plot2bar, y=total_emissions_over_years_Maryland*0.9, lw=3, col="red")
points(x=plot2bar, y=total_emissions_over_years_Maryland*0.9, lw=3, col="red")
dev.off()
