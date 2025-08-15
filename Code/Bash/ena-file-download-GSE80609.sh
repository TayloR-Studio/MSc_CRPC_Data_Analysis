#!/bin/bash
#SBATCH --job-name=80609_Download
#SBATCH --account=*****
#SBATCH --ntasks=1
#SBATCH --time=03:36:00

#Estimated time = 2:32 minutes per file, 74 files = 03:07:28

#Change directory to where the files should be saved
cd ../fastq_files/GSE80609

#Download code for each of the samples
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/005/SRR3437055/SRR3437055_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/007/SRR3437067/SRR3437067_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/005/SRR3437065/SRR3437065_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/002/SRR3437082/SRR3437082_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/006/SRR3437086/SRR3437086_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/002/SRR3437072/SRR3437072_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/004/SRR3437074/SRR3437074_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/004/SRR3437084/SRR3437084_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/007/SRR3437057/SRR3437057_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/009/SRR3437069/SRR3437069_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/008/SRR3437068/SRR3437068_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/003/SRR3437063/SRR3437063_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/001/SRR3437051/SRR3437051_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/000/SRR3437070/SRR3437070_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/005/SRR3437085/SRR3437085_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/000/SRR3437080/SRR3437080_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/003/SRR3437053/SRR3437053_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/007/SRR3437087/SRR3437087_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/001/SRR3437061/SRR3437061_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/008/SRR3437058/SRR3437058_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/005/SRR3437075/SRR3437075_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/002/SRR3437082/SRR3437082_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/003/SRR3437063/SRR3437063_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/005/SRR3437065/SRR3437065_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/007/SRR3437077/SRR3437077_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/000/SRR3437080/SRR3437080_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/007/SRR3437077/SRR3437077_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/004/SRR3437054/SRR3437054_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/001/SRR3437071/SRR3437071_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/001/SRR3437061/SRR3437061_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/003/SRR3437073/SRR3437073_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/009/SRR3437079/SRR3437079_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/002/SRR3437052/SRR3437052_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/006/SRR3437056/SRR3437056_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/003/SRR3437073/SRR3437073_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/006/SRR3437066/SRR3437066_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/004/SRR3437054/SRR3437054_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/001/SRR3437071/SRR3437071_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/005/SRR3437075/SRR3437075_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/003/SRR3437083/SRR3437083_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/007/SRR3437087/SRR3437087_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/008/SRR3437058/SRR3437058_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/006/SRR3437056/SRR3437056_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/008/SRR3437068/SRR3437068_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/005/SRR3437085/SRR3437085_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/009/SRR3437079/SRR3437079_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/006/SRR3437086/SRR3437086_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/007/SRR3437067/SRR3437067_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/009/SRR3437069/SRR3437069_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/002/SRR3437052/SRR3437052_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/004/SRR3437064/SRR3437064_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/001/SRR3437081/SRR3437081_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/004/SRR3437084/SRR3437084_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/000/SRR3437060/SRR3437060_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/002/SRR3437062/SRR3437062_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/004/SRR3437064/SRR3437064_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/003/SRR3437083/SRR3437083_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/007/SRR3437057/SRR3437057_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/006/SRR3437066/SRR3437066_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/002/SRR3437062/SRR3437062_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/004/SRR3437074/SRR3437074_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/008/SRR3437078/SRR3437078_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/009/SRR3437059/SRR3437059_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/001/SRR3437081/SRR3437081_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/006/SRR3437076/SRR3437076_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/000/SRR3437060/SRR3437060_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/009/SRR3437059/SRR3437059_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/006/SRR3437076/SRR3437076_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/008/SRR3437078/SRR3437078_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/002/SRR3437072/SRR3437072_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/000/SRR3437070/SRR3437070_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/005/SRR3437055/SRR3437055_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/001/SRR3437051/SRR3437051_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR343/003/SRR3437053/SRR3437053_1.fastq.gz

#Print to the slurm to confirm the script didn't terminate early due to running out of time or another error
echo 'GSE80609 download complete'
