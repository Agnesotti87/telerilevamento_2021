#recall raster packages  
library(raster)
#setwd
setwd("C:/lab/")
#import Landsat file with brick function
p224r63_2011 <- brick("p224r63_2011_masked.grd")
#get information
p224r63_2011 
#and plot it
plot(p224r63_2011)
# B1= blue, B2=verde, B3=rosso, B4=IR, B5=mediumIR, B6=thermal(lontano)IR, B7=NIR
#color change
cl <- colorRampPalette(c("black", "grey", "light grey"))(100)
# plot again with new color
plot(p224r63_2011, col=cl)
