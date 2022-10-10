
library(sp)
data(meuse)
names(meuse)

class(meuse)
#head(meuse)

set.coords = function(df){
  require(sp)
  # Function converts dataframe to spatialpointsdataframe
  # Convert to spatial points data frame
  coordinates(df) = ~x+y 

  # Assign the datum and compute the lat-lon of the 
  # of the x-y coordinates
  proj4string(df) <- CRS("+proj=stere
   +lat_0=52.15616055555555 +lon_0=5.38763888888889
   +k=0.999908 +x_0=155000 +y_0=463000
   +ellps=bessel +units=m +no_defs
   +towgs84=565.2369,50.0087,465.658,
   -0.406857330322398,0.350732676542563,-1.8703473836068, 4.0812")
  df
}
meuse = set.coords(meuse)
head(meuse)

summary(meuse)

data(meuse.grid)
class(meuse.grid)
head(meuse.grid)

meuse.grid = set.coords(meuse.grid)
gridded(meuse.grid) = TRUE

#head(meuse.grid)
summary(meuse.grid)

cols = c('cadmium', 'copper', 'lead', 'zinc')
plot.bubble = function(x){
  Title = paste('Concentration of ', x, 'in ppm')
  bubble(meuse, x,col=c("#00ff0088", "#00ff0088"), main = Title)
}
par(mar = c(0.7,0.7,0.7,0.7))
lapply(cols, plot.bubble)

require(ggplot2)
ggplot(data.frame(meuse), aes(dist, copper)) + 
  geom_point(size = 2, color = 'blue', alpha = 0.3)+
  ggtitle('Concentration of copper vs. distance') +
  ylab('Copper concentration in ppm') +
  xlab('Distance from river')

meuse$logCopper = log(meuse$copper)
ggplot(data.frame(meuse), aes(dist, logCopper)) + 
  geom_point(size = 2, color = 'blue', alpha = 0.3) +
  ggtitle('Log of concentration of copper vs. distance') +
  ylab('Log copper concentration in ppm') +
  xlab('Distance from river')

meuse$sqrtDist = sqrt(meuse$dist)
ggplot(data.frame(meuse), aes(sqrtDist, logCopper)) + 
  geom_point(size = 2, color = 'blue', alpha = 0.3)+
  ggtitle('Log of concentration of copper vs. sqrt of distance') +
  ylab('Log copper concentration in ppm') +
  xlab('Square root of distance from river')

#install.packages('gstat')
require(gstat)
copper.vgm = variogram(logCopper ~ sqrtDist, meuse)
copper.vgm.fit = fit.variogram(copper.vgm, model = vgm(1, "Sph", 900, 1))

plot(copper.vgm, copper.vgm.fit, main = "Semivariance of copper concentration vs. distance")

copper.vgm.dir = variogram(logCopper ~ sqrtDist, meuse, alpha = c(0, 45, 90, 135))
plot(copper.vgm.dir, copper.vgm.fit, main = 'Variograms of copper concentration at different angles')

copper.vgm.map = variogram(logCopper ~ sqrtDist, meuse, cutoff = 1500, width = 100, map = TRUE)
plot(copper.vgm.map, threshold = 5, main = "Map of semivariance of copper concentration")

meuse$logZinc = log(meuse$zinc)
meuse$sqrtDist = sqrt(meuse$dist)
ggplot(data.frame(meuse), aes(sqrtDist, logZinc)) + 
  geom_point(size = 2, color = 'blue', alpha = 0.3)+
  ggtitle('Log of concentration of zinc vs. sqrt of distance') +
  ylab('Log zinc concentration in ppm') +
  xlab('Square root of distance from river')
zinc.vgm = variogram(logZinc ~ sqrtDist, meuse)
zinc.vgm.fit = fit.variogram(zinc.vgm, model = vgm(1, "Sph", 900, 1))
plot(zinc.vgm, zinc.vgm.fit, main = "Semivariance of zinc concentration vs. distance")
zinc.vgm.dir = variogram(logZinc ~ sqrtDist, meuse, alpha = c(0, 45, 90, 135))
plot(zinc.vgm.dir, zinc.vgm.fit, main = 'Variograms of zinc concentration at different angles')
zinc.vgm.map = variogram(logZinc ~ sqrtDist, meuse, cutoff = 1500, width = 100, map = TRUE)
plot(zinc.vgm.map, threshold = 5, main = "Map of semivariance of zinc concentration")

par(mar = c(0.7,0.7,0.7,0.7))
image(meuse.grid["dist"])
title("distance to river (red = 0)")

copper.idw = idw(copper ~ 1, meuse, meuse.grid)
names(copper.idw)

par(mar = c(0.7,0.7,0.7,0.7))
spplot(copper.idw["var1.pred"], main = "Inverse distance weighted interpolation for copper concentration")

copper.kriged = krige(logCopper ~ 1, meuse, meuse.grid, model = copper.vgm.fit)
spplot(copper.kriged["var1.pred"], main ="Plot of kriging model of copper concentration")

zinc.idw = idw(zinc ~ 1, meuse, meuse.grid)
names(zinc.idw)
par(mar = c(0.7,0.7,0.7,0.7))
spplot(zinc.idw["var1.pred"], main = "Inverse distance weighted interpolation for zinc concentration")
zinc.kriged = krige(logZinc ~ 1, meuse, meuse.grid, model = zinc.vgm.fit)
spplot(zinc.kriged["var1.pred"], main ="Plot of kriging model of zinc concentration")
