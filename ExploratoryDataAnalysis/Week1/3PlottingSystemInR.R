# ----- ----- ----- ----- 3 different plotting system in R ----- ----- ----- ----- # 

# ----- Base Plotting
library(datasets)
data(cars)
with(cars,plot(speed,dist))

# ----- Lattice Plotting
library(lattice)
state <- data.frame(state.x77,region=state.region)
xyplot(Life.Exp ~ Income | region, data=state,layout=c(4,1))

# ----- ggplot2
library(ggplot2)
data(mpg)
qplot(displ,hwy,data=mpg)