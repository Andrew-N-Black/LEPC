


library(pophelper)
library(readxl)
setwd("/Users/andrew/Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis")
metadata <- read.csv("metadata.csv")
both <- as.data.frame(metadata[,c(11,3)])
slist<-readQ(files =c("~/all_pca_356.admix.2.Q","~/all_pca.admix.4.Q","~/all_pca.admix.3.Q"))
plotQ(slist[1:3],returnplot=T,exportplot=T,imgoutput = "join",clustercol=c("blue","bisque","darkolivegreen3","darkorchid1"),grplab=both,ordergrp=T,showlegend=T,showtitle=T,showsubtitle=T,titlelab="LEPC",subtitlelab="population structure",height=1.6,indlabsize=1.8,indlabheight=0.08,indlabspacer=-1,barbordercolour="white",divsize = 0.1,grplabsize=1,barbordersize=0,linesize=0.4,showsp = T,splabsize = 0,outputfilename="plotq",imgtype="png",exportpath=getwd())

