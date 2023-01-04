
#combine sites extracted from first column of beagle file (no..filter) and boegn from angsd (0,1; all_4_scan.sites)
paste all_4_scan.sites no.filter > sites.to.parse

#Only extract rows that were kept
awk '$1=="1"' sites.to.parse | cut -f 2 > SITES

ml bioinfo 
ml R

 qqchi<-function(x,...){
lambda<-round(median(x)/qchisq(0.5,1),2)
  qqplot(qchisq((1:length(x)-0.5)/(length(x)),1),x,ylab="Observed",xlab="Expected",...);abline(0,1,col=2,lwd=2)
legend("topleft",paste("lambda=",lambda))
}

library(RcppCNPy)
s<-npyLoad("all_4_scan.selection.npy")
p<-read.table("SITES")
qqchi(s)
pval<-1-pchisq(s,1)
selection_df<-cbind(p,pval)
write.csv(selection_df,"selection.csv")
 
 cut -f 2 selection.tsv | sed 's/NW_/NW./g' |  tr "_" "\t" |  sed 's/NW.//g'  |cut -f 1 > CHROM
cut -f 2 selection.tsv | sed 's/NW_/NW./g' |  tr "_" "\t" |  sed 's/NW.//g'  |cut -f 2 | sed 1d  > base
echo "BP" > bp
 cat bp base > BP
 paste selection.tsv BP CHROM > z.tsv
 
PC1<-z[ , c("V1", "X1","BP","V1.1")]
names(PC1)<-c("SNP", "P","CHR","BP")
ggplot(PC1,aes(x=SNP,y=-log10(P)))+geom_scattermore()+theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())+ggtitle("PC1")



PC2<-z[ , c("V1", "X2","BP","V1.1")]
names(PC2)<-c("SNP", "P","CHR","BP")
ggplot(PC2,aes(x=SNP,y=-log10(P)))+geom_scattermore()+theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())+ggtitle("PC2")

PC3<-z[ , c("V1", "X3","BP","V1.1")]
names(PC3)<-c("SNP", "P","CHR","BP")
ggplot(PC3,aes(x=SNP,y=-log10(P)))+geom_scattermore()+theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())+ggtitle("PC3")

PC4<-z[ , c("V1", "X4","BP","V1.1")]
names(PC4)<-c("SNP", "P","CHR","BP")
ggplot(PC4,aes(x=SNP,y=-log10(P)))+geom_scattermore()+theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())+ggtitle("PC4")

PC5<-z[ , c("V1", "X4","BP","V1.1")]
names(PC5)<-c("SNP", "P","CHR","BP")
ggplot(PC5,aes(x=SNP,y=-log10(P)))+geom_scattermore()+theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())+ggtitle("PC5")













library(qqman)
 manhattan(exon, chr="CHR", bp="BP", snp="SNP", p="P" ,ylim=c(0,12),suggestiveline = FALSE)
 
summary(-log10(selection$X1))
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.0000  0.1369  0.3280  0.4398  0.6285  5.7217 

 
 
 qqchi<-function(x,...){
lambda<-round(median(x)/qchisq(0.5,1),2)
  qqplot(qchisq((1:length(x)-0.5)/(length(x)),1),x,ylab="Observed",xlab="Expected",...);abline(0,1,col=2,lwd=2)
legend("topleft",paste("lambda=",lambda))
}

 library(RcppCNPy)
 s<-npyLoad("finalc.selection.npy")
 qqchi(s)
pval<-1-pchisq(s,1)

 p<-read.table("all.sites")
 names(p)<-"chr:pos"

all_df<-cbind(p,s,pval)
write.csv(all_df,"all.csv")

all <- read.csv("~/all.csv")

summary(-log10(all$P))
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
0.0000001 0.2217236 0.3847085 0.4602765 0.6143869 1.4622363 


#!/bin/sh -l
#SBATCH -A fnrdewoody
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 1-00:00:00
#SBATCH --job-name=angsd_pca
#SBATCH -e %x_%j.err
#SBATCH -o %x_%j.out
#SBATCH --mem=100GB


module load biocontainers
module load pcangsd


#Run PCA
pcangsd -b FINALC.beagle.gz -o finalc --threads 64 --pcadapt --inbreedSamples --selection








####################
# Run pcadapt scan #
####################
#
#	args[1]: zscores matrix
#	args[2]: prefix for output files
#

args = commandArgs(trailingOnly=TRUE)

library(RcppCNPy)
library(bigutilsr)

zscores <- npyLoad(args[1])
K <- ncol(zscores)

# For one component only
if (K == 1) {
	d2 <- (zscores - median(zscores))^2
} else {
	d2 <- dist_ogk(zscores)
}

write.table(d2, file=paste0(args[2], ".pcadapt.test.txt"), quote=F, row.names=F, col.names=F)
write.table(pchisq(d2, df=K, lower.tail=F), file=paste0(args[2], ".pcadapt.pval.txt"), quote=F, row.names=F, col.names=F)
#########################
Rscript adapt.R finalc.pcadapt.zscores.npy pupfish_all

#Reformat for plotting:
CHR	BP	SNP	P
NW_024037781.1	644492	NW_024037781.1-644492	1.22E-08
NW_024037781.1	659810	NW_024037781.1-659810	1.63E-18
NW_024037781.1	894303	NW_024037781.1-894303	2.82E-18
NW_024037781.1	977739	NW_024037781.1-977739	2.95E-10
NW_024037781.1	984682	NW_024037781.1-984682	6.86E-09
NW_024037781.1	986463	NW_024037781.1-986463	9.89E-14
..........

