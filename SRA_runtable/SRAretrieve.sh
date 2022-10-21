## BTEC495 - Fall 2021. Robinson and B. Lamotte
## See the E-Direct query for SraAccList.txt inputs

## Make an sra directory on Storage Volume
mkdir ../../media/volume/sdb/sra/
ls ../../media/volume/sdb/sra/

## Fetch SRA data into the volume sra/ directory
prefetch --option-file SraAccList.txt -O ../../media/volume/sdb/sra/

## for-loop then retreives the full .fastq files for each accession

## * for file in ncbi/public/sra/*; do fasterq-dump "$file" ; done
## cd sra/
## fasterq-dump *

## Retrieve .fastq data
mkdir ../../media/volume/sdb/sra/fastq/

## Download reference genomes using NCBI datasets beta

## ncbi_datasets download usage: https://www.ncbi.nlm.nih.gov/datasets/docs/v1/reference-docs/command-line/datasets/download/

## Activate NCBI datasets conda environment
conda activate ncbi_datasets

## Retrieve Reference Datasets (into a storage volume)
datasets download genome taxon Halobacterium --reference --filename ../../media/volume/sdb/refdata/HsalinarumDataset.zip

## Exit ncbi environment
conda deactivate
