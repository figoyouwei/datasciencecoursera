## A simple function to capitalize only the first letter of each word
simpleCap <- function(x, sep=" ") {
    s <- strsplit(x, sep)[[1]]
    paste(toupper(substring(s, 1,1)), substring(s, 2), sep="", collapse=" ")
}

## order function actually takes the alphbetical issue automatically ...
rankhospital <- function(state, var, num = "best") {
    ## Read outcome data
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    categories <- c('heart attack', 'heart failure', 'pneumonia')
    
    ## Check that state and outcome are valid
    if (state %in% outcome$State) {
        s <- TRUE
    } else {
        stop("invalid state")
    }
    
    if (var %in% categories) {
        o <- TRUE
        var_upper <- gsub(' ', '.', simpleCap(var))
        variable <- paste("Hospital.30.Day.Death..Mortality..Rates.from.", var_upper, sep="")
    } else {
        stop("invalid outcome")
    }
    
    ## Return hospital name in that state with lowest 30-day death
    if (s && o) {
        # get the subset outcome from specified state by using "which"
        dataInState <- outcome[which(outcome$State == state),]
        
        # return the rank with the lowest death rate with id 1
        rank <- order(suppressWarnings(as.numeric(dataInState[, variable])), 
                      dataInState[, "Hospital.Name"])
        avail <- na.omit(suppressWarnings(as.numeric(dataInState[, variable])))
        rank <- rank[1:length(avail)]
    }    
    
    ## list hospitals 
    if (num == "best") {
        dataInState[rank[1], "Hospital.Name"]
    } else if (num == "worst") {
        dataInState[rank[length(rank)], "Hospital.Name"]
    } else if (8%%1==0) {
        if (num <= length(rank)) {
            dataInState[rank[num], "Hospital.Name"]    
        } else if (num > length(rank)) {
            NA
        }
    }
}