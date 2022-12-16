


library(pophelper)
setwd("/Users/andrew/Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis")
metadata <- read.csv("metadata_filt.csv")
#both <- as.data.frame(metadata[,c(11,3)])
one <- as.data.frame(metadata[,11])
colnames(one)<-"Ecoregion"
slist<-readQ(files =c("~/K2.Q","~/K3.Q","~/K4.Q","~/K5.Q"))
plotQ(slist[1:4],returnplot=T,exportplot=T,imgoutput = "join",clustercol=c("blue","bisque","darkolivegreen3","darkorchid1","grey"),grplab=one,ordergrp=T,showlegend=F,height=1.6,indlabsize=1.8,indlabheight=0.08,indlabspacer=1,barbordercolour="black",divsize = 0.1,grplabsize=1.5,barbordersize=0,linesize=0.4,showsp = F,splabsize = 4,outputfilename="plotq",imgtype="png",exportpath=getwd(),splab = c("K=2","K=3","K=4","K=5"),divcol = "black",splabcol="black",grplabheight=1.5)

#Sort by Habitat then lek
both <- as.data.frame(metadata[,c(11,5)])
plotQ(slist[1:4],returnplot=T,exportplot=T,imgoutput = "join",clustercol=c("blue","bisque","darkolivegreen3","darkorchid1","grey"),grplab=both,ordergrp=T,showlegend=F,height=1.6,indlabsize=1.8,indlabheight=0.08,indlabspacer=1,barbordercolour="black",divsize = 0.1,grplabsize=0.5,barbordersize=0,linesize=0.4,showsp = F,splabsize = 4,outputfilename="plotq",imgtype="png",exportpath=getwd(),splab = c("K=2","K=3","K=4","K=5"),divcol = "black",splabcol="black",grplabheight=5,grplabjust = 0.1, grplabangle = 45)


#Policy
metadata <- read_xls("~/K2_meta.xls")
both <- as.data.frame(metadata[,c(3,17)])
one <- as.data.frame(metadata[,17])
plotQ(qlist = readQ("~/LEPC/K2.Q"),returnplot=T,exportplot=T,clustercol=c("orange","black","darkorchid1","grey"),grplab=one,ordergrp=T,showlegend=F,height=1,indlabsize=1.8,indlabheight=0.08,indlabspacer=1,barbordercolour="black",divsize = 0.1,grplabsize=3,barbordersize=0,linesize=0.4,showsp = F,splabsize = 0,outputfilename="plotq",imgtype="png",exportpath=getwd(),splab = "K=2",divcol = "black",splabcol="black",grplabheight=1)
