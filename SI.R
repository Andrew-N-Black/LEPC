#Load R packages
library(ggplot2)
library(readxl)

#Subet length of scaffolds and plot
length_scaff <- read_excel("Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis/length_scaff.xlsx")
new<-subset(length_scaff,lepc_length > 100000,select=c(lepc_seq,lepc_length))

ggplot(data=new, aes(y=lepc_length, x=reorder(lepc_seq,lepc_length)))+geom_bar(stat="identity")+theme_classic()+ylab("Length")+xlab("Scaffold")+theme(axis.text.y=element_blank(), axis.ticks.y=element_blank())+coord_flip()
ggsave("S1a.svg")

#Mapping rate
ggplot(data=depth_breadth, aes(y=map, x=reorder(ID,map),fill=HABITAT))+geom_bar(stat="identity")+scale_fill_manual(title1, values =c("Shinnery-Oak-Prairie"="bisque","Mixed-Grass-Prairie"="blue","Sand-Sagebrush-Prairie"="darkorchid1","Shortgrass-CRP-Mosaic"="darkolivegreen3"))+xlab("Sample (N=420)")+ylab("Reads Aligned (% properly paired)")+theme( axis.ticks.y=element_blank(),axis.text.y = element_blank())+coord_flip()+ylim(c(0,100))
ggsave("S1b.svg")


#Plotting Depth:

depth_breadth <- read_excel("~/Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis/depth_breadth_filt.xlsx")
ggplot(data=depth_breadth, aes(y=filt.d, x=reorder(ID,filt.d),fill=HABITAT))+ geom_bar(stat="identity")+scale_fill_manual(title1, values =c("Shinnery-Oak-Prairie"="bisque","Mixed-Grass-Prairie"="blue","Sand-Sagebrush-Prairie"="darkorchid1","Shortgrass-CRP-Mosaic"="darkolivegreen3"))+xlab("Sample (N=420)")+ylab("Coverage")+theme( axis.ticks.y=element_blank(),axis.text.y = element_blank())+coord_flip()

ggsave("S1c.svg")

#Plotting Breadth
ggplot(data=depth_breadth, aes(y=filt.b, x=reorder(ID,filt.b),fill=HABITAT))+  geom_bar(stat="identity")+scale_fill_manual(title1, values =c("Shinnery-Oak-Prairie"="bisque","Mixed-Grass-Prairie"="blue","Sand-Sagebrush-Prairie"="darkorchid1","Shortgrass-CRP-Mosaic"="darkolivegreen3"))+xlab("Sample (N=420)")+ylab("Breadth")+theme( axis.ticks.y=element_blank(),axis.text.y = element_blank())+coord_flip()+ylim(c(0,100))
ggsave("S1d.svg")

#Plotting global depth
all_LEPC_depthGlobal <- read_excel("all_LEPC_depthGlobal_4k.xls")
View(all_LEPC_depthGlobal)

#Plot global depth among all 456 samples

ggplot(data=all_LEPC_depthGlobal,aes(x=cov,y=sites))+geom_bar(stat="identity")+theme_classic()+xlab("Global Depth")+
ylab("#Sites")+theme(axis.text=element_text(size=8),axis.title=element_text(size=10,face="bold"))+
geom_vline(xintercept = 1300)+geom_vline(xintercept = 2500)
ggsave("S1e.svg")


