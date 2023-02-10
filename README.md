# Visibility_index
Generates a per-pixel visibility index. Paralellized code compatible with linux environment. 

This code uses the [GVI package](https://github.com/STBrinkmann/GVI) to generate a Viewshed for each pixel of a raster map. the output is a raster with, for each pixel, a value in number of visible cell from this cell. In the study area I used, the visibility index was generated for a raster of 503km^2, with a resolution of 25m. 

For this study area, the code was run using 16 cores and 5gb of RAM per node. It took 1.36 days to ccomplete. 

------

Workflow: 

1. Take study extent polygon, rasterize to desired resolution of final output
2. Transform the raster to points
3. Get DTM and DSM layers for the study area. Note that you need a DTM and DSM larger than your area of interest, with a buffer size depending on the maximum visibility distance set in the visibility function
4. Run the visibility_index.R code with these inputs
5. Transform the output (points file) to a raster, using the "obs" column as value

![output_map](https://github.com/NKulling/Visibility_index/blob/main/output_map.png)



