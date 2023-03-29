# script to "optimize" image files in a directory, i.e. reduce to reasonable size for web
library(magick)
library(tools)

## e.g. get all photos in dir
image_dir <- file.path("media")

files <- dir(image_dir, pattern = "jpeg|jpg|png")

## create in optimized sub-directory to start with - don't over-write originals
out_dir <- file.path(image_dir, "optimized")
dir.create(out_dir, showWarnings = FALSE)

for (i in seq_along(files)){
    img <- image_read(file.path(image_dir, files[i]))
    
    # resize to 800 px width, using Triangle filter for resample
    img <- image_resize(img, geometry_size_pixels(width = 800),
                        filter = "Triangle")
    
    # strip metadata (loses date taken, keep here)
    #img <- image_strip(img)
    
    image_write(img, file.path(out_dir, 
                               paste0(file_path_sans_ext(files[i]), ".jpg")),
                format = "jpg", quality = 82)
}

# Check results - if photos have already been reduced in size, results may be 
# worse! May also want to crop before over-writing originals.
