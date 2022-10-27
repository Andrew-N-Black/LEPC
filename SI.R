#Plot global depth among all 456 samples
library(ggplot2)
library(readxl)
all_LEPC_depthGlobal <- read_excel("all_LEPC_depthGlobal_4k.xls")
View(all_LEPC_depthGlobal)

ggplot(data=all_LEPC_depthGlobal,aes(x=cov,y=sites))+geom_bar(stat="identity")+theme_classic()+xlab("Global Depth")+
ylab("#Sites")+theme(axis.text=element_text(size=8),axis.title=element_text(size=10,face="bold"))+
geom_vline(xintercept = 1300)+geom_vline(xintercept = 2500)
ggsave("S1.svg")


