# OmicsVMconfigure

[![DOI](https://zenodo.org/badge/382447003.svg)](https://zenodo.org/badge/latestdoi/382447003)

PI: Jeffrey Robinson, MS, PhD<br>
UMBC, College of Natural and Mathematical Sciences, Translational Life Science Technology (TLST) BS program

Install and configure command-line Linux environment for comparative genomics workflows.  Includes open-source tools required for searching, downloading, and processing raw NextGen sequencing data and running a genome variant calling workflow.  Build using a Linux Virtual Machine in the NSF Jetstream2 cloud environment.  Web-apps based on this configuation appear in separate repositories.

## Set up Ubuntu Linux VM for the VCFgenerator workflow
Starting with a base VM of Ubuntu 20 LTS*** (GNU/Linux 5.15.0-50-generic x86_64). m3.large, 16 CPU cores, 60 Gb RAM, 60 GB root disk.***

***testing found Ubuntu 22 EDirect installation error, "curl command failed" that appears due to missing or incompatible library libssl1.1.

## General environment: 
   
1. Update system, install Anaconda, Bioconda applications fastqc, trimmomatic, bwa, bamtools, vcfutils, samtools, snpEff. 
2. Install NCBI SRA-toolkit, NCBI Edirect, NCBI Datasets APIs.
4. Install base-R, R-Shiny package, and R-ShinyServer. (pending)
5. Install igv-reports. (pending)

## Steps
Installations can run from the /home/exouser/ directory of the Jetstream2 VM. Multiple users are not supported for simplicity.<br>

1. Update system, (re)install curl (if required). 
2. Install Anaconda version- Anaconda3-2023.03-1-Linux-x86_64.sh
3. conda install fastqc, trimmomatic, bwa, samtools, bamtools, vcfutils, snpeff
8. configure the ncbi-datasets conda environment
9. Install and validate NCBI SRA-toolkit
10. Install NCBI E-Utilities/EDirect API<br>

<em>When complete, users should have directories /home/exouser/anaconda3/ and /home/exouser/edirect/ and /usr/local/bin/sratoolkit.3.0.7-ubuntu64/bin/</em>

(pending validation)

11. Install base-R.
12. Install R-Shiny package, ShinyServer
13. Install/Clone igv-reports

## Update System, install curl.
```
sudo apt update
```
Ubuntu Linux 20.04 has curl natively
```
sudo apt install curl -y
```

## Install Anaconda. 
https://docs.anaconda.com/anaconda/install/linux/
``` 
sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
```

The Anaconda3-2023.03-1-Linux-x86_64 distro works of 9/15/23, newer distros are not validated (https://repo.anaconda.com/archive/)
```
cd /tmp
```
```
curl --output anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2023.03-1-Linux-x86_64.sh
```
```
bash anaconda.sh
```
- Accept license
- Press Enter to the default installation PREFIX=/home/exouser/anaconda3
- Type yes to "initialize Anaconda3"
- When complete, cd home and activate environment settings (or restart session)
```
source ~/.bashrc
conda list
conda --version
```
## Install Bioconda apps

Install fastqc
```
conda install -c bioconda fastqc
```
Install trimmomatic
```
conda install -c bioconda trimmomatic
```
Install bwa
```
conda install -c bioconda bwa
```
Install samtools, bamtools, vcftools
```
conda install -c bioconda samtools bamtools vcftools
```
```
conda install -c bioconda bamtools
```
```
conda install -c bioconda vcftools
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

David Y. Hancock, Jeremy Fischer, John Michael Lowe, Winona Snapp-Childs, Marlon Pierce, Suresh Marru, J. Eric Coulter, Matthew Vaughn, Brian Beck, Nirav Merchant, Edwin Skidmore, and Gwen Jacobs. 2021. “Jetstream2: Accelerating cloud computing via Jetstream.” In Practice and Experience in Advanced Research Computing (PEARC ’21). Association for Computing Machinery, New York, NY, USA, Article 11, 1–8. DOI: https://doi.org/10.1145/3437359.3465565

Stewart, C.A., Cockerill, T.M., Foster, I., Hancock, D., Merchant, N., Skidmore, E., Stanzione, D., Taylor, J., Tuecke, S., Turner, G., Vaughn, M., and Gaffney, N.I., “Jetstream: a self-provisioned, scalable science and engineering cloud environment.” 2015, In Proceedings of the 2015 XSEDE Conference: Scientific Advancements Enabled by Enhanced Cyberinfrastructure. St. Louis, Missouri. ACM: 2792774. p. 1-8. DOI: https://dx.doi.org/10.1145/2792745.2792774

Towns, J, and T Cockerill, M Dahan, I Foster, K Gaither, A Grimshaw, V Hazlewood, S Lathrop, D Lifka, GD Peterson, R Roskies, JR Scott. “XSEDE: Accelerating Scientific Discovery”, Computing in Science & Engineering, vol.16, no. 5, pp. 62-74, Sept.-Oct. 2014, doi:10.1109/MCSE.2014.80


