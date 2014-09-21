## clear workspace & console, and import ggplot2
rm(list=ls())
cat("\014")

source("load_data.R")
source("multiplot.R")
library(ggplot2)

## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008 ? 
## Use the ggplot2 plotting system to make a plot answer this question.
NEI$year <- as.factor(NEI$year)
NEI$Pollutant <- as.factor(NEI$Pollutant)
NEI$type <- as.factor(NEI$type)

# extract data of Maryland only and compute the wanted results
NEI_Maryland <- subset(NEI, NEI$fips=="24510")
NEI_Maryland$type <-as.factor(NEI_Maryland$type)

results <- with(NEI_Maryland, aggregate(Emissions, by=list(year, type), sum, na.rm=T))
names(results)<-c("year", "type", "Emissions")
results$type <-as.factor(results$type)
results$year <-as.factor(results$year)

g <- ggplot(results, aes(x=year, y=Emissions, group=1))
g + geom_point() + geom_smooth(method="lm") + facet_grid(.~type) + theme_bw()
g <- g + scale_x_continuous(breaks=c(1999, 2002, 2005, 2008))