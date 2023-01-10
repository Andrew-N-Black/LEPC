library(ggplot2)
library(readxl)
library(ggpubr)
library(dplyr)

HET_FILT <- read.csv("~/Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis/HET_FILT.csv")

#Heterozygosity by Habitat
ggplot(HET_FILT,aes(x=HABITAT,y=HET,fill=HABITAT))+geom_boxplot(show.legend =FALSE)+scale_fill_manual(title, values =c("Shinnery-Oak-Prairie"="bisque","Mixed-Grass-Prairie"="blue","Sand-Sagebrush-Prairie"="darkorchid1","Shortgrass-CRP-Mosaic"="darkolivegreen3"))+xlab("")+ylab("Individual Heterozygosity")+theme_classic()+coord_flip()+ylim(c(0,0.006))
ggsave("heterozygosity_habitat.svg")
ggsave("heterozygosity_habitat.pdf")


#Heterozygosity by time and DPS
#Order year
HET_FILT$Year <- ordered(HET_FILT$Year,levels = c("2008","2009","2010","2011","2013","2014","2015","2016","2017","2018","2019","2020","2021"))
ggplot(HET_FILT,aes(x=Year,y=HET,fill=DPS))+geom_boxplot()+scale_fill_manual("DPS", values =c("Northern"="brown","Southern"="yellow"))+xlab("Year")+ylab("Individual Heterozygosity")+theme_classic()+ theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+facet_wrap(~DPS,ncol=1)+ylim(0.0018,0.0058)





#Heterozygosity by LEK and Habitat

ggplot(HET_FILT,aes(x=reorder(LEK,HET),y=HET,fill=HABITAT))+geom_boxplot(outlier.shape = NA)+scale_fill_manual(title, values =c("Shinnery-Oak-Prairie"="bisque","Mixed-Grass-Prairie"="blue","Sand-Sagebrush-Prairie"="darkorchid1","Shortgrass-CRP-Mosaic"="darkolivegreen3"))+xlab("Lek")+ylab("Individual Heterozygosity")+theme_classic()+ylim(0.0018,0.0058)+ theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

#Remove two outliers with het ~0.01
HET_FILT_no_out <- read_excel("HET_FILT_no.out.xlsx")

#Test for normality
ggqqplot(HET_FILT_no_out$HET,ylab = "Individual Heterozygosity (N=418)")
shapiro.test(HET_FILT_no_out$HET)
data:  HET_FILT_no_out$HET
W = 0.79204, p-value < 2.2e-16

#Set as factor
HET_FILT_no_out$HABITAT_<-factor(HET_FILT_no_out$HABITAT,levels = c("Shinnery-Oak-Prairie","Mixed-Grass-Prairie","Sand-Sagebrush-Prairie","Shortgrass-CRP-Mosaic"))

#Order group
HET_FILT_no_out$HABITAT <- ordered(HET_FILT_no_out$HABITAT,levels = c("Shinnery-Oak-Prairie","Mixed-Grass-Prairie","Sand-Sagebrush-Prairie","Shortgrass-CRP-Mosaic"))

group_by(HET_FILT_no_out, HABITAT) %>%
    summarise(
        count = n(),
        mean = mean(HET, na.rm = TRUE),
        sd = sd(HET, na.rm = TRUE),
        median = median(HET, na.rm = TRUE),
        IQR = IQR(HET, na.rm = TRUE)
    )
    
kruskal.test(HET ~ HABITAT, data = HET_FILT_no_out)

	Kruskal-Wallis rank sum test

data:  HET by HABITAT
Kruskal-Wallis chi-squared = 199.61, df = 3, p-value < 2.2e-16


#REMOVE TWO OUTLIERS??
pairwise.wilcox.test(HET_FILT_no_out$HET, HET_FILT_no_out$HABITAT, p.adjust.method = "BH")
	
Pairwise comparisons using Wilcoxon rank sum test with continuity correction 

data:  HET_FILT_no_out$HET and HET_FILT_no_out$HABITAT 

                       Shinnery-Oak-Prairie Mixed-Grass-Prairie Sand-Sagebrush-Prairie
Mixed-Grass-Prairie    < 2e-16              -                   -                     
Sand-Sagebrush-Prairie 0.00064              0.09274             -                     
Shortgrass-CRP-Mosaic  < 2e-16              0.03366             0.03366               

P value adjustment method: BH 

