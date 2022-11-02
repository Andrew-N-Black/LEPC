#!/bin/bash
#SBATCH -A fnrchook
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 1-00:00:00
#SBATCH --error=align.err
#SBATCH --output=align.out
#SBATCH --job-name=produce_regions_SLURMM_jobs


mkdir jobs_pca
while read -a line
do 
	echo "#!/bin/sh -l
#SBATCH -A fnrchook
#SBATCH -n 10
#SBATCH -t 10-00:00:00
#SBATCH --job-name=LEPC_${line[0]}_pca
#SBATCH --error=LEPC_${line[0]}_pca.e
#SBATCH --output=LEPC_${line[0]}_pca.o
#SBATCH --mem=20G
module load biocontainers
module load angsd
module load pcangsd

#Move to bam folder
cd /scratch/bell/blackan/LEPC/shotgun/angsd_out_serial
mkdir pca
angsd -GL 1 -out pca/${line[0]} -r ${line[0]} -minQ 30 -P 10 \
-minInd 350 -baq 2 -doGlf 2 -doMajorMinor 1 -doMaf 1  -SNP_pval 1e-6 -bam bamlist_nodup.txt \
-ref /scratch/bell/blackan/LEPC/assembly/next/01_rundir/filtered/purged_scaf_trim_blob.fa "  > ./jobs_pca/LEPC_${line[0]}_pca.sh
done < ./regions.txt
#pcangsd -b  /scratch/bell/blackan/LEPC/shotgun/angsd_out_redo/LEPC.beagle.gz --selection --minMaf 0.01 --sites_save --tree -o  /scratch/bell/blackan/LEPC/shotgun/angsd_out_redo/LEPC --threads 100 --pcadapt

#for i in `ls -1 *sh`; do  echo "sbatch $i" ; done > jobs ; source ./jobs
