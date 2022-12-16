top6_results1 <- read_excel("~/Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis/top6_results1.xlsx")
                             
idab<-new_roh_ind[match(top6_results1$idb, new_roh_ind$ID),]

idaa<-new_roh_ind[match(top6_results1$ida, new_roh_ind$ID),]

ID_A<-cbind(idaa,top6_results1$KIN)
ID_A<-cbind(idaa,top6_results1$KIN,top6_results1$HABITAT_A)
ID_B<-cbind(idab,top6_results1$KIN,top6_results1$HABITAT_B)
 
ggplot(data = roh_kin,aes(x =KB, y =MB)) +  geom_point(aes(col = KIN),alpha=0.5)+scale_color_manual("Kinship", values =c("bisque","blue","darkorchid1","darkolivegreen3","grey"))+theme_classic()

