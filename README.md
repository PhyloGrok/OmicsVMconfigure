# HaloOmics
PI: Dr. Jeffrey Robinson<br>
UMBC Translational Life Science Technology BS program, College of Natural and Mathematical Sciences


### Data Retrieval<br>
1. [SRAquery.txt](SRA_runtable/SRAquery.txt). Query string for SRA-tools data retrieval, outputs a list ([SRA_Acc_List.txt](SRA_runtable/SRA_Acc_List.txt)) of SRA accession uids for Halobacterium genomic DNA .fastq files. <br>
2. [SRAretrieve.sh](SRA_runtable/SRAretrieve.sh). Shell script runs prefetch and fasterq-dump from NCBI SRAtools API, using the input list "SRA_Acc_List.txt", retrieving all .fastq files. <br>
3. [SRARunTable.csv](SRA_runtable/SraRunTable.csv). Table of metadata for the retrieved SRA run dataset.<br>

### QC and Assembly<br>


## Introduction
Halophilic archaea of the genus <em>Halobacterium</em> serve as the main genetic model system for Class Halobacteria in a general sense, significant genome data is available to gain insight into the broader levels of genomic diversity within the Class.  The halophilic archaea are therefore key systems for astrobiology-oriented studies of microbial radiation resistance, DNA-damage repair pathways, hypersaline physiology and long-term survival, and poly-extremophilic genetic adaptation. The knowledge gained from these studies provide important insights for understanding the potential for life in Mars- and space-like environments.  

Our Co-PI for this project includes Dr. Linda Deveaux, with National Center for Genomic Resources (NGCR)(published, see citations), generated sample genome sequences which they provided as demonstration data for this application.  The Deveaux Lab data represents separate cultures from an artificial selection experiment in which parallel <em>Halobacterium</em> cultures were treated with high-dosage ionizing radiation over serial treatments, and the genome from each culture sequenced with PacBio.  Dr. Deveaux's genetics experiments have identified the conserved DNA-repair gene RPA as being upregulated in response to DNA damage; these experiments can further elucidate differential mutational profiles associated with the RPA pathway.

Collaborator Dr. Jill Mikucki is investigating extremophilc microbial communities in polar- and ice-associated hypersaline lakes.  Her lab has collected, isolated, and genome-sequenced microbes from the Blood Falls ecosystem in Antarctica, where brine discharges from permanently ice-covered, subsurface hypersaline ponds allow access to unique, extremophilic microbial communities.  These novel genomes are representative of the broader diversity of the halophilic archaea and bacteria, providing a context for phylogenetics applications for the demonstration dataset.

This collection of coded pipelines offers automated functions for microbial genome sequence data processing and analysis.  These include NCBI data retrieval, processing and QC, assembly and PacBio/Illumina hybrid assembly, gene annotation, SNP calling, whole genome sequence alignment, and genome viewer/browser output.  The modified Linux virtual machine will be provided as open source code, as 'Dockerized' VM image with automated output as an R-Shinyapp dashboard.   

## Methodology
### A. <em>Halobacterium salinarium</em> functional genomics meta-analysis
In this repository we present a set of automated bioinformatics workflows for comparative genomics and genome meta-analyses of Haloarchaeal genomics data.  In this application section, sample data is focused on the species <em>Halobacterium salinarium</em>, which has various published experimental genomics datasets and strain-level reference genomes, plus RNA-seq and ChIP-seq datasets accessible in automated manner via the NCBI E-Direct API.


 
### B. Meta-genomics, diversity and phylogenetics analysis for environmental isolates from hypersaline microbial habitats 

## Software Repositories and Computational Methods
UMAP for Data Integration - https://towardsdatascience.com/umap-for-data-integration-50b5cfa4cdcd

Circlize handbook - https://jokergoo.github.io/circlize_book/book/index.html




## Funding
NSF Extreme Science and Engineering Discovery Environment (XSEDE) has granted computational resources in a Research Startup award.
