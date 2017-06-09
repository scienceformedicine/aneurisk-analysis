## Fri 05/14/17 

## define data file name
datafile <- paste(datapath, "tabla_completa_evelyn.xlsx", sep="")

## read data file
aneurisk <- read_excel(datafile, na = 'NA')

## fix accented column names
names(aneurisk) <- sapply(names(aneurisk), function(x) gsub("'", "", borr <- iconv(x, to='ASCII//TRANSLIT')))
