## clear workspace & console
rm(list=ls())
cat("\014")
source("load_data.R")

## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
NEI$year <- as.factor(NEI$year)
NEI$Pollutant <- as.factor(NEI$Pollutant)
NEI$type <- as.factor(NEI$type)

# get SCC numbers that are motor vehicle sources, and get matched sub-dataset.
# totally 20 SCCs are motor vehicle related, which correspond to 2073 observations in the US.
# only 2 observations in Maryland.
xmatches_name <- intersect(
    grep("Motor", SCC$Short.Name, ignore.case=TRUE),
    grep("Vehicle", SCC$Short.Name, ignore.case=TRUE))
scc_match <- SCC[xmatches_name,"SCC"]
dat_match_US <- NEI[as.character(NEI$SCC) %in% as.character(scc_match),]
dat_match_Maryland <- dat_match_US[dat_match_US$fips == "24510",]
dat_match_LosAngelos <- dat_match_US[dat_match_US$fips == "06037",]
# compute total emission over the years for dat_match
total_emissions_Maryland <- tapply(dat_match_Maryland$Emissions, dat_match_Maryland$year, sum)
total_emissions_LA <- tapply(dat_match_LosAngelos$Emissions, dat_match_LosAngelos$year, sum)

# plotting Maryland
png(file="./plot5.png",width=480, height=480)
plot5bar <- barplot(total_emissions_over_years, 
                    main="Emissions with motor vehicle sources (Maryland)", 
                    xlab="Years", las=1)
lines(x=plot5bar, y=total_emissions_over_years*0.9, lw=3, col="red")
points(x=plot5bar, y=total_emissions_over_years*0.9, lw=3, col="red")
dev.off()

# plotting Los Angelos
png(file="./plot6.png",width=480, height=480)
plot6bar <- barplot(total_emissions_LA, 
                    main="Emissions with motor vehicle sources (LA)", 
                    xlab="Years", las=1)
lines(x=plot6bar, y=total_emissions_LA*0.9, lw=3, col="red")
points(x=plot6bar, y=total_emissions_LA*0.9, lw=3, col="red")
dev.off()
