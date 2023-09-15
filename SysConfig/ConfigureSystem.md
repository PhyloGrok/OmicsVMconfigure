## System Configuration
General Workflow
Base VM: (Ubuntu 20.04 LTS)(GNU/Linux 5.15.0-50-generic x86_64). m3.large, 16 CPU cores, 60 Gb RAM, 60 GB root disk.
1. Update system, install curl and dependencies. 
2. Install Anaconda
3. Install BioConda
4. Install NCBI E-Utilities/EDirect API
5. Install and Validate NCBI SRA-toolkit
6. Download and install NCBI datasets API (beta)
8. Make a projects directory in attached storage volume
9. Install fastqc
10. Install trimmomatic
11. Install bwa
12. Install samtools, bamtools, vcfutils
13. Install base-R.
14. Install R-Shiny package, ShinyServer.
13,14. Install/Clone igv-reports (not validated)

1, 2: Update System, install curl.
```
sudo apt update
```
```
sudo apt install curl -y
```

3. Install Anaconda. Anaconda Linux installation: https://docs.anaconda.com/anaconda/install/linux/
``` 
sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
```

Install Anaconda for multiple users https://docs.anaconda.com/free/anaconda/install/multi-user/<br>
Forums say install in opt/ directory for availability for all users:<br>
https://askubuntu.com/questions/1457726/how-and-where-to-install-conda-to-be-accessible-to-all-users<br>
The following Anaconda distro is validated as of 9/15/23, check the directory for newer distros (https://repo.anaconda.com/archive/)
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
Install NCBI Datasets API. 

NCBI Datasets (beta) installation. https://www.ncbi.nlm.nih.gov/datasets/docs/v2/download-and-install/
```
conda update -n base -c defaults conda

conda create -n ncbi_datasets

conda install -c conda-forge ncbi-datasets-cli  #might be deprecated

```

Install and validate SRA-toolkit.

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


Install Bioconda. (unnecessary if above steps executed properly)
Update channels list
```
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict
```
https://bioconda.github.io <br>
https://github.com/bioconda/bioconda-utils<br>
https://anaconda.org/bioconda/bioconda-utils/<br> 
```
curl --output anaconda.sh https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh
source /home/exouser/anaconda3/etc/profile.d/conda.sh
conda install -c bioconda bioconda-utils  ## seems to be deprecated
conda list
conda --version
```
```
config --add channels bioconda
config --add channels conda-forge
```
```
sudo apt install sra-toolkit

6. Install E-Utilities/Edirect

https://www.ncbi.nlm.nih.gov/books/NBK179288/
```
sh -c "$(curl -fsSL ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh)"
export PATH=${PATH}:${HOME}/edirect
```
alternatively, edirect/ can be moved into the /usr/local/bin/ by the installer, and users can enable it by running:
```
export PATH="/usr/local/bin/edirect/:$PATH"
```

13. Install R-base
```
sudo apt-get install r-base

```
13. Install igv-reports
```
conda create -n igvreports python=3.7.1
conda activate igvreports

conda config --add channels r
conda config --add channels bioconda
conda install pysam
```
14. Clone igv-reports GitHub repo
```
wget wget https://github.com/igvteam/igv-reports/archive/refs/heads/master.zip
unzip master.zip
```
