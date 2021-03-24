#recall raster packages  
library(raster)
#setwd
setwd("C:/lab/")
#import Landsat file with brick function
p224r63_2011 <- brick("p224r63_2011_masked.grd")
#get information
p224r63_2011 
#p = path (sinusoide che disegna il passaggio del satellite)
# r= row (riga orizzontale che interseca le sinusoidi)
# path e row ci danno il punto in cui "cade" l'immagine
#and plot it
plot(p224r63_2011)
# Landsat band B1= blue, B2=verde, B3=rosso, B4=NIR, B5=mediumIR, B6=thermal(lontano)IR, B7=SWIR
#color change
cl <- colorRampPalette(c("black", "grey", "light grey"))(100)
# plot again with new color
plot(p224r63_2011, col=cl)
#DAY 3
#clean current graph
dev.off()
#plot band 1 with own color ramp palette
plot(p224r63_2011$B1_sre, col=cl)

#plot first 4 bands of Landsat with differente color palette
par(mfrow=c(2,2))
clb <- colorRampPalette(c("dark blue","blue","light blue")) (100)
clg <- colorRampPalette(c("dark green","green","light green")) (100)
clr <- colorRampPalette(c("dark red","red","pink")) (100)
clnir <- colorRampPalette(c("red","orange","yellow")) (100)
plot(p224r63_2011$B1_sre, col=clb)
plot(p224r63_2011$B2_sre, col=clg)
plot(p224r63_2011$B3_sre, col=clr)
plot(p224r63_2011$B4_sre, col=clnir)
