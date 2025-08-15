#!/bin/sh
#SBATCH --job-name=multiqc
#SBATCH --account=*****
#SBATCH --ntasks=1
#SBATCH --time=01:00:00

#Estimated time = unknown

#Load in bioconda & the conda enviroment
module load bioconda
conda activate fastqc_enviro

#Set file location to a variable
file_loca="/storage/tjadams/dissertation/fastqc_process_1/"

#The two studies to loop through
study=("GSE197609" "GSE80609")

#Sets the current directory to where the fastqc files are
cd "$file_loca"

#For each study
for direct in "${study[@]}"
 do
  #Set the working directory to be for the study currently being worked on
  cd ${direct}
  #Runs the multiqc itself and saves the result to the correct multiqc file
  multiqc . -o ../../multiqc_report/process_1/$direct
  #Steps back a directory so the loop can go into the one for the other study
  cd ..
 done

#Prints to the slurm output to confirm that the script didn't terminate early due to running out of time or another error
echo "MultiQC job done"


