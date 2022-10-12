# ExtremeBiome
PI: Dr. Jeffrey Robinson<br>
UMBC Translational Life Science Technology BS program, College of Natural and Mathematical Sciences


## 0. System Configuration
1. 'heartily-major-mayfly' (Ubuntu 22.04 LTS). m3.large, 16 CPU cores, 60 Gb RAM, 60 GB root disk.
2. Update system, install curl and dependencies. 

https://docs.anaconda.com/anaconda/install/linux/
``` 
root
sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 l
ibxtst6

sudo apt update

sudo apt install curl -y
```
3. Install Anaconda. 

https://linuxhint.com/install-anaconda-ubuntu-22-04/
```
cd /tmp
curl --output anaconda.sh https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh
sha256sum anaconda.sh
bash anaconda.sh
## Accept license
```
```
##Activate environment settings
source ~/.bashrc
conda list
conda --version
```
4. Install Bioconda. 

https://github.com/bioconda/bioconda-utils.

https://anaconda.org/bioconda/bioconda-utils/. 

```
curl --output anaconda.sh https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh
source /home/exouser/anaconda3/etc/profile.d/conda.sh
conda install -c bioconda bioconda-utils
conda list
conda --version
```
5. Install and validate SRA-toolkit.

https://github.com/ncbi/sra-tools/wiki/02.-Installing-SRA-Toolkit

https://github.com/ncbi/sra-tools/wiki/03.-Quick-Toolkit-Configuration. 


```
wget --output-document sratoolkit.tar.gz https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz
tar -vxzf sratoolkit.tar.gz
export PATH=$PATH:$PWD/sratoolkit.3.0.0-ubuntu64/bin
sudo apt install sra-toolkit
which fastq-dump
fastq-dump --stdout -X 2 SRR390728
```

6. Install E-Utilities

https://www.ncbi.nlm.nih.gov/books/NBK179288/
```
sh -c "$(curl -fsSL ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh)"
export PATH=${PATH}:${HOME}/edirect
```

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
