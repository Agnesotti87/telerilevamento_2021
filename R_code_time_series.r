#time series analysis
#greenland increase of temperature
# data and code from Emanuela Cosma
# importare una serie di dati multitemporali
setwd("C:/lab/greenland")
#install and/or recall raster package
install.packages("raster")
liberary(raster)
# i dati riguardano la temperatura della superficie nei vari anni (Land Surface Temperature) e provengono da Copernicus (more info on https://land.copernicus.vgt.vito.be/PDF/portal/Application.html#Home)
# Il satellite MODIS rileva, tra le altre, le temperature lst, con una risoluzione tra 500-2500 m  (more info on https://modis.gsfc.nasa.gov/data/dataprod/mod11.php)
#dato che non si tratta di dati multispettrali, utilizzeremo la funzione raster per importare le img
lst_2000 <- raster("lst_2000.tif")
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")
#plottiamo le immagini su un multipanel
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)
# per evitare la ripetitività, è possibile impostare un ciclo di comandi
#in questo caso grazie alla funzione "lapply function" che applica la stessa funzione ad una lista di file (more on https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/lapply)
#creare una lista di file con la funzione list.files (more on https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/list.files)
rlist <- list.files(pattern="lst")  #il pattern permette di inserire nella lista tutti gli oggetti con la caratteristica individuata come pattern
rlist
#siamo pronti per attivare il ciclo con lapply
import <- lapply(rlist, raster)    #lapply(lista di file, funzione)
import
#una volta importati i file, possiamo usare la stessa lapply per plottarli
par(mfrow=c(2,2))
plot <- lapply(import, plot)
# posso semplificare evitando di predisporre un multiframe con la funzione stack (more on: https://www.rdocumentation.org/packages/raster/versions/3.4-5/topics/stack)
#crea un gruppo di file raster tutti insieme
TGr <- stack(import)
plot(TGr)
# plottando questi dati con il plotRG ho modo di valutare la variazione della T nel tempo
plotRGB(TGr, 1, 2, 3, stretch="Lin")

# call to action: try playing with color.hist function
