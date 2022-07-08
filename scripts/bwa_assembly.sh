## Index the reference genome
bwa index data/ref_genome/Halobacterium.fna

## Make an output directory for .sam files
mkdir -p results/sam/ 

## Assemble trimmed sequences against the reference genome, output results to results/sam
bwa mem data/ref_genome/Halobacterium.fna HaloTrimmed.fastq > results/sam/SRR8699861.aligned.sam
