## aneurisk figures - Fri 06/02/17 11:01:39

## boxplot of tortuosity for different MORPHO_SHAPES
ggplot(aneurisk) + geom_boxplot(aes(x = as.factor(MORPHO_SHAPE), y = tortuosity), alpha = 0.3) 

## volume
ggplot(data = aneurisk, x = sacVolume) + geom_histogram(aes(x = sacVolume, y = ..count.., fill = ESTADO_RUPTURA), bins = 50, alpha = 0.3, colour = "blue", size = .10) + scale_fill_manual(name="Estado del\naneurisma", values = c("blue", "red"), labels=c("NO ROTO", "ROTO")) + xlab("Volumen") 

## area
ggplot(data = aneurisk, x = sacSurfaceArea) + geom_histogram(aes(x = sacSurfaceArea, y = ..count.., fill = ESTADO_RUPTURA), bins = 50, alpha = 0.3, colour = "blue", size = .10) + scale_fill_manual(name="Estado del\naneurisma", values = c("blue", "red"), labels=c("NO ROTO", "ROTO")) + xlab("Área") 


