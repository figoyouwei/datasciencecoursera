# ----- File Device
# Open PDF device (all the plotting information is going to a file)
# pdf(file="./Week1/myplot.pdf")
png(file="./Week1/myplot.png")
# Send graphics data
library(datasets)
with(faithful,plot(eruptions,waiting))
title(main="plotting on pdf")
# Close device
dev.off()

# Copy the graphics from screen device to file device
library(datasets)
with(faithful,plot(eruptions,waiting))
title(main="plotting on pdf")
dev.copy2pdf(file="myplot.pdf")
dev.copy(png,file="myplot.png")
dev.off()