## NCBI query for SRA run-table results
## BTEC495 F2021. Robinson and B. Lamotte

## Retrieve Halobacterium PubMed records
```
esearch -db pubmed -query "Halobacterium[ORGN]" | efetch -format medline > HsAbstracts
```

#("Halobacterium"[Organism] OR Halobacterium[All Fields]) AND ("biomol dna"[Properties] AND "platform illumina"[Properties] AND "strategy wgs"[Properties] OR "strategy #wga"[Properties] OR "strategy wcs"[Properties] OR "strategy clone"[Properties] OR "strategy finishing"[Properties] OR "strategy validation"[Properties] AND "filetype #fastq"[Properties])

## Search string for ncbi website
```
esearch -db sra -query "Halobacterium[All Fields]" | efilter -query "biomol dna[PROP]" AND "platform illumina"[PROP]esearch -db sra -query "Halobacterium[All Fields]" | efilter -query "biomol dna[PROP]" AND "platform illumina[PROP]" | efetch -format xml > esearchresults.txt
```

## Retrieve reference genomes
Extract Ref-seq aassembly accession
```
esearch -db genome  -query "txid56812" | efetch -format docsum | xtract -pattern DocumentSummary -element Assembly_Accession
```
Download fasta files using ref-seq assembly accession
```
esearch -db assembly -query GCF_000014705.1 | elink -target nucleotide -name \
        assembly_nuccore_refseq | efetch -format fasta > GCF_000014705.1.fa
```
Extract fasta file(s) from txid query
```
esearch -db genome  -query "txid56812" | elink -target nuccore | efetch -format fasta > aa.fa
```
## Illumina whole genome SRA .fastq sequences
```
esearch -db sra -query "Halobacterium[All Fields]" | efilter -query "biomol dna[PROP]" | efilter -query "platform illumina[PROP]" | efilter -query "strategy wgs[PROP]" | efetch -format uid > SraAccList.txt
```
```
esearch -db sra -query "Halobacterium[All Fields]" | efilter -query "biomol dna[PROP]" | efilter -query "platform illumina[PROP]" | efilter -query "strategy wgs[PROP]" | efilter -query "library layout paired[PROP]" | efetch -format uid > SraAccList.txt 
```
