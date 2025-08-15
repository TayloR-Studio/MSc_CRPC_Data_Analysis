#!/bin/sh
#SBATCH --job-name=fastp_default
#SBATCH --account=*****
#SBATCH --cpus-per-task=20
#SBATCH --time=01:18:00

#Estimated time = 15 minutes per sample per cpus, 90 files = 22:30:00, 20 cpus = 01:07:30

#Load in bioconda & conda enviroment
module load bioconda
conda activate fastqc_enviro

#Set all the filepaths to variables
file_loca="/storage/tjadams/dissertation/fastq_files/"
process_loca="/storage/tjadams/dissertation/fastp_outputs_1/"
default="/storage/tjadams/dissertation/scripts/"

#Study names for looping through
study=("GSE197609" "GSE80609")

#Sets current directory to the location of the fastq files to be cleaned up
cd "$file_loca"

#For each of the studies
for direct in "${study[@]}"
 do
  #Change directory to that of the study being worked on at the time
  cd ${direct}
  #For each read-1 file
  for file in *_1.fastq.gz
   do
    #Print the name of the read-1 file being cleaned
    echo ${file}
    #Print the time in order to help track how long cleaning each sample is taking to aid with setting the time
    echo $(date "+%T")
    #Set the output name to the sample name by stripping the file name down to just (SRR... without the _1...)
    outputname=`basename "${file}" _1.fastq.gz`
    #Set the directory to save to, to the base outputs directory, then the directory for that study
    save_direct="$process_loca""$direct"/
    #Run the fastp itself, on default settings, on both reads at the same time
    fastp -w $SLURM_CPUS_PER_TASK -i ${outputname}_1.fastq.gz -I ${outputname}_2.fastq.gz -o "$save_direct"${outputname}_R1_process1.fastq.gz -O "$save_direct"${outputname}_R2_process1.fastq.gz
   done
  #Go back a directory so the next loop can go into the directory for the other study
  cd ..
 done

#Print to the slurm output to confirm the script didn't terminate due to running out of time or another error
echo "FASTP job complete"
