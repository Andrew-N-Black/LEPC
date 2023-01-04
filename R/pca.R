library(readxl)
metadata <- read.csv("/Users/andrew/Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis/metadata_filt.csv")
View(metadata)                              
library(ggplot2)
cov<-as.matrix(read.table("~/all_pca.cov"))
axes<-eigen(cov)
axes$values/sum(axes$values)*100
  [1] 3.72338077 1.06535360 0.97923585 

PC1_3<-as.data.frame(axes$vectors[,1:3])
title1<-"Habitat"
#title2<-"Species"

ggplot(data=PC1_3, aes(y=V2, x=V1, shape=as.factor(metadata$DPS),color=as.factor(metadata$HABITAT)))+geom_point(size=2)+ theme_classic() + xlab("PC1 (3.72%)") +ylab("PC2 (1.06%)")+scale_color_manual("Ecoregion", values =c("Shinnery-Oak"="bisque","Mixed-Grass"="blue","Sand-Sagebrush"="darkorchid1","Shortgrass-CRP-Mosaic"="darkolivegreen3"))+geom_hline(yintercept=0,linetype="dashed")+geom_vline(xintercept =0,linetype="dashed")+scale_shape_manual("DPS",values=c(20,17))

 
#Policy
ggplot(data=PC1_3, aes(y=V2, x=V1,color=as.factor(metadata$DPS)))+geom_point(size=5,alpha=0.5)+ theme_classic() + xlab("PC1 (3.72%)") +ylab("PC2 (1.06%)")+scale_color_manual("DPS", values =c("Southern"="black","Northern"="orange"))+geom_hline(yintercept=0,linetype="dashed")+geom_vline(xintercept =0,linetype="dashed")+coord_flip()
