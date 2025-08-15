#!/bin/sh
#SBATCH --job-name=feat.counts
#SBATCH --account=*****
#SBATCH --ntasks=1
#SBATCH --time=01:00:00

#Estimated time = unknown

#Load bioconda and the conda enviroment
module load bioconda
conda activate fastqc_enviro

#Change directory to the base dissertation one so as to easier access the other directories
cd /storage/tjadams/dissertation

#Sets the study and genome directories
#This script was originally written to run both studies until it was established they needed different alignment conditions
study=("GSE80609")
genomes=("GRCh37")

#Sets the directories to be variables
aligned="STAR_aligned"
gtf="ref_annos"
output="feat_counts"

#Creates an empty list to write the BAM files into
BAM_files=""

#For each alignment file
for folder in "$aligned/$study"/SRR*
 do
  #Strip the file path down to just the sample name (SRR...)
  sample=$(basename "${folder}")
  #Sets the expected name for the BAM file
  BAM="$aligned/$study/${sample}/${sample}"_Aligned.sortedByCoord.out.bam
  #If the BAM file can be found
  if [[ -f "$BAM" ]]
   then
    #Add the BAM file to the BAM files list
    BAM_files+="$BAM "
  #If the BAM file cannot be found
  else
   #Print the warning to the slurm output
   echo "WARNING: BAM file not found for $folder"
  fi
 done

#Run the actual alignment with -s = 0
featureCounts -a "$gtf/${genomes}_anno.gtf" -o "$output/$study/gene_counts.txt" -g gene_id -t exon -p -s 0 -M $BAM_files
