
#By individual
FILTERED_ROH_IND <- read.csv("~/Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis/FILTERED_ROH_IND.csv")
melt_data<-melt(FILTERED_ROH_IND,id.vars = c("ID","HABITAT"))

ggplot(melt_data, aes(fill=variable, y=value, x=reorder(ID,value))) +geom_bar(stat="identity",position="dodge")+theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())+theme_classic()+facet_grid(~HABITAT,scales = "free_x")+
scale_fill_manual(values=c("#9933FF","darkred"))

ggsave("~/individual_roh.svg",width = 25, height = 4, units = "cm" )

#BY Habitat
ROH_habitat <- read_excel("~/Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis/ROH_habitat.xlsx")

ggplot(ROH_habitat, aes(fill=HABITAT, y=FROH, x=reorder(HABITAT,FROH))) + geom_bar(stat="identity",position = "dodge")+scale_fill_manual("Ecoregion", values =c("Shinnery-Oak-Prairie"="bisque","Mixed-Grass-Prairie"="blue","Sand-Sagebrush-Prairie"="darkorchid1","Shortgrass-CRP-Mosaic"="darkolivegreen3"))+xlab("")+ylab("fROH")+facet_wrap(~SIZE,ncol = 1)+theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())+theme_classic()
ggsave("~/habitat_roh.svg",width = 8, height = 8, units = "cm" )
 




