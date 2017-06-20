## Fri 06/02/17 09:48:56

## make it a nice tibble dataframe, which I already know to be validated as proper
aneurisk <- as_tibble(aneurisk, validate = FALSE)

## some of my variables should be factors

aneurisk$EDAD <- as.integer(aneurisk$EDAD)
aneurisk$LOCALIZACION_ANEURISMA <- as.factor(aneurisk$LOCALIZACION_ANEURISMA)
aneurisk$ESTADO_RUPTURA <- as.factor(aneurisk$ESTADO_RUPTURA)
aneurisk$SEXO <- as.factor(aneurisk$SEXO)
aneurisk$TIPO_ANEURISMA <- as.factor(aneurisk$TIPO_ANEURISMA)
aneurisk$MORPHO_SHAPE <- as.factor(aneurisk$MORPHO_SHAPE)
aneurisk$ID <- as.factor(aneurisk$ID)

## map boolean variables to factor 0 & 1
aneurisk$ESTADO_RUPTURA_B     <- ifelse(aneurisk$ESTADO_RUPTURA=='U', 0, 1) %>% as.factor
## aneurisk$TIPO_ANEURISMA     <- ifelse(aneurisk$TIPO_ANEURISMA=='LAT', 0, 1) %>% as.factor
## aneurisk$MULTIPLE_ANEURISMA <- ifelse(aneurisk$MULTIPLE_ANEURISMA, 1, 0) %>% as.factor

a  <- aneurisk

## drop irrelevant variables (note as.data.frame(), as caret doesn't play ball with tibbles)
asmall <- a %>% select(ESTADO_RUPTURA, aspectRatio_star, sizeRatio_star, tortuosity, MORPHO_SHAPE, SEXO, EDAD) %>% as.data.frame

## preprocess data 
apre_cs <- preProcess(asmall, method = c("center", "scale"))
prea_cs <- predict(apre_cs, asmall)
write_csv(prea_cs, "../DATA-S4M/prea_cs.csv")

apre_bcs <- preProcess(asmall, method = c("BoxCox", "center", "scale"))
prea_bcs <- predict(apre_bcs, asmall)
write_csv(prea_bcs, "../DATA-S4M/prea_bcs.csv")

apre_bcsp2 <- preProcess(asmall, method = c("BoxCox", "center", "scale", "pca"), pcaComp = 2)
prea_bcsp2 <- predict(apre_bcsp2, asmall)
write_csv(prea_bcsp2, "../DATA-S4M/prea_bcsp2.csv")

apre_bcsp3 <- preProcess(asmall, method = c("BoxCox", "center", "scale", "pca"), pcaComp = 3)
prea_bcsp3 <- predict(apre_bcsp3, asmall)
write_csv(prea_bcsp3, "../DATA-S4M/prea_bcsp3.csv")

plot_ly(apre, x = ~PC1, y = ~PC2, z = ~PC3, type = 'scatter3d', opacity = 1, color = ~ESTADO_RUPTURA)
plot3d(apre$PC1, apre$PC2, apre$PC3, col = ifelse(apre$ESTADO_RUPTURA=="U", "blue", "red"))

## Isomap
IM_dim1to10_a <- Isomap(asmall, 1:10, 10, plotResiduals=TRUE)

IM_dim1to10_a_mod <- Isomap(a_rdx, 1:10, 10, plotResiduals=TRUE, mod = TRUE)

IM_dim2_a_mod <- Isomap(a_rdx, 2, 10, mod = TRUE)
##plotDR(as.data.frame(IM_dim2_a_mod), labels = a$ESTADO_RUPTURA_B)
ggplot(data = IM_dim2_a_mod$dim2 %>% as.data.frame, aes(V1, V2)) + geom_point(aes(colour = a$ESTADO_RUPTURA_B == 'U')) + guides(colour=FALSE)
