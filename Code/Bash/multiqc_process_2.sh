#!/bin/sh
#SBATCH --job-name=multiqc
#SBATCH --account=*****
#SBATCH --ntasks=1
#SBATCH --time=01:00:00

#Estimated time = unknown

#Load bioconda and the conda enviroment
module load bioconda
conda activate fastqc_enviro

#Sets directory for the fastqc files to a variable
file_loca="/storage/tjadams/dissertation/fastqc_process_2/"

#The two variables to loop through
study=("GSE197609" "GSE80609")

#Sets current directory to where the fastqc files are
cd "$file_loca"

#For each study
for direct in "${study[@]}"
 do
  #Change current directory to the one for the current study
  cd ${direct}
  #Runs the multiqc itself, saving the output to the correct multiqc directory
  multiqc . -o ../../multiqc_report/process_2/$direct
  #Steps back a directory so the next loop can go into the directory for the other study
  cd ..
 done

#Print to the slurm output to confirm the script didn't terminate due to running out of time or another error
echo "MultiQC job done"


