library(ggplot2)
inbreed_filt <- read.csv("~/Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis/inbreed_filt.csv")
ggplot(inbreed_filt,aes(x=HABITAT,y=FIS))+geom_abline(intercept = 0.00,slope=0,col="black", linewidth=1, lty=2)+geom_boxplot(show.legend =FALSE,fill="orange")+xlab("")+ylab("F")+theme_classic()+ theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))+coord_flip()
ggsave("inbreeding.svg")
ggsave("inbreeding.pdf")

#ggplot(inbreed_filt,aes(x=reorder(LEK,FIS),y=FIS,fill=HABITAT))+geom_boxplot(show.legend =FALSE,outlier.shape = NA)+scale_fill_manual(title, values =c("Shinnery-Oak-Prairie"="bisque","Mixed-Grass-Prairie"="blue","Sand-Sagebrush-Prairie"="darkorchid1","Shortgrass-CRP-Mosaic"="darkolivegreen3"))+xlab("")+ylab("Inbreeding")+theme_classic()+coord_flip()+geom_abline(intercept = 0.00,slope=0)

#ggplot(inbreed_filt,aes(x=reorder(HABITAT,FIS),y=FIS,fill=HABITAT))+geom_boxplot(show.legend =FALSE,outlier.shape = NA)+scale_fill_manual(title, values =c("Shinnery-Oak-Prairie"="bisque","Mixed-Grass-Prairie"="blue","Sand-Sagebrush-Prairie"="darkorchid1","Shortgrass-CRP-Mosaic"="darkolivegreen3"))+xlab("")+ylab("Inbreeding")+theme_classic()+coord_flip()+geom_abline(intercept = 0.00,slope=0)
#ggsave("inbreeding.svg")
#ggsave("inbreeding.pdf")
