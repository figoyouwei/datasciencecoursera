# ----- checking existing or creating new directories 
# unlink("./Data", recursive = TRUE) #remove directory
rm(list=ls())
cat("\014")
if (!file.exists("./Data")) {
    dir.create("./Data")
}

# ----- downloading csv from some data website
fileURL_csv <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?    
            accessType=DOWNLOAD"
download.file(fileURL_csv,destfile="./Data/cameras.csv",method="curl")

# ----- downloading xlsx from some data website
fileURL_xlsx <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?    
                accessType=DOWNLOAD"
download.file(fileURL_xlsx,destfile="./Data/cameras.xlsx",method="curl")

# ----- downloading shared pdf from Cloud, works!
fileURL <- "https://www.dropbox.com/s/2qsu73p99bqp6bn/23%20Problems%20in%20Computational%20Neuroscience.pdf?dl=1"
download.file(fileURL,destfile="./one.pdf",method="curl")

# ----- downloading pdf from Open-Access Journal,works!
fileURL <- "http://www.plosone.org/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fjournal.pone.0101592&representation=PDF"
download.file(fileURL,destfile="./one.pdf",method="curl")

# ----- list all files of a directory and date it 
listpath <- "./"
list.files(listpath)
dateDownloaded <- date()

# ----- read local flat data (read.csv auto sets sep="," and header=TRUE)
cameraData <- read.table("./Data/cameras.csv",sep=",",header=TRUE)

# ----- read Excel data 
library(xlsx)
rows <- 1:5 # row 1 is the header.
cols <- 1:2
cameraDataSub <- read.xlsx("./Data/cameras.xlsx",sheetIndex=1,
                        rowIndex=rows,colIndex=cols)

# ----- read XML directly from the web, a food-menu example 
library(XML)
fileURL_XML <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileURL_XML,useInternal=TRUE)
content <- xmlRoot(doc)
xmlName(content)
content[[1]][[1]]
xpathSApply(content,"//name",xmlValue)
xpathSApply(content,"//price",xmlValue)

# ----- read html directly from the web, a sport-team page ...
fileURL_HTML <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileURL_HTML,useInternal=TRUE)
teams <- xpathSApply(doc,"//li[@class='team-name']",xmlValue)

# ----- read JSON directly from the web, a github api
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/figoyouwei/repos")
names(jsonData)

# ----- write R data.frame to JSON
library(datasets)
data(iris)
myjson <- toJSON(iris,pretty=TRUE)
cat(myjson)
iris2 <- fromJSON(myjson)