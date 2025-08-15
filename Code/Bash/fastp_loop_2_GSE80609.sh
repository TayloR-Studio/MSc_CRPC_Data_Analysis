#!/bin/sh
#SBATCH --job-name=fastp_trial2
#SBATCH --account=*****
#SBATCH --cpus-per-task=25
#SBATCH --time=37:30:00

#Estimated time = 11 hours per file per cpus, 74 files = 814:00:00, 25 cpus = 32:30:00

#Load bioconda and the conda enviroment
module load bioconda
conda activate fastqc_enviro

#Sets the file paths to variables
file_loca="/storage/tjadams/dissertation/fastq_files/"
process_loca="/storage/tjadams/dissertation/fastp_outputs_2/"
default="/storage/tjadams/dissertation/scripts/"
adapters="/storage/tjadams/dissertation/fastp_custom/"

#Sets the one study being run to a variable
#While this script is for just one study rather than two, the script was kept largely the same to avoid changing something that stops it from working, and in case it needed to be adapted for more studies in the future
study=("GSE80609")

#Changes current directory to where the fastq files are
cd "$file_loca"

#For each study (of one here)
for direct in "${study[@]}"
 do
  #Change directory to the one for this study
  cd ${direct}
  #For each read-1 file
  for file in *_1.fastq.gz
   do
    #Print the read-1 file for the sample being worked on to the slurm output
    echo ${file}
    #Print the time each samples starts being worked on to aid with setting the SBATCH time
    echo $(date "+%T")
    #Set the output name to the sample name by stripping the file name (SRR.. without the _1...)
    outputname=`basename ${file} _1.fastq.gz`
    #Set the save directory to the base save directory, then the directory for the study
    save_direct="$process_loca""$direct"/
    #Runs the fastp itself, stripping the first 10 bases, removing the overrepresented sequences and setting the per base minimum quality to 25, all as indicated by previous fastqc outputs
    fastp -w $SLURM_CPUS_PER_TASK -i ${outputname}_1.fastq.gz -I ${outputname}_2.fastq.gz -f 10 -F 10 --adapter_fasta "$adapters"Sequencing_adaptors.fasta -r -M 25 -o "$save_direct"${outputname}_R1_process2.fastq.gz -O "$save_direct"${outputname}_R2_process2.fastq.gz
   done
  #Step back a directory as was done in the other files just in case this script needs expanding out to more than one study in the future
  cd ..
 done

#Print to the slurm output to confirm the script didn't terminate early due to running out of time or another error
echo "FASTP job complete"
