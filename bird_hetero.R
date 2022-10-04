library(ggplot2)
bird_het <- read_excel("Library/CloudStorage/Box-Box/Personal/Postdoc_Purdue/LEPC/analysis/bird_het.xlsx")
ggplot(bird_het,aes(x=reorder(`Organism Name`,Corrected_HET),y=Corrected_HET)) + 
    geom_bar(stat='identity') + 
    coord_flip() + labs(y='Heterozygosity',x='')+theme_classic()

OR:

ggplot(bird_het,aes(x=reorder(`Organism Name`,Corrected_HET),y=Corrected_HET)) + 
+     geom_segment(aes(xend=`Organism Name`,yend=0)) + geom_point()+ labs(y='Heterozygosity',x='')+theme_classic()+coord_flip()
    
