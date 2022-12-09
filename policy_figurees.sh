########Figure1#######################

#1A
metadata <- read.csv("/Users/andrew/Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis/metadata_filt.csv")
cov<-as.matrix(read.table("~/all_pca.cov"))
axes<-eigen(cov)
axes$values/sum(axes$values)*100
#[1] 3.72338077 1.06535360 0.97923585
PC1_3<-as.data.frame(axes$vectors[,1:3])
ggplot(data=PC1_3, aes(y=V2, x=V1,color=as.factor(metadata$DPS)))+geom_point(size=5,alpha=0.5)+ theme_classic() + xlab("PC1 (3.72%)") +ylab("PC2 (1.06%)")+scale_color_manual("DPS", values =c("Southern"="black","Northern"="orange"))+geom_hline(yintercept=0,linetype="dashed")+geom_vline(xintercept =0,linetype="dashed")+coord_flip()


#1C:
metadata <- read_xls("~/K2_meta.xls")
one <- as.data.frame(metadata[,3])#K-means inferred cluster
one <- as.data.frame(metadata[,17]) #Actual DPS grouping
both <- as.data.frame(metadata[,c(3,17)]) #both
plotQ(qlist = readQ("~/LEPC/K2.Q"),returnplot=T,exportplot=T,clustercol=c("black","brown","darkorchid1","grey"),grplab=one,ordergrp=T,showlegend=F,height=1,indlabsize=1.8,indlabheight=0.08,indlabspacer=1,barbordercolour="black",divsize = 0.1,grplabsize=3,barbordersize=0,linesize=0.4,showsp = F,splabsize = 0,outputfilename="plotq",imgtype="png",exportpath=getwd(),splab = "K=2",divcol = "black",splabcol="black",grplabheight=1)





#########Figure 2#####################
#For illustrating, excluding two outliers
HET_FILT <- read.csv("~/Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis/HET_FILT.csv")
ggplot(HET_FILT,aes(x=DPS,y=HET,fill=DPS))+geom_boxplot(show.legend =FALSE)+scale_fill_manual(title, values =c("Northern"="orange","Southern"="black"))+xlab("")+ylab("Individual Heterozygosity")+theme_classic()+ylim(c(0.0015,0.006))+coord_flip()




#For testing, including two outliers

HET_FILT_no_out$DPS <- ordered(HET_FILT_no_out$DPS,levels = c("Southern","Northern"))
pairwise.wilcox.test(HET_FILT_no_out$HET, HET_FILT_no_out$DPS, p.adjust.method = "BH")

	Pairwise comparisons using Wilcoxon rank sum test with continuity correction 

data:  HET_FILT_no_out$HET and HET_FILT_no_out$DPS 

         Southern
Northern <2e-16  

P value adjustment method: BH 
