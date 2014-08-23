## clear workspace & console, and import ggplot2
rm(list=ls())
cat("\014")

source("load_data.R")
source("multiplot.R")
library(ggplot2)

## Across the United States, how have emissions from coal combustion-related sources changed 
## from 1999–2008?
NEI$year <- as.factor(NEI$year)
NEI$Pollutant <- as.factor(NEI$Pollutant)
NEI$type <- as.factor(NEI$type)

# get SCC numbers that are coal-combustion related sources, and get matched sub-dataset.
# still needs as.character() for matching factor levels.
# totally 99 SCCs are coal-combustion related, which correspond to 28480 observations.
xmatches_name <- intersect(
    grep("coal", SCC$EI.Sector, ignore.case=TRUE),
    grep("comb", SCC$EI.Sector, ignore.case=TRUE))
scc_match <- SCC[xmatches_name,"SCC"]
dat_match <- NEI[as.character(NEI$SCC) %in% as.character(scc_match),]

# compute total emission over the years for dat_match
total_emissions_over_years <- tapply(dat_match$Emissions, dat_match$year, sum)

# plotting
png(file="./plot4.png",width=480, height=480)
plot4bar <- barplot(total_emissions_over_years, 
                    main="Emissions with coal-combustion related sources", 
                    xlab="Years", las=1)
lines(x=plot4bar, y=total_emissions_over_years*0.9, lw=3, col="red")
points(x=plot4bar, y=total_emissions_over_years*0.9, lw=3, col="red")
dev.off()
