## this script gets out the density from ggplot function
library(ggplot2)
m <- ggplot(movies, aes(x = rating))
m <- m + geom_density()
p <- print(m)
head(p$data[[1]], 3)
#           y      x   density   scaled  count PANEL group ymin      ymax
# 1 0.0073761 1.0000 0.0073761 0.025917 433.63     1     1    0 0.0073761
# 2 0.0076527 1.0176 0.0076527 0.026888 449.88     1     1    0 0.0076527
# 3 0.0078726 1.0352 0.0078726 0.027661 462.81     1     1    0 0.0078726

## Just to show that those are the points you are after, 
## extract and use them to create a lattice xyplot 
library(gridExtra)
library(lattice)
mm <- xyplot(y~x, data=p$data[[1]], type="l")