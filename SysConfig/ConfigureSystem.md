## System Configuration
General Workflow
Base VM: (Ubuntu 20.04 LTS)(GNU/Linux 5.15.0-50-generic x86_64). m3.large, 16 CPU cores, 60 Gb RAM, 60 GB root disk.
1. Update system, install curl and dependencies. 
2. Install Anaconda
3. conda install fastqc
4. conda install trimmomatic
5. conda install bwa
6. conda install samtools bamtools vcfutils
7. conda install snpeff
8. configure conda ncbi-datasets environment
9. Install and validate NCBI SRA-toolkit
10. Install NCBI E-Utilities/EDirect API

(pending validation)
11. Install base-R.
12. Install R-Shiny package, ShinyServer
13. Install/Clone igv-reports

## 1, 2: Update System, install curl.
```
sudo apt update
```
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
cd /tmp ## or /opt
curl --output anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2023.03-1-Linux-x86_64.sh
bash anaconda.sh
## Accept license
## Press Enter to the default installation PREFIX=/home/exouser/anaconda3
## Type yes to "initialize Anaconda3"
```
```
##  cd home Activate environment settings (or restart session)
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
snpEff
```

## Install NCBI Datasets API. 
NCBI Datasets (beta) installation. https://www.ncbi.nlm.nih.gov/datasets/docs/v2/download-and-install/
```
conda update -n base -c defaults conda

conda create -n ncbi_datasets

conda install -c conda-forge ncbi-datasets-cli

```

## Install and validate SRA-toolkit.
https://github.com/ncbi/sra-tools/wiki/02.-Installing-SRA-Toolkit

https://github.com/ncbi/sra-tools/wiki/03.-Quick-Toolkit-Configuration. 

```
cd /usr/local/bin
```
```
sudo wget --output-document sratoolkit.tar.gz https://ftp-
```
```
trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz
```
```
sudo tar -vxzf sratoolkit.tar.gz
```
Confirm the sratoolkit version
```
export PATH=$PATH:$PWD/sratoolkit.3.0.7-ubuntu64/bin
```
Validate Command
```
which fastq-dump
fastq-dump --stdout -X 2 SRR390728
```

Install E-Utilities/Edirect

https://www.ncbi.nlm.nih.gov/books/NBK179288/
```
sh -c "$(curl -fsSL ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh)"
export PATH=${PATH}:${HOME}/edirect
```
alternatively, edirect/ can be moved into the /usr/local/bin/ by the installer, and users can enable it by running:
```
export PATH="/usr/local/bin/edirect/:$PATH"
```

