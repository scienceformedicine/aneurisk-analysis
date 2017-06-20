## main paths and sources

## set up paths and filenames
mainpath   <- "/Users/moyano/Projects/PROJECT - S4M - science4medicine/aneurisk-analysis/"

sourcepath <- paste(mainpath, "SOURCE-S4M/", sep = "")
datapath   <- paste(mainpath, "DATA-S4M/",   sep = "")

## source modules

source(paste(sourcepath, "0-aneurisk-config.R", sep=""))
source(paste(sourcepath, "1-aneurisk-input_csv.R", sep=""))
source(paste(sourcepath, "2-aneurisk-data-cleansing.R", sep=""))
source(paste(sourcepath, "3-aneurisk-general.R", sep=""))
## source(paste(sourcepath, "3-aneurisk-classification.R", sep=""))
## source(paste(sourcepath, "3-aneurisk-regression.R", sep=""))
## source(paste(sourcepath, "4-aneurisk-figs.R", sep=""))

