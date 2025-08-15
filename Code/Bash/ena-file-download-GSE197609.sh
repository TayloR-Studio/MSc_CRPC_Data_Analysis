#!/bin/bash
#SBATCH --job-name=197609_download
#SBATCH --account=*****
#SBATCH --ntasks=1
#SBATCH --time=00:47:00

#Estimated time = 2:32 minutes per file, 16 files = 00:40:32

#Change directory to where the files should be saved
cd ../fastq_files/GSE197609

#Download code for each of the study files
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR181/025/SRR18170925/SRR18170925_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR181/026/SRR18170926/SRR18170926_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR181/028/SRR18170928/SRR18170928_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR181/029/SRR18170929/SRR18170929_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR181/027/SRR18170927/SRR18170927_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR181/029/SRR18170929/SRR18170929_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR181/031/SRR18170931/SRR18170931_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR181/027/SRR18170927/SRR18170927_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR181/024/SRR18170924/SRR18170924_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR181/031/SRR18170931/SRR18170931_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR181/025/SRR18170925/SRR18170925_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR181/030/SRR18170930/SRR18170930_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR181/028/SRR18170928/SRR18170928_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR181/030/SRR18170930/SRR18170930_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR181/026/SRR18170926/SRR18170926_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR181/024/SRR18170924/SRR18170924_1.fastq.gz

#Print to the slurm output to confirm the script didn't terminate early due to running out of time or another error
echo 'GSE197609 download complete'
