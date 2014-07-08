dl_from_GoogleD <- function(key, localpath) {    
    ## Arguments:
    ## output = output file name
    ## key = Google document key
    ## format = output format (pdf, rtf, doc, txt..)
    ## Note: File must be shareable!
    
    require(RCurl)
    #cyberpath <- paste0("https://docs.google.com/file/d/", key, "/export?format=", format)
    cyberpath <- paste0("https://docs.google.com/file/d/", key)
    bin <- getBinaryURL(cyberpath, ssl.verifypeer = FALSE)
    con <- file(localpath, open = "wb")
    writeBin(bin, con)
    close(con)
    message(noquote(paste(localpath, "read into", getwd())))
}

# Example:
dl_from_GoogleD(key = "0B937jFpi7V9RN3QwOE9ZOWt3Q2c",
                localpath = "./Data/cameras.csv")
cameraData <- read.table("./Data/cameras.csv",sep=",",header=TRUE)