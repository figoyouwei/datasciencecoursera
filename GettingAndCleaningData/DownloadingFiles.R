# ----- checking existing or creating new directories 
# unlink("./Data", recursive = TRUE) #remove directory
rm(list=ls())
cat("\014")
if (!file.exists("./Data")) {
    dir.create("./Data")
}

# ----- downloading pdf from Open-Access Journal 
fileURL <- "http://www.plosone.org/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fjournal.pone.0101592&representation=PDF"
download.file(fileURL,destfile="./one.pdf",method="curl")

# ----- downloading csv from some data website
fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?    
            accessType=DOWNLOAD"
download.file(fileURL,destfile="./Data/cameras.csv",method="curl")

# ----- downloading shared pdf from Cloud 
fileURL <- "https://www.dropbox.com/s/2qsu73p99bqp6bn/23%20Problems%20in%20Computational%20Neuroscience.pdf?dl=1"
download.file(fileURL,destfile="./one.pdf",method="curl")

# ----- list all files of a directory and date it 
listpath <- "./"
list.files(listpath)
dateDownloaded <- date()

# ----- read local flat data (read.csv auto sets sep="," and header=TRUE)
cameraData <- read.table("./Data/cameras.csv",sep=",",header=TRUE)
