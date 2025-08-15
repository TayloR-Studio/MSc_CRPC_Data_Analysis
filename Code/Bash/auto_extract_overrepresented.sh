#!/bin/bash
#SBATCH --job-name=overrepresented
#SBATCH --account=*****
#SBATCH --ntasks=1
#SBATCH --time=00:30:00

#Sets the location for the fastqc files and where to put the output list of contaminants
fastqc_dir="/storage/tjadams/dissertation/fastqc_raw"
output_fasta="/storage/tjadams/dissertation/fastp_custom/contaminants_from_html.fasta"

#Sets the two studies to be looped through
study=("GSE197609" "GSE80609")

> "$output_fasta"

#For each of the studies
for direct in "${study[@]}"
 do
  #For each of the fastqc.html files
  for file in "$fastqc_dir/$direct"/*_fastqc.html
   do
    #Strips the file name down to just the sample name
    sample=$(basename "$file" _fastqc.html)
    #Extract lines between "Overrepresented sequences" table and puts them into the output file along with a header line indicating what sample its from
    awk "/Overrepresented sequences/,/<\/table>/" "$file" \
    | grep -Eo '>[ACGTN]+' \
    | sed 's/>//' \
    | awk -v sample="$sample" '{
        print ">"sample"_seq"NR"\n"$0
    }' >> "$output_fasta"
   done
 done
