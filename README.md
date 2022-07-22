# ExtremoBiomics
PI: Dr. Jeffrey Robinson<br>
UMBC Translational Life Science Technology BS program, College of Natural and Mathematical Sciences


## I. Workflow 1: Aggregated Assembly of NCBI SRA read data
Download raw SRA read data, QC, assembly, and SNP variant calling.  The assembly and variant calling steps of this workflow was modified from the Data Carpentries Genomics Workshop: (https://datacarpentry.org/wrangling-genomics/). 

### A. Data Retrieval with <em>SRA-tools</em> and <em>E-Utils</em> <br>
1. [SRAquery.txt](SRA_runtable/SRAquery.txt). Query string for SRA-tools data retrieval, outputs a list ([SRA_Acc_List.txt](SRA_runtable/SRR_Acc_List.txt)) of SRA accession uids for Halobacterium genomic DNA .fastq files. <br>
2. [SRAretrieve.sh](SRA_runtable/SRAretrieve.sh). Shell script runs prefetch and fasterq-dump from NCBI SRAtools API, using the input list "SRA_Acc_List.txt", retrieving all .fastq files. <br>
3. [SRARunTable.csv](SRA_runtable/SraRunTable.csv). Table of sequence metadata (runtable) for the retrieved SRA dataset.<br>

### B. QC with <em>Trimmomatic</em> and <em>fastqc</em> <br>
1. [fastqc.sh](scripts/fastqc.sh). Runs fastqc on all .fastq files in the 'SRAdata' directory.
2. [postqc.sh](scripts/postqc.sh). Generates an output directory and moves all fastqc results to the directory.
3. [trimmomatic.sh](scripts/trimmomatic.sh). Runs adapter and quality trimming, re-runs fastqc on the results (for comparison) and store in a new directory.

### C. Assembly and Variant calling with <em>bwa</em>, <em>SAMtools</em>, <em>BAMtools</em>, and <em>VCFtools</em> 
1. [ref-genome.sh](scripts/ref-genome.sh). Retrieve and unzip the reference genome (bwa).
2. [bwa_assembly.sh](scripts/bwa_assembly.sh). Create output directories, Index and assemble selected reads against the reference genome and store .sam file output (bwa).
3. [SamToBam.sh](scripts/SamToBam.sh). Generate and sort a .bam file from .sam file input (SAMtools).
4. [VariantCall.sh](scripts/VariantCall.sh). Detect and filter SNPs (BAMtools, vcfutils)

## II. Workflow 2: Microbiome Analysis
1. Microbiome analysis here utilizes the functions of the <em>Mothur</em> package for microbiome analysis (https://github.com/mothur/mothurscripts), as implemented via Python3 executables: Campen_Brine_2018 repository (https://github.com/MikuckiLab/Campen_Brine_2018).  Data and analysis published in Campen et al. 2018. 
2. The scripts provide a complete workflow for 1. Downloading Silva rRNA library, 2. Sequence Processing, 3. Correlating Geochemistry, 4. Alpha diversity, 5. Core microbiome, 6. Biomarker identification. 

## Funding
NSF Extreme Science and Engineering Discovery Environment (XSEDE) has granted computational resources in a Research Startup award.

## Citations
Campen et al. (2018)
