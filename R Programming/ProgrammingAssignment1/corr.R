# clear console ...
rm(list=ls())
cat("\014")

corr <- function(directory, threshold = 0) {  
    ## Return a numeric vector of correlations
    file_names <- list.files(directory)
    values <- numeric()
    jj <- 1
    for(ii in 1:length(file_names)) {
        # return id, and print datapath string
        datapath <- sprintf("%s/%s", directory, file_names[ii])
        
        # read csv from a single file
        data <- read.csv(datapath)
        
        # depending on the number of obsevations, calculate correlations.
        nobs <- sum(complete.cases(data))        
        if (nobs > threshold) {
            values[jj] <- cor(data[, "nitrate"], data[, "sulfate"], use="complete.obs")
            jj <- jj +1
        }
    }
    values
}