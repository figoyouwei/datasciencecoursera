## A better version of loading the dataset, maybe
## don't load everything as character, not good for date plotting
load <- function() {
    rds.filename = "data.rds"
    raw.data.url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    raw.data.zip.filename = "power_consumption.zip"
    raw.data.filename = "household_power_consumption.txt"
    
    if(!file.exists(rds.filename)) {
        download.file(raw.data.url, destfile = raw.data.filename, method = "curl")
        con = unz(raw.data.filename, raw.data.filename)
        
        df.data = read.table(con, header = TRUE, sep = ";", na.strings = "?", 
                             colClasses = c(rep("character", 2), rep("numeric", 7)))
        
        df.data =  df.data[df.data$Date == "1/2/2007" | df.data$Date == "2/2/2007", ] 
        
        df.data$DateTime = strptime(paste(df.data$Date, df.data$Time), "%d/%m/%Y %H:%M:%S")
        
        saveRDS(df.data, rds.filename) 
        
        df.data
    } else {
        df.data = readRDS(rds.filename)
    }
}