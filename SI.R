#Plot global depth among all 456 samples
library(ggplot2)
library(readxl)
all_LEPC_depthGlobal <- read_excel("all_LEPC_depthGlobal_4k.xls")
View(all_LEPC_depthGlobal)

ggplot(data=all_LEPC_depthGlobal,aes(x=cov,y=sites))+geom_bar(stat="identity")+theme_classic()+xlab("Global Depth")+
ylab("#Sites")+theme(axis.text=element_text(size=8),axis.title=element_text(size=10,face="bold"))+
geom_vline(xintercept = 1300)+geom_vline(xintercept = 2500)
ggsave("S1.svg")


#Plotting Depth:

depth_breadth <- read_excel("~/Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis/depth_breadth.xlsx")
ggplot(data=depth_breadth, aes(y=filt.d, x=reorder(ID,filt.d),fill=HABITAT))+
+     geom_bar(stat="identity")+scale_fill_manual(title1, values =c("Shinnery-Oak-Prairie"="bisque","Mixed-Grass-Prairie"="blue","Sand-Sagebrush-Prairie"="darkorchid1","Shortgrass-CRP-Mosaic"="darkolivegreen3"))+ylab("Coverage")+xlab("Bird")+theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank())

ggsave("cov.svg")

#Mapping rate
ggplot(data=depth_breadth, aes(y=map, x=reorder(ID,map),fill=HABITAT))+
+     geom_bar(stat="identity")+scale_fill_manual(title1, values =c("Shinnery-Oak-Prairie"="bisque","Mixed-Grass-Prairie"="blue","Sand-Sagebrush-Prairie"="darkorchid1","Shortgrass-CRP-Mosaic"="darkolivegreen3"))+ylab("Reads Aligned (%)")+xlab("Bird")+theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank())

ggsave("mapping.svg")

