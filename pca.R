library(readxl)
metadata <- read.csv("/Users/andrew/Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis/metadata.csv")
View(metadata)                              
library(ggplot2)
cov<-as.matrix(read.table("scaf_22_pca.cov"))
axes<-eigen(cov)
axes$values/sum(axes$values)*100
  [1] 3.81590616 1.04967471 0.94312197 0.78195581 0.76650334

title1<-"Habitat"
title2<-"Species"

ggplot(data=PC1_3, aes(y=V2, x=V1, shape=as.factor(metadata$SPECIES),color=as.factor(metadata$HABITAT)))+geom_point(size=2)+ theme_classic() + xlab("PC1 (3.75%)") +ylab("PC2 (1.06%)")+scale_color_manual(title1, values =c("Shinnery-Oak-Prairie"="bisque","Mixed-Grass-Prairie"="blue","Sand-Sagebrush-Prairie"="darkorchid1","Shortgrass-CRP-Mosaic"="darkolivegreen3"))+geom_hline(yintercept=0,linetype="dashed")+geom_vline(xintercept =0,linetype="dashed")+scale_shape_manual(title2,values=c(20,18))

