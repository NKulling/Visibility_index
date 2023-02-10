library(terra)
library(GVI)
library(sf)
library(parallel)
library(pbmcapply)


### Visibility analysis

#Local variables

setwd("...")
datafold<-paste(getwd(),"/data",sep="")
results<-paste(getwd(),"/results",sep="")

ncores<-16 # number of cores used

#-- digital surface model (from swissSurface, aggregated at 25m)
dsm<-rast(".../surfaceheight.tif")

#-- digital terrain model
dtm<-rast(readRDS(".../ch_topo_alti3d2016_pixel_dem_mean2m.rds"))
crs(dtm)<-crs(dsm)

print("all variables loaded")

#-- Study area grid points

points<-st_read(paste(datafold,"25m_grid_gph.shp",sep="/"))
points$obs<-NA # This column will get filled with amount of cells visible per pixel
points<-st_transform(points,crs(dtm))

print("points crs transformed")

#-- Running viewshed analysis

#-- viewshed function

vis<-function(x){
  
  p1<-points[x,]
  
  a<-viewshed(
    p1,
    dsm,
    dtm,
    max_distance = 16000,
    observer_height = 1.7,
  )
  v<-table(values(a))[2]  
  return(v)
  
}

## Using the mapply function

st<-Sys.time()
vv<-pbmcmapply(vis,seq(nrow(points)), mc.cores=ncores )

points$obs<-vv

points_obs<-vect(points)

writeVector(points_obs, paste(results,"points_viewshed_25m.shp",sep="/"))

end<-Sys.time()
elapsed<-difftime(end,st)

print(elapsed)
