## Fri 06/02/17 09:48:56

## make it a nice dataframe
aneurisk <- tbl_df(aneurisk)

## some of my variables should be factors
## aneurisk$CASE <- as.factor(aneurisk$CASE) 
aneurisk$EDAD <- as.integer(aneurisk$EDAD)
aneurisk$LOCALIZACION_ANEURISMA <- as.factor(aneurisk$LOCALIZACION_ANEURISMA)
aneurisk$ESTADO_RUPTURA <- as.factor(aneurisk$ESTADO_RUPTURA)
aneurisk$SEXO <- as.factor(aneurisk$SEXO)
aneurisk$TIPO_ANEURISMA <- as.factor(aneurisk$TIPO_ANEURISMA)
## aneurisk$MULTIPLE_ANEURISMA <- as.factor(aneurisk$MULTIPLE_ANEURISMA)
## aneurisk$INSTITUCION <- as.factor(aneurisk$INSTITUCION)
## aneurisk$MODALITY <- as.factor(aneurisk$MODALITY)
aneurisk$MORPHO_SHAPE <- as.factor(aneurisk$MORPHO_SHAPE)
aneurisk$ID <- as.factor(aneurisk$ID)

## map boolean variables to factor 0 & 1
aneurisk$ESTADO_RUPTURA_B     <- aneurisk$ESTADO_RUPTURA %>% as.factor ## ifelse(aneurisk$ESTADO_RUPTURA=='U', 0, 1) %>% as.factor
aneurisk$TIPO_ANEURISMA_B     <- ifelse(aneurisk$TIPO_ANEURISMA=='LAT', 0, 1) %>% as.factor
aneurisk$MULTIPLE_ANEURISMA_B <- ifelse(aneurisk$MULTIPLE_ANEURISMA, 1, 0) %>% as.factor

a <- aneurisk
