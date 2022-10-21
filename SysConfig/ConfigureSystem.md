## 0. System Configuration
1. (Ubuntu 22.04 LTS)(GNU/Linux 5.15.0-50-generic x86_64). m3.large, 16 CPU cores, 60 Gb RAM, 60 GB root disk.
2. Update system, install curl and dependencies. 
3. Install R and ShinyR, Shiny Server.

Anaconda install. https://docs.anaconda.com/anaconda/install/linux/

Shiny R package download/install. https://www.rstudio.com/products/shiny/download-server/ubuntu/

Shiny Server admin guide. https://docs.rstudio.com/shiny-server/

``` 
sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

sudo apt update

sudo apt install curl -y

sudo apt-get install r-base

sudo su - \
-c "R -e \"install.packages('shiny', repos='https://cran.rstudio.com/')\""

sudo apt-get install gdebi-core
wget https://download3.rstudio.org/ubuntu-18.04/x86_64/shiny-server-1.5.19.995-amd64.deb
sudo gdebi shiny-server-1.5.19.995-amd64.deb
```
3. Install Anaconda. 

https://linuxhint.com/install-anaconda-ubuntu-22-04/
```
cd /tmp
curl --output anaconda.sh https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh
sha256sum anaconda.sh
bash anaconda.sh
## Accept license
## Press Enter
## Type yes
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

6. Install E-Utilities/Edirect

https://www.ncbi.nlm.nih.gov/books/NBK179288/
```
sh -c "$(curl -fsSL ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh)"
export PATH=${PATH}:${HOME}/edirect

```

7. Install NCBI Datasets download API


```
conda update -n base -c defaults conda

conda create -n ncbi_datasets

conda install -c conda-forge ncbi-datasets-cli

conda deactivate
```

8. Make a datasets download directory in volume
```
mkdir ../../media/volume/sdb/refdata/
```

9. Install fastqc
```
conda install -c bioconda fastqc
```
10. Install trimmomatic
```
conda install -c bioconda trimmomatic
```
