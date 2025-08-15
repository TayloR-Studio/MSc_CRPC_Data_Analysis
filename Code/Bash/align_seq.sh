#!/bin/sh
#SBATCH --job-name=align_seq
#SBATCH --account=*****
#SBATCH --cpus-per-task=20
#SBATCH --time=03:00:00
#SBATCH --mem=64G

#Estimated time = 1hr per sample per cpus = 45:00:00 = 2:25:00 on 20 cpus

#Load in bioconda & conda enviroment
module load bioconda
conda activate fastqc_enviro

#Change location to dissertation base folder to easier access the other folders
cd ../

#Sets the other folders to variable names
genome_dir="STAR_genomes"
input_dir="fastp_outputs_2"
outdir_base="STAR_aligned"

#Sets up the two studies with their two genome assemblies in the correct order to loop through
study=("GSE197609" "GSE80609")
genomes=("GRCh38" "GRCh37")

#Sets up the loop through the two studies/genome assemblies
for i in {0..1}
 do
  #For each read-1 in the final fasta directory, in each of the study folders
  for read1 in "$input_dir/${study[i]}"/*_R1_process2.fastq.gz
   do
    #Strip the filepath to the read-1 file down to just the sample name (SRR... without the R1...)
    sample=$(basename "$read1" _R1_process2.fastq.gz)
    #Use this to create the read-2 filepath
    read2="${input_dir}/${study[i]}/${sample}_R2_process2.fastq.gz"

    #If read-2 cannot be found then print this to the slurm output
    if [[ ! -f "$read2" ]]
     then
      echo "skipping $sample: $read2 not found."
      continue
    fi

    #Sets the output directory to be in the base output directory, then the study directory, then the sample directory
    outdir="${outdir_base}/${study[i]}/${sample}"
    #Creates the file if needed
    mkdir -p "$outdir"

    #Prints the sample being processes to the slurm output
    echo "Processing sample: $sample"

    #Runs the alignment using the correct genome assembly, reads 1 & 2, putting it in the output directory set earlier with standard parameters and the CPUs set at the start of the script
    STAR --runThreadN $SLURM_CPUS_PER_TASK --genomeDir "$genome_dir/${genomes[i]}" --readFilesIn "$read1" "$read2" --readFilesCommand zcat --outFileNamePrefix "${outdir}/${sample}_" --outSAMtype BAM SortedByCoordinate --quantMode TranscriptomeSAM --limitBAMsortRAM 28000000000

    #Prints that the alignment is complete and where it was saved to the slurm output
    echo "STAR alignment complete for $sample"
    echo "Output BAM: ${outdir}/${study[i]}/$sample}_Aligned.sortedByCoord.out.bam"
    echo "Transcriptome BAM: ${outdir}/${study[i]}/${sample}_Aligned.toTranscriptome.out.bam"
    echo "--------------------------------------------------------------------------"
   done
  done

#Prints that all samples have been processed to the slurm output to confirm it didn't finish early due to running out of time or another error
echo "All samples processed"

