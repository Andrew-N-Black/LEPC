library(ggplot2)
library(readxl)
library(ggpubr)
library(dplyr)

HET_FILT <- read.csv("~/Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis/HET_FILT.csv")

#Heterozygosity by Habitat
ggplot(HET_FILT,aes(x=HABITAT,y=HET,fill=HABITAT))+geom_boxplot(show.legend =FALSE)+scale_fill_manual(title, values =c("Shinnery-Oak-Prairie"="bisque","Mixed-Grass-Prairie"="blue","Sand-Sagebrush-Prairie"="darkorchid1","Shortgrass-CRP-Mosaic"="darkolivegreen3"))+xlab("")+ylab("Individual Heterozygosity")+theme_classic()+coord_flip()+ylim(c(0,0.006))
ggsave("heterozygosity_habitat.svg")
ggsave("heterozygosity_habitat.pdf")

#Heterozygosity by LEK and Habitat

ggplot(HET_FILT,aes(x=reorder(LEK,HET),y=HET,fill=HABITAT))+geom_boxplot(outlier.shape = NA)+scale_fill_manual(title, values =c("Shinnery-Oak-Prairie"="bisque","Mixed-Grass-Prairie"="blue","Sand-Sagebrush-Prairie"="darkorchid1","Shortgrass-CRP-Mosaic"="darkolivegreen3"))+xlab("Lek")+ylab("Individual Heterozygosity")+theme_classic()+ylim(0.0018,0.0058)+ theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))




ggqqplot(partial_HET$HET)

#Set as factor
HET_FILT$HABITAT<-factor(HET_FILT$HABITAT,levels = c("Shinnery-Oak-Prairie","Mixed-Grass-Prairie","Sand-Sagebrush-Prairie","Shortgrass-CRP-Mosaic"))

#Order group
HET_FILT$HABITAT <- ordered(HET_FILT$HABITAT,levels = c("Shinnery-Oak-Prairie","Mixed-Grass-Prairie","Sand-Sagebrush-Prairie","Shortgrass-CRP-Mosaic"))


group_by(HET_FILT, HABITAT) %>%
    summarise(
        count = n(),
        mean = mean(HET, na.rm = TRUE),
        sd = sd(HET, na.rm = TRUE),
        median = median(HET, na.rm = TRUE),
        IQR = IQR(HET, na.rm = TRUE)
    )
    
kruskal.test(HET ~ HABITAT, data = HET_FILT)


    	Kruskal-Wallis rank sum test

data:  HET by HABITAT
Kruskal-Wallis chi-squared = 190.12, df = 3, p-value < 2.2e-16


#REMOVE TWO OUTLIERS??
pairwise.wilcox.test(HET_FILT$HET, HET_FILT$HABITAT, p.adjust.method = "BH")

	Pairwise comparisons using Wilcoxon rank sum test with continuity correction 

data:  HET_FILT$HET and HET_FILT$HABITAT 

                       Shinnery-Oak-Prairie Mixed-Grass-Prairie Sand-Sagebrush-Prairie
Mixed-Grass-Prairie    < 2e-16              -                   -                     
Sand-Sagebrush-Prairie 0.00096              0.09274             -                     
Shortgrass-CRP-Mosaic  < 2e-16              0.03366             0.03366               

P value adjustment method: BH 
