## set working directory ...
#setwd("/Users/youweizheng/Dropbox/github/repositories/datasciencecoursera/R Programming/Programming Assignment 1 Air Pollution/")

# clear console ...
rm(list=ls())
cat("\014")

# calculate the pollutant mean, 
# pollutantmean("specdata", "sulfate", 1:10)
pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## pollutant: either "sulfate" or "nitrate".    
    ## 'id' is an integer vector indicating the monitor ID numbers to be used
    ## Return the mean of the pollutant across all monitors list in the 'id' vector

    # Solution: rbind all monitors data into one data.frame, 
    # and then calculate the mean of variable col.
    nIDs <- length(id)
    values <- numeric(nIDs)
    file_names <- list.files(directory)
    dat <- data.frame()
    for(ii in 1:nIDs) {
        datapath <- sprintf("%s/%s", directory, file_names[id[ii]])
        dat <- rbind(dat, read.csv(datapath))
    }
    mean(dat[, pollutant],na.rm=TRUE)
}
