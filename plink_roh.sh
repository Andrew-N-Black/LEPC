
plink-1.9 --ped SNPs_20x_auto.ped --map SNPs_20x_auto.map --allow-extra-chr --homozyg-snp 20 \
--homozyg-kb 1 --homozyg-window-het 1 --homozyg-window-snp 20 \
--homozyg-window-threshold 0.01 --out SNPs_20x_auto

# count number of ROHs, ROHs are in column 9
awk '{print $9}' SNPs_20x_auto.hom > ROH.txt

# remove header
tail -n+2 ROH.txt > roh.txt

# count number of ROHs
wc -l roh.txt > rohNumber.txt
rohNumber=$(awk '{print $1}' rohNumber.txt)

# estimate length of ROHs
rohLength=$(awk '{ sum += $1} END {printf "%.2f", sum }' roh.txt)

# number of SNPs in ROHs, SNPs are in column 10
awk '{print $10}' SNPs_20x_auto.hom > ROH_SNPs.txt

# remove header
tail -n+2 ROH_SNPs.txt > roh_snps.txt

# estimate number of ROHs
snpNumberROH=$(awk '{ sum += $1} END {printf "%.2f", sum }' roh_snps.txt)

# change name in *.hom files
# this is to make the file ready for R-plots
sed -i "s/sample1/$LINE/g" SNPs_20x_auto.hom

# make a new ROHs_species.txt before you run all species
# append 
cat SNPs_20x_auto.hom >> /scratch/snyder/a/abruenic/species_80_20x_20SNP.txt
