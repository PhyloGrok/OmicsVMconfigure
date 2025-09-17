<p align="right">
  <img src="https://github.com/PhyloGrok/OmicsVMconfigure/blob/images/logo-merck.png" width="200" height="auto"> <br>
  <img src="https://github.com/PhyloGrok/OmicsVMconfigure/blob/images/Presentation1.png" width="200" height="auto"><br>
   <img src= "https://github.com/PhyloGrok/OmicsVMconfigure/blob/images/CNMS-logo-copy.png" width="200" height="auto"><br>
</p>

# OmicsVMconfigure

[![DOI](https://zenodo.org/badge/382447003.svg)](https://zenodo.org/badge/latestdoi/382447003)

```
⠀⢀⣀⠀⠀⠀⠀⠀⢀⣀⠀
⢠⣯⢬⣷⡀⠀⠀⣴⡯⢌⣧
⠸⣿⠀⠹⣷⠀⢸⡝⠀⢸⡿
⠀⠻⣧⣀⣿⣦⣼⡁⣠⣿⠃
⠀⢀⡾⠋⠀⠀⠀⠈⣙⣯⠀
⠀⣾⠀⠀⠀⠀⠀⠀⠀⠸⡆
⢰⡧⢄⢰⡆⠀⢰⡆⡠⢄⣧
⠀⠳⣼⣤⣤⣤⣤⣤⣧⠾⠁
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
```
<b>PI: Jeffrey Robinson, MS, PhD</b><br>
Research Intern (BTEC495, 2023): Nhi Luu, BS<br>
Research Intern (BTEC495, 2025): Elaysha Hall, BS<br>
Research Intern (BTEC495, 2025): Rachel Chan, BS<br>
UMBC, College of Natural and Mathematical Sciences, Translational Life Science Technology (TLST) BS program<br>

**This VM setup was partly adapted from Data Carpentries Genomics Workshop (Becker et al. 2023)<br>

Step-by-step to install and convigure a Linux environment for comparative genomics workflows. 

## Set up Ubuntu Linux VM for the VCFgenerator workflow
Built using a Linux Virtual Machine in the NSF Jetstream2 cloud environment.<br>
Operating system: Ubuntu 24.04.2 LTS<br>
Kernal: Linux 6.11.0-26-generic<br>
Architecture: x86-64<br>

## General environment: 
   
1. Ubuntu 24.04 VM, hosted on NSF Jetstream2 cloud environment.
2. Bioinformatics applications: fastqc, trimmomatic, bwa, samtools, bamtools, bcftools, snpEff
4. NCBI SRA-toolkit, NCBI Edirect, NCBI Datasets APIs.
5. R-Shiny, R-ShinyServer. (pending)
6. IGV-reports. (pending)

## Installations
Installations run from the /home/exouser/ directory of a Jetstream2 Linux VM.<br>

1. Update system.
```
sudo apt update
```
2. Install newest Anaconda version.
3. Use conda to install fastqc, trimmomatic, bwa, samtools, bamtools, snpeff
4. Install and validate NCBI Datasets
5. Install and validate NCBI SRA-toolkit
6. Install NCBI E-Utilities/EDirect API<br>

***NSF Jetstream2 "exouser" should add locations to users .bashrc files: "/home/exouser/anaconda3/bin", "/home/exouser/anaconda3/condabin", "/home/exouser/bcftools/", "/home/exouser/edirect/" and "/usr/local/bin/sratoolkit.3.0.7-ubuntu64/bin/".
```
export PATH=/home/exouser/anaconda3/bin:/home/exouser/anaconda3/condabin:/home/exouser/bcftools/:/home/exouser/htslib:$PATH
```

## 2. Install Anaconda Step-by-step. 
Official Anaconda installation page: https://docs.anaconda.com/anaconda/install/linux/

The most recent version of Linux-x86_64 (Anaconda3-2024.10-1-Linux-x86_64) is in use (https://repo.anaconda.com/archive/).

```
curl -O https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh
```
```
bash bash Anaconda3-2024.10-1-Linux-x86_64.sh 
```
- Accept license
- Press Enter to the default installation PREFIX=/home/exouser/anaconda3
- Type yes to "initialize Anaconda3"
- When complete, restart the login session, or cd home and activate environment settings
```
~/.bashrc
```
### Install NumPy library
```
conda install numpy
```
## Install Bioconda apps

Install fastqc
```
conda install bioconda::fastqc
```
Install trimmomatic
```
conda install bioconda::trimmomatic
```
Install bwa
```
conda install bioconda::bwa
```
Install samtools, bamtools, bcftools
```
conda install bioconda::samtools
```
OR try
```
sudo apt get samtools
```
```
conda install bioconda::bamtools
```
Install BCFtools, from github then compile.  Official BCFtools installation: https://samtools.github.io/bcftools/howtos/install.html

```
git clone --recurse-submodules https://github.com/samtools/htslib.git
git clone https://github.com/samtools/bcftools.git
cd bcftools
 # The following is optional:
 #   autoheader && autoconf && ./configure --enable-libgsl --enable-perl-filters
make
```

**conda bcftools is buggy and deprecated, prior it was recommended to set channel priorities, best installation is the GitHub repo.
```
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict
```

Install snpeff
```
conda install -c bioconda snpeff
```
```
snpEff
```

## Install NCBI Datasets API conda environment. 
NCBI Datasets (beta) installation. https://www.ncbi.nlm.nih.gov/datasets/docs/v2/download-and-install/
```
conda update -n base -c defaults conda
```
```
conda create -n ncbi_datasets
```
```
conda install -c conda-forge ncbi-datasets-cli
```

## Install and validate SRA-toolkit.
https://github.com/ncbi/sra-tools/wiki/02.-Installing-SRA-Toolkit

https://github.com/ncbi/sra-tools/wiki/03.-Quick-Toolkit-Configuration. 

```
cd /usr/local/bin
```
```
sudo wget --output-document sratoolkit.tar.gz https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz
```
```
sudo tar -vxzf sratoolkit.tar.gz
```
Confirm the sratoolkit version before exporting PATH
copy the export path to the last line of ~/.bashrc
```
export PATH=/usr/local/bin/sratoolkit.3.0.7-ubuntu64/bin:${PATH}
```
```
which fastq-dump
```
```
fastq-dump --stdout -X 2 SRR390728
```

## Install E-Utilities/Edirect
https://www.ncbi.nlm.nih.gov/books/NBK179288/

```
sh -c "$(curl -fsSL ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh)"
```

Copy and paste command path to the last line of ~/.bashrc
```
export PATH=${HOME}/edirect:${PATH}
```

## Funding

This work used Jetstream2 at Indiana University (IU) through research allocation BIO220099 from the Advanced Cyberinfrastructure Coordination Ecosystem: Services & Support (ACCESS) program, which is supported by National Science Foundation grants #2138259, #2138286, #2138307, #2137603, and #2138296.

This work used Jetstream at Indiana Universery/Texas Advanced Computing Center (IU/TACC) through research startup allocation BIO210100 from the Extreme Science and Engineering Discovery Environment (XSEDE), which was supported by National Science Foundation grant number #1548562.

This work used Jetstream at Indiana Universery/Texas Advanced Computing Center (IU/TACC) through educational allocation MCB200044 from the Extreme Science and Engineering Discovery Environment (XSEDE), which was supported by National Science Foundation grant number #1548562.

## Citations

Erin Alison Becker, Sarah LR Stevens, Bianca Peterson, Jake Cowper Szamosi, Fotis E. Psomopoulos, Travis Wrightsman, Karen Word, Murray Cadzow, Sam Nooij, Sangram Keshari Sahu, Sarah M Brown, Stephen Tahan, Umar Ahmad, Valerie Gartner, Annajiat Alim Rasel, Daniel Kerchner, & rosemm. (2023). datacarpentry/genomics-workshop: Genomics Workshop: September 2023 (2023.09). Zenodo. https://doi.org/10.5281/zenodo.8360950

David Y. Hancock, Jeremy Fischer, John Michael Lowe, Winona Snapp-Childs, Marlon Pierce, Suresh Marru, J. Eric Coulter, Matthew Vaughn, Brian Beck, Nirav Merchant, Edwin Skidmore, and Gwen Jacobs. 2021. “Jetstream2: Accelerating cloud computing via Jetstream.” In Practice and Experience in Advanced Research Computing (PEARC ’21). Association for Computing Machinery, New York, NY, USA, Article 11, 1–8. DOI: https://doi.org/10.1145/3437359.3465565

Stewart, C.A., Cockerill, T.M., Foster, I., Hancock, D., Merchant, N., Skidmore, E., Stanzione, D., Taylor, J., Tuecke, S., Turner, G., Vaughn, M., and Gaffney, N.I., “Jetstream: a self-provisioned, scalable science and engineering cloud environment.” 2015, In Proceedings of the 2015 XSEDE Conference: Scientific Advancements Enabled by Enhanced Cyberinfrastructure. St. Louis, Missouri. ACM: 2792774. p. 1-8. DOI: https://dx.doi.org/10.1145/2792745.2792774

Towns, J, and T Cockerill, M Dahan, I Foster, K Gaither, A Grimshaw, V Hazlewood, S Lathrop, D Lifka, GD Peterson, R Roskies, JR Scott. “XSEDE: Accelerating Scientific Discovery”, Computing in Science & Engineering, vol.16, no. 5, pp. 62-74, Sept.-Oct. 2014, doi:10.1109/MCSE.2014.80


