


library(pophelper)
setwd("/Users/andrew/Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis")
metadata <- read.csv("metadata_filt.csv")
#both <- as.data.frame(metadata[,c(11,3)])
one <- as.data.frame(metadata[,11])
colnames(one)<-"Ecoregion"
slist<-readQ(files =c("~/all_pca_356.admix.2.Q","~/all_pca.admix.3.Q","~/all_pca.admix.4.Q","~/all_pca.admix.5.Q"))
plotQ(slist[1:5],returnplot=T,exportplot=T,imgoutput = "join",clustercol=c("blue","bisque","darkolivegreen3","darkorchid1","#666666","#3399CC"),grplab=one,ordergrp=T,showlegend=F,height=1.6,indlabsize=1.8,indlabheight=0.08,indlabspacer=-1,barbordercolour="black",divsize = 0.1,grplabsize=1,barbordersize=0,linesize=0.4,showsp = F,splabsize = 4,outputfilename="plotq",imgtype="png",exportpath=getwd(),splab = c("K=2","K=3","K=4","K=5","K=6"),divcol = "black",splabcol="black",grplabheight=5)

#Sort by Habitat then lek
both <- as.data.frame(metadata[,c(11,5)])
plotQ(slist[1:4],returnplot=T,exportplot=T,imgoutput = "join",clustercol=c("blue","bisque","darkolivegreen3","darkorchid1","grey"),grplab=both,ordergrp=T,showlegend=F,height=1.6,indlabsize=1.8,indlabheight=0.08,indlabspacer=1,barbordercolour="black",divsize = 0.1,grplabsize=0.5,barbordersize=0,linesize=0.4,showsp = F,splabsize = 4,outputfilename="plotq",imgtype="png",exportpath=getwd(),splab = c("K=2","K=3","K=4","K=5"),divcol = "black",splabcol="black",grplabheight=5,grplabjust = 0.1, grplabangle = 45)
