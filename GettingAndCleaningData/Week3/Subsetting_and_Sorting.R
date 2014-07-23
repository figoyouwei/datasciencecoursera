## First lecture of week 1, reviewed.
set.seed(13435)

# ----- subset using vector statement 
X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
X$var2[c(1:3)] = NA
# X <- X[sample(1:5),]; 

# ----- subset using logical statement, logical row/col vector
X[X$var1>3,]
X[(X$var1>3 & X$var3>12),]
X[(X$var1<4 | X$var3>12),] 

# ----- subset with missing values
X[which(X$var2<8),]

# ----- sorting 
sort(X$var1)
sort(X$var1,decreasing=TRUE)
sort(X$var2,na.last=TRUE)

# ----- ordering the matrix by one column
X[order(X$var1),]
X[order(X$var1,X$var3),]

# ----- ordering with plyr package
library(plyr)
arrange(X,var1)
arrange(X,desc(var1))
arrange(X,desc(var1),desc(var3))

# ----- adding rows and columns
X$var4 <- rnorm(5)
cbind(X,var5=rnorm(5))
rbind(X,rnorm(5))
