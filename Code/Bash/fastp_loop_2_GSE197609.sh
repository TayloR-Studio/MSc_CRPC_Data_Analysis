#!/bin/sh
#SBATCH --job-name=fastp_trial2
#SBATCH --account=*****
#SBATCH --cpus-per-task=25
#SBATCH --time=46:00:00

#Estimated time = 11 hours per file per cpus, 16 files = 176:00:00, 25 cpus = 07:00:00

#Load bioconda & conda enviroment
module load bioconda
conda activate fastqc_enviro

#Set filepaths to variables
file_loca="/storage/tjadams/dissertation/fastq_files/"
process_loca="/storage/tjadams/dissertation/fastp_outputs_2/"
default="/storage/tjadams/dissertation/scripts/"
adapters="/storage/tjadams/dissertation/fastp_custom/"

#Sets the one study being run to a variable
#While this script is for just one study rather than two, the script was kept largely the same to avoid changing something that stops it from working, and in case it needed to be adapted for more studies in the future
study=("GSE197609")

#Set current directory to the location of the fastq files to clean
cd "$file_loca"

#For each study (of one here)
for direct in "${study[@]}"
 do
  #Change directory to the one for this study
  cd ${direct}
  #For each read-1 file
  for file in *_1.fastq.gz
   do
    #Print the sample being processed to the slurm output
    echo ${file}
    #Print the time the sample starts being processed to the slurm output to aid with setting the time
    echo $(date "+%T")
    #Set the output name to the sample name by stripping the file name down (SRR... without the _1...)
    outputname=`basename ${file} _1.fastq.gz`
    #Set the save directory to the base outputs directory, then the directory for that study
    save_direct="$process_loca""$direct"/
    #Run the fastp itself, on default settings, on both reads at the same time, stripping the first 10 bases off and removing the overrepresented sequences, as was established was needed from previous fastqc runs
    fastp -w $SLURM_CPUS_PER_TASK -i ${outputname}_1.fastq.gz -I ${outputname}_2.fastq.gz -f 10 -F 10 --adapter_fasta "$adapters"Sequencing_adaptors.fasta -M 25 -o "$save_direct"${outputname}_R1_process2.fastq.gz -O "$save_direct"${outputname}_R2_process2.fastq.gz
   done
  #Step back a directory as was done in the other files just in case this script needs expanding out to more than one study in the future
  cd ..
 done

#Print to the slurm output to confirm the script didn't terminate due to running out of time or another error
echo "FASTP job complete"
