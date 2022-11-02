#!/bin/bash
#SBATCH -A fnrchook
#SBATCH -n 128
#SBATCH -t 10-00:00:00
#SBATCH --job-name=LEPC_relate
#SBATCH --error=LEPC_relate.e
#SBATCH --output=LEPC_relate.o
#SBATCH --mem=200G
module load biocontainers
module load angsd

#Move to bam folder
cd /scratch/bell/blackan/LEPC/shotgun/angsd_out_serial
mkdir relate_top6
angsd -GL 1 -out relate_top6/LEPC -rf top6.txt -minQ 30 -doGlf 3 -P 128 \
-ref /scratch/bell/blackan/LEPC/assembly/next/01_rundir/filtered/purged_scaf_trim_blob.fa \
-doMajorMinor 1 -doMaf 1 -SNP_pval 1e-6  -minmaf 0.01 -bam bamlist.txt 

#Top six longest scaffolds used as regions due to time constraints
#cat top6.txt
#scaffold1:
#scaffold3:
#scaffold5:
#scaffold8:
#scaffold2:
#scaffold4:
