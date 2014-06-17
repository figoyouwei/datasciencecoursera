# clear console ...
rm(list=ls())
cat("\014")

complete <- function(directory, id_vec = 1:332) {
    ## 'id' is an integer vector indicating the monitor ID numbers to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases

    # Solution: 
    # calculate obs as a column and get id as column
    nID <- length(id_vec)
    ids <- numeric(nID)
    obs <- numeric(nID)
    
    file_names <- list.files(directory)
    for(ii in 1:nID) {
        # return id, and print datapath string
        id <- id_vec[ii]
        ids[ii] <- id
        datapath <- sprintf("%s/%s", directory, file_names[id_vec[ii]])
        
        # read csv from a single file
        data <- read.csv(datapath)
        
        # count the number of obsevations
        nobs <- sum(complete.cases(data))        
        obs[ii] <- nobs        
    }

    # cbind two columns into data.frame
    data.frame(id=ids, nobs=obs)
}