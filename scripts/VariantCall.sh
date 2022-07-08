## Calculate read coverage
bcftools mpileup -O b -o results/bcf/SRR8699861_raw.bcf -f data/ref_genome/Halobacterium.fna results/bam/SRR8699861.aligned.sorted.bam

## Detects SNPs
bcftools call --ploidy 1 -m -v -o results/bcf/SRR8699861_variants.vcf results/bcf/SRR8699861_raw.bcf

## Filter SNPs and generate .vcf file
vcfutils.pl varFilter results/bcf/SRR8699861_variants.vcf > results/bcf/SRR8699861_final_variants.vcf

## Observe the validated SNP variants
less -S results/vcf/SRR2584866_final_variants.vcf
