#R_code_classification.r
# start date 21.04.21
#recall libraries
library(raster)
library(RStoolbox)
#let's set working directory
setwd("C:/lab/")
#upload Solar Orbiter Image with brick function 
#brick upload multispectral images
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
#plot so with plotRGB
#these are not RGB images but we will give them those colors
plotRGB(so, 1, 2, 3, stretch="lin")
#unsupervised classification with UnsuperClass(img, nSamples, nClasses, nStarts)   (more info on https://www.rdocumentation.org/packages/RStoolbox/versions/0.2.6/topics/unsuperClass)
soc <- unsuperClass(so,nClasses=3)
#plot resulting image
plot(soc$map)
#results might be different according to pixel set used for to classify
#to get uniform results u can use set.seed function
set.seed(42)
#unsupervised classification with 20 classes
sot <- unsuperClass(so,nClasses=20)
set.seed(42)
plot(sot$map)

#come lavorare con le nuovole
#1 - mask: dati landsat o modis danno disponibilità di file raster aggiuntivo per eliminare ombre e nuvole, ma crea dei "buchi"
#2 - si inserisce nella classificazione la classe di nuvole
#3 - uso di sensori non passivi (usano fonti di luce "Propria" come i sensori laser o radar)

#Grand Canyon (more info on: )
#upload images
GC <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
#let's have an eye on the uploaded image
plotRGB(GC, r=1,g=2,b=3, stretch="lin")
plotRGB(GC, r=1,g=2,b=3, stretch="hist")
#let's try with a different stretch


