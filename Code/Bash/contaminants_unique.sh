#!/bin/bash
#SBATCH --job-name=unique
#SBATCH --account=*****
#SBATCH --cpus-per-task=1
#SBATCH --time=00:30:00

#estimated time = unknown

#Load in bioconda & conda enviroment
module load bioconda
conda activate fastqc_enviro

#Change directory to where the files are located
cd ../fastp_custom

#Using python, run the combining contaminants python script
python3 contaminants_unique.py

#Print to the slurm output to confirm that the script didn't terminate early due to running out of time or another error
echo "unique filtering done"
