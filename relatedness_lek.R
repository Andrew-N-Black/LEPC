library(ggplot2)
library(readxl)
lek_kinship <- read_excel("Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis/lek_kinship.xlsx")
lek_kinship$GROUP<-factor(lek_kinship$GROUP,levels = c("Within","Between"))
ggplot(lek_kinship, aes(GROUP, COUNT))+geom_bar(aes(fill = GROUP), position = "dodge", stat="identity")+facet_wrap(~KINSHIP,scales = "free_y",ncol = 5)+scale_fill_manual("Lek", values =c("Within"="black","Between"="blue"))+xlab("")+ylab("Pairwise Comparisons")+theme_classic()+ theme(axis.text = element_text(size = 6)) +xlab("Lek")+theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())



#Better sorted plot showing relatedness within each lek
library(forcats)
library(ggplot2)
kin<-read_xlsx("scaffold1-results_TRUE.xlsx")
kin$KIN <- factor(kin$KIN, names(sort(table(kin$KIN), decreasing = TRUE)))
ggplot(data =df, aes(forcats::fct_infreq(LEK_A)))+geom_bar(aes(fill=KIN))+coord_flip()+xlab("")+ylab("Pairwise Comparisons")+theme_classic()+coord_flip()+ theme(axis.text = element_text(size = 4)) +xlab("Lek")+scale_fill_manual(title, values =c("DUPLICATE"="bisque","PO"="blue","HS"="darkorchid1","FC"="darkolivegreen3","UR"="black"))

#Or kinship based upon ecotype
ggplot(data =df, aes(forcats::fct_infreq(HABITAT_A)))+geom_bar(aes(fill=KIN))+coord_flip()+xlab("")+ylab("Pairwise Comparisons")+theme_classic()+coord_flip()+ theme(axis.text = element_text(size = 10)) +xlab("Ecotype")+scale_fill_manual(title, values =c("DUPLICATE"="bisque","PO"="blue","HS"="darkorchid1","FC"="darkolivegreen3","UR"="black"))

#Can change the order of the kinship factor and use as input for above if needed
df <- kin[order(kin$KIN,decreasing = TRUE),]
