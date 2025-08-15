# MSc_CRPC_Data_Analysis
Bash and R markdown code that was used to carry out the data analysis for my MSc on identifying transcriptomic biomarkers for Castration Resistant Prostate Cancer in comparison to treatment sensitive prostate cancer

## Programs
The code in the R folder can be run on R Studio, all required packages are loaded from the library in the first chunk and there is a script specifically for loading all the packages into the project at the start
Bash scripts were designed for a HPC and any required packages were loaded in via bioconda and a conda enviroment at the start of each script
Python scripts can be run on the HPC using the Bash scripts of the same name

## Usage
The workflow is as follows:

	RNASeq pre-processing													Microarray pre-processing
		|															    |
		|															    |
		|															    |
    ena-file-download-GSE80609													Microarray_Data_Processing
    ena-file-download-GSE197609														    |
		|															    |
		|															    |
		|															    |
	   raw_fastqc _____________________________________________________________________ auto_extract_overrepresented		    |
		|											|				    |
		|											|				    |
		|											|				    |
	  fastp_loop_1											|				    |
		|											|				    |
		|										contaminants_unique			    |
		|											|				    |
	process_fastqc_1 ______ multiqc_process_1							|				    |
		|											|				    |
		|											|				    |
		|											|				    |
	  fastp_loop_2_GSE80609 ________ process_fastqc_2 ________ multiqc_process_2 __________ combining_contaminants			    |
	  fastp_loop_2_GSE197609													    |
		|															    |
		|															    |
		|															    |
		|	      generate_ref_genome											    |
		|			|												    |			
	    align_seq __________________|												    |
		|															    |
		|															    |
		|															    |
	feature_counts_GSE80609 __________________________________________ Meta_analysis_with_RNASeq _______________________________________|
	feature_counts_GSE197609													    |
																	    |
																	    |
																     Meta_analysis

## Directory structure

Dissertation
	|
	|___ fastp_custom
	|
	|___ fastp_outputs_1
	|	|
	|	|___ GSE80609
	|	|
	|	|___ GSE197609
	|
	|___ fastp_outputs_2
	|	|
	|	|___ GSE80609
	|	|
	|	|___ GSE197609
	|
	|___ fastq_files
	|	|
	|	|___ GSE80609
	|	|
	|	|___ GSE197609
	|
	|___ feat_counts
	|	|
	|	|___ GSE80609
	|	|
	|	|___ GSE197609
	|
	|___ multi_qc_report
	|	|
	|	|___ process_1
	|	|
	|	|___ process_2 
	|	|
	|	|___ raw_fastqc
	|
	|___ ref_annos
	|
	|___ ref_genomes
	|
	|___ scripts
	|
	|___ STAR_aligned
	|	|
	|	|___ GSE80609
	|	|
	|	|___ GSE197609
	|
	|___ STAR_genomes
		|
		|___ GRCh37
		|
		|___ GRCh38

















