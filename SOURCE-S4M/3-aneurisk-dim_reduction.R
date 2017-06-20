## Aneurisk - Dimensionality reduction
## requires library(RDRToolbox)


## define matrix to be reduced
a_rdx <- as.matrix(a[, sapply(a, is.numeric)])

## select data to be reduced
## a_rdx <- a_rdx[, c(-1, -5)] ## deselect EDAD and tortuosity
a_rdx <- a_rdx[, c(2:8)]

## Locally Linear Embedding
LLE_dim2_a <- LLE(a_rdx, 2, 10)

## plot results
plotDR(as.data.frame(LLE_dim2_a), labels = as.numeric(a$ESTADO_RUPTURA_B))
ggplot(data = LLE_dim2_a %>% as.data.frame, aes(V1, V2)) + geom_point(aes(colour = a$ESTADO_RUPTURA_B == 'U')) + guides(colour=FALSE)

##IsoMap

## plot residuals for dims 1 to 10
IM_dim1to10_a <- Isomap(a_rdx, 1:10, 10, plotResiduals=TRUE)
## same with modified Isomap
IM_dim1to10_a_mod <- Isomap(a_rdx, 1:10, 10, plotResiduals=TRUE, mod = TRUE)

## from plots, we choose dim = 2
IM_dim2_a_mod <- Isomap(a_rdx, 2, 10, mod = TRUE, verbose = TRUE)

## plot results
plotDR(as.data.frame(IM_dim2_a_mod), labels = a$ESTADO_RUPTURA_B)
ggplot(data = IM_dim2_a_mod %>% as.data.frame, aes(V1, V2)) + geom_point(aes(colour = a$ESTADO_RUPTURA_B == 'U')) + guides(colour=FALSE)
