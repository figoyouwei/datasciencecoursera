rm(list=ls())
cat("\014")

# ----- connecting and list databases
# open a connection to database
ucscDB <- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
# apply a query to that database, using MySQL command
result <- dbGetQuery(ucscDB,"show databases;");
# close a connecton to database
dbDisconnect(ucscDB)

# ----- connectin to a specific database and listing tables
# open a connection to ONE specific database
hg19 <- dbConnect(MySQL(),user="genome",db="hg19",host="genome-mysql.cse.ucsc.edu")
# list all tables in that database 
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]

# ----- get dimensions of a specific table within a database
tablename <- "affyU133Plus2"
# list fields (column names) of a table
dbListFields(hg19,tablename)
# return the number of records from a table
dbGetQuery(hg19,sprintf("select count(*) from %s", tablename))

# ----- read from table
affyData <- dbReadTable(hg19,tablename)

# ----- select a specific subset of a table (often a table is too big to load local)
# construct a query
query <- dbSendQuery(hg19,
                     sprintf("select * from %s %s", tablename,
                             "where misMatches between 1 and 3"))
# fetch the query result to local machine
affyMis <- fetch(query);
quantile(affyMis$misMatches)
# fetch only part of the query result to local machine
affyMisSmall <- fetch(query,n=10);
# clear the query result
dbClearResult(query)

# Finally, don't forget to close the connection
dbDisconnect(hg19)