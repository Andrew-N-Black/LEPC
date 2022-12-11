#Convert tped to ped and reformat for use in parentage:
plink --tfile scaffold32 --recode tab --allow-extra-chr --out TEST/scaffold.32
paste names genos > formated_input.txt

library(outliers)
source("./apparent.R")
InputFile <- read.table(file="./formated_input.txt",sep="\t",h=F)
apparentOUT <- apparent(InputFile, MaxIdent=0.10, alpha=0.01, nloci=17, self=TRUE, plot=TRUE, Dyad=FALSE)


