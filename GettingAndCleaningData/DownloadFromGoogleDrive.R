# ----- checking existing or creating new directories 
if (!file.exists("./Data")) {
    dir.create("./Data")
}
#unlink("./Data", recursive = TRUE) #remove directory

# ----- downloading data from the internet 
fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?
            accessType=DOWNLOAD"
download.file(fileURL,destfile="./Data/cameras.csv",method="curl")

# ----- list all files of a directory and date it 
list.files("./Data")
dateDownloaded <- date()
