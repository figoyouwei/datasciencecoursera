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
NEI_Maryland <- NEI[NEI$fips == "24510",]
conds <- list(NEI_Maryland$year, NEI_Maryland$type)
results <- as.data.frame(tapply(NEI_Maryland$Emissions, conds, sum))
results$YEAR <- as.numeric(c(1999, 2002, 2005, 2008))
names(results) <- c("nonroad", "nonpoint", "onroad", "point", "year") 

# plotting lines with ggplot2
g1 <- ggplot(results, aes(year, nonroad)) + geom_line() + ggtitle("nonroad")
g2 <- ggplot(results, aes(year, nonpoint)) + geom_line() + ggtitle("nonpoint")
g3 <- ggplot(results, aes(year, onroad)) + geom_line() + ggtitle("onroad")
g4 <- ggplot(results, aes(year, point)) + geom_line() + ggtitle("point")
multiplot(g1,g2,g3,g4,cols=2)