# Visibility_index
Generates a per-pixel visibility index. Paralellized code compatible with linux environment. 

This code uses the [GVI package](https://github.com/STBrinkmann/GVI) to generate a Viewshed for each pixel of a raster map. the output is a raster with, for each pixel, a value in number of visible cell from this cell. In the study area I used, the visibility index was generated for a raster of 503km^2, with a resolution of 25m. 

For this study area, the code was run using 16 cores and 5gb of RAM per node. It took 1.36 days to complete. 

