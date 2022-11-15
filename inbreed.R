library(ggplot2)
sampleinbreed <- read_excel("sampleinbreed.xltx")
ggplot(sampleinbreed,aes(x=reorder(LEK,FIS),y=FIS,fill=HABITAT))+geom_boxplot(show.legend =FALSE,outlier.shape = NA)+scale_fill_manual(title, values =c("Shinnery-Oak-Prairie"="bisque","Mixed-Grass-Prairie"="blue","Sand-Sagebrush-Prairie"="darkorchid1","Shortgrass-CRP-Mosaic"="darkolivegreen3"))+xlab("")+ylab("Inbreeding")+theme_classic()+coord_flip()
