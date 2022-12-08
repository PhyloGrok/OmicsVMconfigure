
## Examples for EDirect command-line queries:

1. Download medline-format results for a "tn2 transposition immunity" PubMed search:
```
esearch -db pubmed -query "tn3 transposition immunity" | efetch -format medline
```

2. Retrieve protein fasta files associated with PubMed results from query "opsin gene conversion".
```
esearch -db pubmed -query "opsin gene conversion" | elink -related | elink -target protein | efilter -division rod | efetch -format fasta > fastas.fasta
```

3. Retrieve abstracts from PubMed results from query "lycopene cyclase"
```
esearch -db pubmed -query "lycopene cyclase" | efetch -format abstract > abstracts.txt
```
4. Retrieve protein fastas for the query "lycopene cyclase"
```
esearch -db protein -query "lycopene cyclase" | efetch -format fasta > fastas.fasta
```
5. Retrieve genbank-formatted protein flatfile results for "lycopene cyclase"
```
esearch -db protein -query "lycopene cyclase" | efetch -format gb
```
