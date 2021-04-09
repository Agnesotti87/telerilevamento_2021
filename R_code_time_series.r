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

# DAY 2
#RICHIAMARE SEMPRE TUTTE LE LIBRERIE ALL'INIZIO DEL CODICE R
#install and recall rasterVis package
# we will explore levelplot function (more info )on: https://www.rdocumentation.org/packages/lattice/versions/0.15-3/topics/levelplot)
#set wd
setwd("C:/lab/greenland")
#import greenland files with lapply
rlist <- list.files(pattern="lst")
rlist
import <- lapply(rlist,raster)
import
TGr <- stack(import)
#now let's explore levelplot function
levelplot(TGr)
#levelplot restituisce la mappa dei valori con relativo grafico
#rispetto a un semplice plot function, l'output visivo è migliore, più definito
# let's play with colors
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
levelplot(TGr, col.regions=cl)
#con levelplot è anche possibile rinominare le mappe di output, usando l'argomento names
levelplot(TGr,col.regions=cl, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))
# è possibile aggiungere anche un titolo principale
levelplot(TGr,col.regions=cl, , main="LST variation in time", names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))
#let's explore greenland melting data
# new import list
melt_list <- list.files(pattern="melt")
melt_import <- lapply(melt_list, raster)
#stack melt file
melt <- stack(melt_import)
melt
# and plot it
levelplot(melt)
# plot difference between 2007 vs 1979
# prima produrre lo strato di dati da plottare (check nella tabella)
melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt
clb <- colorRampPalette(c("blue","white","red"))(100)
#and plot
plot(melt_amount, col=clb)
#better resolution with levelplot
levelplot(melt_amount, color.regions=clb)
