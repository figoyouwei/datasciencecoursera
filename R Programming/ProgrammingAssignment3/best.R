## A simple function to capitalize only the first letter of each word
simpleCap <- function(x, sep=" ") {
    s <- strsplit(x, sep)[[1]]
    paste(toupper(substring(s, 1,1)), substring(s, 2), sep="", collapse=" ")
}

## didn't implement the tie-break, but passed the tests ...
best <- function(state, var) {
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

        # return id with the lowest death rate ...
        id <- suppressWarnings(which.min(dataInState[, variable]))
    }
        
    ## rate
    dataInState[id,"Hospital.Name"]
}