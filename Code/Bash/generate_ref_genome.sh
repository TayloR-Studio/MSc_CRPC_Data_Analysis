#!/bin/sh
#SBATCH --job-name=gen_ref_genome
#SBATCH --account=*****
#SBATCH --cpus-per-task=7
#SBATCH --time=02:00:00
#SBATCH --mem=64G

#Estimated time = 3hrs 20 mins per sample per cpus = 6hrs 40 on one cpus = less than an hour on 7 cpus

#Load bioconda and the conda enviroment
module load bioconda
conda activate fastqc_enviro

#Change directories to the base dissertation one so the other directories can be easier accessed
cd /storage/tjadams/dissertation

#Sets the directories to variables
genome_fasta="ref_genomes/"
gtf_file="ref_annos/"
outdir="STAR_genomes/"

#The two genome assemblies to loop through
genomes=("GRCh37" "GRCh38")

#For each genome assessembly
for g in "${genomes[@]}"
 do
  #Do a STAR alignment
  STAR --runThreadN $SLURM_CPUS_PER_TASK --runMode genomeGenerate --genomeDir "${outdir}""$g" --genomeFastaFiles "${genome_fasta}""$g"_genome.fa --sjdbGTFfile "${gtf_file}""$g"_anno.gtf --sjdbOverhang 99
 done
