library(ggplot2)
LEPC_samples <- read_excel("~/LEPC_samples.xlsx")
ggplot(x, aes(x=location,fill=Sex)) + geom_bar()+theme_classic()+scale_fill_manual( values =c("Male"="black","Female"="red","Unknown"="grey"))+ theme(legend.position="bottom")+ylab("# Cataloged samples")+ggtitle("Curated Samples")+coord_flip()+xlab("")
