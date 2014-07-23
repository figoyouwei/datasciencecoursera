rm(list=ls())
cat("\014")

dl_from_dropbox <- function(key, filename, localpath) {
    ## Argument
    ## key: generated key from Dropbox
    ## filename
    ## localpath: local file path under working directory

    require(RCurl)
    bin <- getBinaryURL(paste0("https://dl.dropboxusercontent.com/s/", key, "/", filename),
                        ssl.verifypeer = FALSE)
    con <- file(localpath, open = "wb")
    writeBin(bin, con)
    close(con)
    message(noquote(paste(localpath, "read into", getwd())))                        
}

# Example:
dl_from_dropbox("31ntpeoknxgdwyv", "cameras.csv", "./Data/cameras.csv")
cameraData <- read.table("./Data/cameras.csv",sep=",",header=TRUE)