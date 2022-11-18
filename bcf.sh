
#assuming bcftools roh output file is called "ROH_LEPC_PLraw.txt, extract read groups:
awk '$1=="RG"' ROH_LEPC_PLraw.txt > ROH_RG_all.txt

#FOR INDIVIDUAL ROH
#Now extract each samples row data and export to a seperate file
for i in `cat sample.list`; do  grep $i ROH_RG_all.txt  > $i.ROH.txt ; done

#Parse each output file
for i in `ls -1 *ROH.txt`; do python ROHparser.py $i > ${i}_results.txt ; done
#Extract the fROH 100-1mb
cat *_results.txt | grep "F(ROH)" | cut -d " " -f 4| cut -f 1 > 100kb
#Extract the fROH >1MB
cat *_results.txt | grep "F(ROH)" | cut -d " " -f 7| cut -f 1 > 1MB
#Get sample order
ls -1 *results.txt | cut -d "_" -f 1 > samps
#create file for figure
paste samps 100kb 1MB > ind_roh.txt




