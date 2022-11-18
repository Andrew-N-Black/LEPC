
melt_data<-melt(roh,id.vars = c("FID","LEK","SEX","AGE","STATE","HABITAT"))

roh <- read.csv("~/roh.csv")
ggplot(melt_data, aes(fill=variable, y=value, x=reorder(FID,value))) + 
    geom_bar(stat="identity",position="dodge")+theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())+theme_classic()+facet_wrap(~HABITAT,scales = "free")+
    scale_fill_manual(values=c("#9933FF",
                               "darkred"))
 
