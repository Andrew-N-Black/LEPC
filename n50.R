library(ggplot2)
library(scales)
metrics <- read_excel("metrics.xlsx")
n50<-ggplot(metrics,aes(x=reorder(c.name,N50),y=N50,color=busco.c.percent,shape=level))  +  geom_segment(aes(xend=c.name,yend=0)) + geom_point(size=3)+ labs(y='Scaffold N50',x='')+theme_classic()+coord_flip()

n50+scale_colour_gradient2(
    high = "red",
    mid = "orange",
    low = "blue",
    midpoint = 80)
