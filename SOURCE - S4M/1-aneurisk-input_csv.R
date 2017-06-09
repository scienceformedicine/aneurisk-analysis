## Fri 06/02/17 09:34:09

## define data file name
datafile <- paste(datapath, "tabla_simple_evelyn.csv", sep="")

## read data file
aneurisk <- read_csv(datafile)

## fix accented column names
names(aneurisk) <- sapply(names(aneurisk), function(x) gsub("'", "", iconv(x, to='ASCII//TRANSLIT')))
## remove expressions in parenthesis
names(aneurisk) <- gsub(" \\([a-zA-Z /\\)]+", "", names(aneurisk))
## replace spaces
names(aneurisk) <- gsub(" ", "_", names(aneurisk))



