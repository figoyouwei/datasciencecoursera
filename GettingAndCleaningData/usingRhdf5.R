# -----
# see Material/rhdf5 - HDF5 interface for R.pdf

# ----- install rhdf5 package
# source("http://bioconductor.org/biocLite.R")
# biocLite("rhdf5")

rm(list=ls())
cat("\014")

# ----- 3.1 Create an HDF5 file and group hierarchy
library("rhdf5")
if (file.exists("filename")) {
    file.remove(filename)
}
filename <- "exampleHDF5.h5"
h5createFile(filename)

h5createGroup(filename,"foo")
h5createGroup(filename,"baa")
h5createGroup(filename,"foo/foobaa")
h5ls(filename)

# ----- 3.2 Writing and reading objects
A <- matrix(1:10,nr=5,nc=2)
h5write(A,filename,"foo/A")
B <- array(seq(0.1,2.0,by=0.1),dim=c(5,2,2))
attr(B, "scale") <- "liter"
h5write(B,filename,"foo/B")
C = matrix(paste(LETTERS[1:10],LETTERS[11:20], collapse=""),nr=2,nc=5)
h5write(C,filename,"foo/foobaa/C")

D = h5read(filename,"foo/A")

# ----- 3.3 Writing and reading with subsetting,chunking and compression
# create Dataset with specific dim
h5createDataset(filename,"foo/S",c(4,8),storage.mode="integer",chunk=c(4,1),level=7)
h5read(filename,"foo/S")

# overwrite part of the dataset 1
h5write(matrix(1:4,nr=4,nc=1),file=filename,name="foo/S",index=list(NULL,1))
h5read(filename,"foo/S")

# overwrite part of the dataset 2
h5write(matrix(2:8,nr=1,nc=7),file=filename,name="foo/S",index=list(1,2:8))
h5read(filename,"foo/S")

# overwrite part of the dataset 3
h5write(matrix(1:8,nr=2,nc=4),file=filename,name="foo/S",index=list(3:4,5:8))
h5read(filename,"foo/S")

# read subset of dataset
h5read(filename,"foo/S",index=list(3:4,1:2))
h5read(filename,"foo/S",index=list(3:4,c(2,4,6)))

# ----- write subset with hyperlabs: "start,stride,count,block" (page 5)

# use only the "start"
h5createDataset(filename,"foo/H",c(5,8),storage.mode="integer",chunk=c(5,1),level=7)
h5read(filename,"foo/H")
h5write(matrix(1:5,nr=5,nc=1),file=filename,name="foo/H",start=c(1,4))
h5read(filename,"foo/H")

# use "start" and "count"
h5write(matrix(6:10,nr=5,nc=1),file=filename,name="foo/H",start=c(1,2),count=c(1,5))
h5read(filename,"foo/H")

# write a submatrix 5*6
h5write(matrix(11:40,nr=5,nc=6),file=filename,name="foo/H",start=c(1,3))
h5read(filename,"foo/H")

# write a submatrix 2*2
h5write(matrix(120:123,nr=2,nc=2),file=filename,name="foo/H",start=c(4,1))
h5read(filename,"foo/H")

# use "stride", split the assigned matrix 
h5write(matrix(151:154,nr=2,nc=2),file=filename,name="foo/H",start=c(2,3),
        stride=c(3,2))
h5read(filename,"foo/H")

# count while reading 
h5read(filename,"foo/H",start=c(2,2),count=c(2,2))

# count & stride while reading 
h5read(filename,"foo/H",start=c(3,3),count=c(2,3))
h5read(filename,"foo/H",start=c(3,3),count=c(2,3), stride=c(1,2))

# block ???
h5read(filename,"foo/H",start=c(3,3),count=c(2,3), stride=c(1,2),block=c(1,2))

# ----- 3.4 Saving multiple objects to an HDF5 file (h5save)
# save to the top level group directly using h5save not h5write !
h5dump(filename)
h5ls(filename)
W <- 1:7
Y <- 1:18
Z <- seq(0,1,0.1)
h5save(W,Y,Z,file=filename)

# ----- 3.5 list the content of an HDF5 file
h5ls(filename,all=TRUE)

# ----- 3.6 dump the content of an HDF5 file
D <- h5dump(filename)

# ----- 6 Session info
toLatex(sessionInfo())