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
ggplot(HET_FILT,aes(x=LEK,y=HET,fill=HABITAT))+geom_boxplot(show.legend =FALSE)+scale_fill_manual(title, values =c("Shinnery-Oak-Prairie"="bisque","Mixed-Grass-Prairie"="blue","Sand-Sagebrush-Prairie"="darkorchid1","Shortgrass-CRP-Mosaic"=""darkolivegreen3""))+xlab("")+ylab("Individual Heterozygosity")+theme_classic()+coord_flip()+ylim(c(0,0.006))+ theme(axis.text = element_text(size = 6)) +xlab("Lek")


ggqqplot(partial_HET$HET)

#Set as factor
partial_HET$HABITAT<-factor(partial_HET$HABITAT,levels = c("Shinnery-Oak-Prairie","Mixed-Grass-Prairie","Sand-Sagebrush-Prairie","Shortgrass-CRP-Mosaic"))

#Order group
partial_HET$HABITAT <- ordered(partial_HET$HABITAT,levels = c("Shinnery-Oak-Prairie","Mixed-Grass-Prairie","Sand-Sagebrush-Prairie","Shortgrass-CRP-Mosaic"))


group_by(partial_HET, HABITAT) %>%
    summarise(
        count = n(),
        mean = mean(HET, na.rm = TRUE),
        sd = sd(HET, na.rm = TRUE),
        median = median(HET, na.rm = TRUE),
        IQR = IQR(HET, na.rm = TRUE)
    )
    
kruskal.test(HET ~ HABITAT, data = partial_HET)


    	Kruskal-Wallis rank sum test

data:  HET by HABITAT
Kruskal-Wallis chi-squared = 168.95, df = 3, p-value < 2.2e-16



pairwise.wilcox.test(partial_HET$HET, partial_HET$HABITAT,
+                      p.adjust.method = "BH")

	Pairwise comparisons using Wilcoxon rank sum test with continuity correction 

data:  partial_HET$HET and partial_HET$HABITAT 

                       Shinnery-Oak-Prairie Mixed-Grass-Prairie Sand-Sagebrush-Prairie
Mixed-Grass-Prairie    <2e-16               -                   -                     
Sand-Sagebrush-Prairie 0.0024               0.2486              -                     
Shortgrass-CRP-Mosaic  <2e-16               0.1262              0.0691                

P value adjustment method: BH 
