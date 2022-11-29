library(ggplot2)
library(readxl)
top6_results1 <- read_excel("top6_results1.xlsx")
ggplot(top6_results1,aes(x = KING, y = R0,group = KIN)) +
    geom_point(aes(col = KIN))+scale_color_manual("Kinship", values =c("Duplicates"="bisque","Parent-Offspring"="blue","Half-Siblings"="darkorchid1","Full-Cousins"="darkolivegreen3","Unrelated"="black"))+theme_classic2()


lek_kinship <- read_excel("Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis/lek_kinship.xlsx")
lek_kinship$GROUP<-factor(lek_kinship$GROUP,levels = c("Within","Between"))
ggplot(lek_kinship, aes(GROUP, COUNT))+geom_bar(aes(fill = GROUP), position = "dodge", stat="identity")+facet_wrap(~KINSHIP,scales = "free_y",ncol = 5)+scale_fill_manual("Lek", values =c("Within"="black","Between"="blue"))+xlab("")+ylab("Pairwise Comparisons")+theme_classic()+ theme(axis.text = element_text(size = 6)) +xlab("Lek")+theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())



#kinship based upon ecotype
kin <- read_excel("top6_results1_habitat_match.xlsx")
ggplot(data =kin, aes(forcats::fct_infreq(HABITAT_B)))+geom_bar(aes(fill=KIN),position="fill")+xlab("")+ylab("Pairwise Comparisons")+theme_classic()+coord_flip()+ theme(axis.text = element_text(size = 10)) +xlab("")+scale_fill_manual("Kinship", values =c("Duplicates"="bisque","Parent-Offspring"="blue","Half-Siblings"="darkorchid1","Full-Cousins"="darkolivegreen3","Unrelated"="black"))
ggsave("kin.svg")
ggsave("kin.pdf")
#Can change the order of the kinship factor and use as input for above if needed
df <- kin[order(kin$KIN,decreasing = TRUE),]
