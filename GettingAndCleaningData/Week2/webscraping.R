rm(list=ls())
cat("\014")

# ----- getting data off webpages using readLines()
con <- url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en&oi=ao")
htmlCode = readLines(con)
close(con)

# ----- Parsing with XML
library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en&oi=ao"
html <- htmlTreeParse(url,useInternalNodes=TRUE)
# get values from html raw text file
xpathSApply(html,"//title",xmlValue)
xpathSApply(html,"//td[@id='col-citedby']",xmlValue)

# ----- GET from the httr package
library(httr)
urlGET <- GET(url)
contentWeb <- content(urlGET,as="text")
parsedContent <- htmlParse(contentWeb,asText=TRUE)
xpathSApply(parsedContent,"//title",xmlValue)

# ----- Accessing websites with passwords
pg <- GET("http://httpbin.org/basic-auth/user/passwd",
           authenticate("user","passwd"))
content <- content(pg,as="text")
parsed <- htmlParse(content,asText=TRUE)
xpathSApply(parsed,"//title",xmlValue)
names(pg)

# ----- Using handles to authenticate just once ??? 

# ----- read other format like abf
library(abf2)
filepath <- "1s_SNc_perf_patch.abf"
content_abf <- abfload(filepath)
