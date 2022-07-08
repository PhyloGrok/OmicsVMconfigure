## Run trimmomatic using specified adapters
trimmomatic SE -threads 4 SRR8699861.fastq \ HaloTrimmed.fastq \ ILLUMINACLIP:adapters.fasta:2:40:15

## Run fastqc on the trimmed sequence and save to file
fastqc HaloTrimmed.fastq mkdir -p results/fastqc_trimmed_reads/ mv *.zip results/fastqc_trimmed_reads/ mv *.html results/fastqc_trimmed_reads/
