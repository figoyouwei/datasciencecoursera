# ----- show the example of plotting symbols
example(points)

# ----- little scatter plot demo with a model fit
x <- rnorm(100)
y <- rnorm(100)
plot(x, y, pch=20, xlab="Weight", ylab="Height")
title("scatter plot")
text(-2, -2, "label")
legend("topleft", legend="data", pch=20)
fit <- lm(y ~ x)
abline(fit, lwd=3, col="red")

# ----- separate groups of data points
par(mfrow=c(1,1),mar=c(4,4,2,2))
x <- rnorm(100)
y <- x + rnorm(100)
g <- gl(2, 50, labels=c("Male", "Female"))
plot(x, y, type="n") # not display anything on the canvas
points(x[g=="Male"],y[g=="Male"],col="blue",pch=19)
points(x[g=="Female"],y[g=="Female"],col="red")
legend("topleft", legend=c("male","female"), col=c("blue","red"), pch=c(19,1))

# ----- ----- ----- ----- Base Graphics ----- ----- ----- ----- # 
# 1. initialize a new plot
# 2. annotate an existing plot
# It offers a high degree of control over plotting

# ----- Simple Base Graphics: Histogram, Scatter,Boxplot
library(datasets)
hist(airquality$Ozone)
with(airquality,plot(Wind,Ozone))
airquality <- transform(airquality,Month=factor(Month))
boxplot(Ozone ~ Month, airquality, xlab="Month", ylab="Ozone")

# ----- Some important Base Graphics Parameters
colors()
par(bg="gray")
with(airquality,plot(Wind,Ozone,pch="a",col="red")) # take a character element
with(airquality,plot(Wind,Ozone,pch=3,col="blue"))  # take a shape element (numbered)
with(airquality,plot(Wind,Ozone,xlab="windy",ylab="O3"))

# ----- multiple panels on one canvas
par(mfrow = c(2, 3))
for (i in 1:6) {
    with(airquality,plot(Wind,Ozone,xlab="windy",ylab="O3",col=colors()[i]))    
}

# ----- margin of a plot (bottom->left->top->right)
par("mar"=c(5,4,3,3))
with(airquality,plot(Wind,Ozone,xlab="windy",ylab="O3",col=colors()[i]))

# ----- lines/points/text/title/mtext/axis
par(mfrow = c(1, 1))
with(airquality,plot(Wind,Ozone,xlab="windy",ylab="O3",col="blue"))
title(main = "Ozone and Wind")
with(subset(airquality,Month==5),points(Wind,Ozone,col="red"))
lines()

# ----- type = "n"
with(airquality,plot(Wind,Ozone,type="n")) # just set up the canvas
with(subset(airquality,Month=!5),points(Wind,Ozone,col="red"))
with(subset(airquality,Month==5),points(Wind,Ozone,col="blue"))
legend("topright",pch=1,col=c("red","blue"),legend=c("May","Other months"))

# ----- Regression Line *** 
with(airquality,plot(Wind,Ozone,main="Ozone and Wind in New York City",pch=20))
model <- lm(Ozone ~ Wind, airquality)
abline(model,lwd=2)

# ----- Multiple Panels within with()
par(mfrow = c(1,2))
with(airquality,{
    plot(Wind,Ozone,main="Ozone and Wind")    
    plot(Solar.R,Ozone,main="Ozone and Solar Radiation")
})

# ----- set inner margin and outer margin
par(mfrow=c(1,3), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(airquality,{
    plot(Wind,Ozone,main="Ozone and Wind")    
    plot(Solar.R,Ozone,main="Ozone and Solar Radiation")
    plot(Temp,Ozone,main="Ozone and Temperature")    
})
mtext("New York City",outer=TRUE, side=3, at=c(0.5))

# ----- little function to reset par() and call par(resetPar())
resetPar <- function() {
    dev.new()
    op <- par(no.readonly = TRUE)
    dev.off()
    op
}