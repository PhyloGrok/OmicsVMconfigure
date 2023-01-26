# ExtremeBiome
PI: Dr. Jeffrey Robinson<br>
UMBC Translational Life Science Technology BS program, College of Natural and Mathematical Sciences


## [System Configuration](/SysConfig/ConfigureSystem.md)
1. (Ubuntu 20 LTS)*** (GNU/Linux 5.15.0-50-generic x86_64). m3.large, 16 CPU cores, 60 Gb RAM, 60 GB root disk.
   *** Ubuntu 22 has an error with EDirect, "curl command failed" that appears due to missing or incompatible library libssl1.1
2. Update system, install curl and dependencies, install Anaconda, install Bioconda. 
3. Install R and ShinyR, Shiny Server.
4. Install sra-toolkit, install Edirect, install datasets
5. Install fastqc, trimmomatic, bwa, bamtools, vcfutils, samtools
6. Update Python3 and install Mothur package
```
sudo apt-get install software-properties-common
pip install mothur-py seq-experiment
```
7. Install Mothur package
```
wget https://github.com/mothur/mothur/releases/download/v1.48.0/Mothur.Ubuntu_20.zip
unzip Mothur.Ubuntu_20_zip
```


## I. Workflow 1: Aggregate Assembly of NCBI SRA read data
Download raw SRA read data, QC, assembly, and SNP variant calling. 

### A. Data Retrieval with <em>SRA-tools</em> and <em>E-Utils</em> <br>

NCBI E-Utils/EDirect usage. https://www.ncbi.nlm.nih.gov/books/NBK179288/ 

NCBI SRA-tools usage. https://github.com/ncbi/sra-tools/wiki/08.-prefetch-and-fasterq-dump

NCBI Datasets (beta) installation. https://www.ncbi.nlm.nih.gov/datasets/docs/v2/download-and-install/

NCBI Datasets download usage. https://www.ncbi.nlm.nih.gov/datasets/docs/v1/reference-docs/command-line/datasets/download/

1. [SRAquery.txt](SRA_runtable/SRAquery.txt). Query string for SRA-tools data retrieval, outputs a list ([SraAccList.txt](SRA_runtable/SraAccList.txt)) of SRA accession uids for Halobacterium genomic DNA .fastq files. <br>
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

This work used Jetstream2 at Indiana University (IU) through research allocation BIO220099 from the Advanced Cyberinfrastructure Coordination Ecosystem: Services & Support (ACCESS) program, which is supported by National Science Foundation grants #2138259, #2138286, #2138307, #2137603, and #2138296.

This work used Jetstream at Indiana Universery/Texas Advanced Computing Center (IU/TACC) through research startup allocation BIO210100 from the Extreme Science and Engineering Discovery Environment (XSEDE), which was supported by National Science Foundation grant number #1548562.

This work used Jetstream at Indiana Universery/Texas Advanced Computing Center (IU/TACC) through educational allocation MCB200044 from the Extreme Science and Engineering Discovery Environment (XSEDE), which was supported by National Science Foundation grant number #1548562.

## Citations
Campen_Brine_2018. https://github.com/MikuckiLab/Campen_Brine_2018. 

bacterial-genomics-tutorial. https://github.com/vappiah/bacterial-genomics-tutorial. 

David Y. Hancock, Jeremy Fischer, John Michael Lowe, Winona Snapp-Childs, Marlon Pierce, Suresh Marru, J. Eric Coulter, Matthew Vaughn, Brian Beck, Nirav Merchant, Edwin Skidmore, and Gwen Jacobs. 2021. “Jetstream2: Accelerating cloud computing via Jetstream.” In Practice and Experience in Advanced Research Computing (PEARC ’21). Association for Computing Machinery, New York, NY, USA, Article 11, 1–8. DOI: https://doi.org/10.1145/3437359.3465565

Stewart, C.A., Cockerill, T.M., Foster, I., Hancock, D., Merchant, N., Skidmore, E., Stanzione, D., Taylor, J., Tuecke, S., Turner, G., Vaughn, M., and Gaffney, N.I., “Jetstream: a self-provisioned, scalable science and engineering cloud environment.” 2015, In Proceedings of the 2015 XSEDE Conference: Scientific Advancements Enabled by Enhanced Cyberinfrastructure. St. Louis, Missouri. ACM: 2792774. p. 1-8. DOI: https://dx.doi.org/10.1145/2792745.2792774

Towns, J, and T Cockerill, M Dahan, I Foster, K Gaither, A Grimshaw, V Hazlewood, S Lathrop, D Lifka, GD Peterson, R Roskies, JR Scott. “XSEDE: Accelerating Scientific Discovery”, Computing in Science & Engineering, vol.16, no. 5, pp. 62-74, Sept.-Oct. 2014, doi:10.1109/MCSE.2014.80
