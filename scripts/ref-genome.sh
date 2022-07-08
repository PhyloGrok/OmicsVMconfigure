## Get Reference Genome
sudo curl -L -o Halobacterium.fna.gz https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/004/799/605/GCF_004799605.1_ASM479960v1/GCF_004799605.1_ASM479960v1_genomic.fna.gz

## Unzip Reference Genome
sudo gunzip Halobacterium.fna.gz

## Move reference genome to folder
mkdir -p data/ref_genome/ mv Halobacterium.fna data/ref_genome/
