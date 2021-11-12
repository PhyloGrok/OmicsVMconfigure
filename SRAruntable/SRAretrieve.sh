## BTEC495 - Fall 2021. Robinson and B. Lamotte
## Uses installed SRAtools to prefetch from a list of SRA accessions

prefetch --option-file SraAccList.txt 

## prefetch files populate the user home ncbi/ directory

## for-loop then retreives the full .fastq files for each accession

for file in ncbi/public/sra/*; do fasterq-dump "$file" ; done
