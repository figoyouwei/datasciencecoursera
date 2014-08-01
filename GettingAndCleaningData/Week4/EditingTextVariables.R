# ----- Working with basic strings ----- # 
varNames <- c("address","direction","street","crossStreet","intersection","Location.1")
tolower(varNames)
strsplit(varNames,split="\\.")

# ----- sub() works fine for pattern matching replacement but ...
reviews <- c("id","solution_id","reviewer_id","start","stop","time_left","accept")
sub(pattern="_",replacement=".",reviews)

testName <- "this_is_a_test"
sub(pattern="_",replacement=".",testName)
gsub(pattern="_",replacement=".",testName)

intersections <- c("Alma","Suck","Shit","Alma","Alma","Rock")
grep(pattern="Alma",intersections)
grepl(pattern="Alma",intersections)
table(grepl(pattern="Alma",intersections))

# ----- Working with R string package ----- #
library(stringr)
myname <- "Youwei Zheng"
nchar(myname)
pos <- gregexpr(pattern=" ",myname)[[1]][1]
substr(myname,1,pos-1)
substr(myname,pos+1,12)

paste("Youwei","Zheng",myname,sep=" ")
