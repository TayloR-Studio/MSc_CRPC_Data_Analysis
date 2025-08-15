#!/bin/bash
#SBATCH --job-name=combining
#SBATCH --account=*****
#SBATCH --ntasks=1
#SBATCH --time=00:30:00

#estimated time = unknown

#Load in bioconda & conda enviroment
module load bioconda
conda activate fastqc_enviro

#Change directory to where the two files and pytho script are
cd ../fastp_custom

#Using python, run the combining contaminants python script
python3 combining_contaminants.py

#Print to the slurm output to confirm that the script didn't terminate early due to running out of time or another error
echo "combining complete"
