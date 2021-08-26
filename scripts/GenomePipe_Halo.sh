## Halobacterium variant calling workflow. Adapted from Data Carpentries Genomics Workshop.
## Robinson JM 2021.

## Download sequencing reads from SRA database using SRAtools API
## E-Utils/Edirect script goes here to customize sequences retrieval
fastq-dump -A SRR8699861

## EDirect

## Edirect - Reference Genome List
esearch -db Genome -query "Halobacterium" | efetch -format uid > HaloGenomeList

## Edirect - PacBio reads
esearch -db SRA -query "Halobacterium [ORGN] AND biomol dna [PROP] AND platform pacbio SMRT [PROP]"

## Run fastqc on the downloaded read files
fastqc *.fastq

## Make results directory and transfer fastqc results
mkdir -p results/fastqc_untrimmed_reads/ mv *.zip results/fastqc_untrimmed_reads/ mv *.html results/fastqc_untrimmed_reads/

## Run trimmomatic using specified adapters
trimmomatic SE -threads 4 SRR8699861.fastq \ HaloTrimmed.fastq \ ILLUMINACLIP:adapters.fasta:2:40:15

## Run fastqc on the trimmed sequence and save to file
fastqc HaloTrimmed.fastq mkdir -p results/fastqc_trimmed_reads/ mv *.zip results/fastqc_trimmed_reads/ mv *.html results/fastqc_trimmed_reads/

## Get Reference Genome
sudo curl -L -o Halobacterium.fna.gz https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/004/799/605/GCF_004799605.1_ASM479960v1/GCF_004799605.1_ASM479960v1_genomic.fna.gz

## Unzip Reference Genome
sudo gunzip Halobacterium.fna.gz

## Move reference genome to folder
mkdir -p data/ref_genome/ mv Halobacterium.fna data/ref_genome/

## Index the reference genome
bwa index data/ref_genome/Halobacterium.fna

mkdir -p results/sam/ bwa mem data/ref_genome/Halobacterium.fna HaloTrimmed.fastq > results/sam/SRR8699861.aligned.sam

bcftools mpileup -O b -o results/bcf/SRR8699861_raw.bcf -f data/ref_genome/Halobacterium.fna results/bam/SRR8699861.aligned.sorted.bam mkdir -p results/bcf

bcftools mpileup -O b -o results/bcf/SRR8699861_raw.bcf -f data/ref_genome/Halobacterium.fna results/bam/SRR8699861.aligned.sorted.bam

bcftools call --ploidy 1 -m -v -o results/bcf/SRR8699861_variants.vcf results/bcf/SRR8699861_raw.bcf

vcfutils.pl varFilter results/bcf/SRR8699861_variants.vcf > results/bcf/SRR8699861_final_variants.vcf

samtools index results/bam/SRR8699861.aligned.sorted.bam

samtools tview results/bam/SRR8699861.aligned.sorted.bam data/ref_genome/Halobacterium.fna

igv
