library(ggplot2)
str(mpg)

## ------------------------------ quick qplot ------------------------------
## scatterplot
qplot(displ, hwy, data=mpg)
qplot(displ, hwy, data=mpg, color=drv)
qplot(displ, hwy, data=mpg, geom=c("point","smooth"), method="lm")
qplot(displ, hwy, data=mpg, geom=c("point","smooth"))

## histogram
qplot(hwy, data=mpg, binwidth=1, fill=drv)
qplot(hwy, data=mpg, binwidth=1)
qplot(hwy, data=mpg, binwidth=1, geom="density")
qplot(hwy, data=mpg, binwidth=1, geom="density", color=drv)

## Facets
qplot(displ, hwy, data=mpg, facets=.~drv, color=drv)
qplot(hwy, data=mpg, facets=drv~., binwidth=2)
qplot(displ, hwy, data=mpg, geom=c("point","smooth"), method="lm", facets=.~drv)

## ------------------------------ ggplot ------------------------------
## everything is layered !
g <- ggplot(mpg, aes(displ,hwy))
g + geom_point()
g + geom_point() + geom_smooth()
g + geom_point() + geom_smooth(method="lm")
g + geom_point() + geom_smooth(method="lm") + facet_grid(.~drv) + theme_bw()
g + geom_point() + geom_smooth(method="lm") + facet_grid(.~drv) + theme_gray()

## annotation
g <- ggplot(mpg, aes(displ,hwy))
g + geom_point(color="steelblue", size=4, alpha=0.5)
g + 
geom_point(aes(color=drv), size=4, alpha=0.5) + 
labs(x=expression("log "*PM[2.5]), y="change") + 
geom_smooth(size=4, linetype=3, method="lm") + 
theme_bw(base_family="Times")

## Axis Limit
testdat <- data.frame(x=1:100, y=rnorm(100))
testdat[50, "y"] <- 100
g <- ggplot(testdat, aes(x, y))
g + geom_line() + ylim(-3,3) # exclude the outliner data point
g + geom_line() + coord_cartesian(ylim = c(-3,3)) # still include but not display 

## Part 5: a very useful way to not exactly factorize the variable 
## but cut continuous variable to several pieces of range for plotting
## cut()
