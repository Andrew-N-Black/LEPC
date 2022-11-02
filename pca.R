library(readxl)
metadata <- read_excel("Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis/metadata.xlsx")
View(metadata)                              
library(ggplot2)
cov<-as.matrix(read.table("scaf_22_pca.cov"))
axes<-eigen(cov)
axes$values/sum(axes$values)*100
  #[1] 3.75029565 1.06489268 1.02318401



title<-"Population"
ggplot(data=PC1_3, aes(y=V2, x=V1, shape=as.factor(metadata$SPECIES),color=as.factor(metadata$HABITAT)))+geom_point(size=5)+ theme_classic() + xlab("PC1 (3.75%)") +ylab("PC2 (1.06%)")+scale_color_manual(name="", values =c("Shinnery-Oak-Prairie"="bisque","Mixed-Grass-Prairie"="blue","Sand-Sagebrush-Prairie"="darkorchid1","Shortgrass-CRP-Mosaic"="darkolivegreen3"))+geom_hline(yintercept=0,linetype="dashed")+geom_vline(xintercept =0,linetype="dashed")+scale_shape_manual(title,values=c(20,18))
