


library(pophelper)
library(readxl)
setwd("/Users/andrew/Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis")
metadata <- read_excel("metadata.xlsx")
group <- metadata[,10]
#group <- metadata[,c(2,3,8,10,11)]
k2<-readQ("~/all_pca_356.admix.2.Q")
plotQ(qlist=k2,returnplot=T,exportplot=T,clustercol=c("black","darkgrey"),grplab=group,ordergrp=T,showlegend=T,showtitle=T,showsubtitle=T,titlelab="LEPC",subtitlelab="population structure",height=1.6,indlabsize=1.8,indlabheight=0.08,indlabspacer=-1,barbordercolour="white",divsize = 0.1,grplabsize=1,barbordersize=0,linesize=0.4,showsp = T,splabsize = 0,outputfilename="plotq",imgtype="png",exportpath=getwd())
