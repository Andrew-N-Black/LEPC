library(readxl)
library(ggplot2)
bird_het <- read_excel("bird_het.xlsx")
ggplot(bird_het,aes(x=reorder(`Organism Name`,Corrected_HET),y=Corrected_HET)) + 
    geom_bar(stat='identity') + 
    coord_flip() + labs(y='Heterozygosity',x='')+theme_classic()

#OR:

ggplot(bird_het,aes(x=reorder(CommonName,Corrected_HET),y=Corrected_HET)) +  geom_segment(aes(xend=CommonName,yend=0)) + geom_point(size=6)+ labs(y='Heterozygosity',x='')+theme_classic()+coord_flip()
ggsave("bird_het.svg")

