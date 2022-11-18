
#By individual
roh<-x[c(2,5,6,7,8,11,16,17)]
melt_data<-melt(roh,id.vars = c("ID","LEK","SEX","AGE","STATE","HABITAT"))

ggplot(melt_data, aes(fill=variable, y=value, x=reorder(ID,value))) +geom_bar(stat="identity",position="dodge")+theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())+theme_classic()+facet_grid(~HABITAT,scales = "free_x")+
scale_fill_manual(values=c("#9933FF","darkred"))

ggsave("~/individual_roh.svg",width = 25, height = 4, units = "cm" )



melt_data<-melt(roh,id.vars = c("FID","LEK","SEX","AGE","STATE","HABITAT"))

roh <- read.csv("~/roh.csv")
ggplot(melt_data, aes(fill=variable, y=value, x=reorder(FID,value))) + 
    geom_bar(stat="identity",position="dodge")+theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())+theme_classic()+facet_wrap(~HABITAT,scales = "free")+
    scale_fill_manual(values=c("#9933FF",
                               "darkred"))
 




