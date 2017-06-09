## aneurisk figures - Fri 06/02/17 11:01:39

## boxplot of tortuosity for different MORPHO_SHAPES
ggplot(aneurisk) + geom_boxplot(aes(x = as.factor(MORPHO_SHAPE), y = tortuosity), alpha = 0.3) 

