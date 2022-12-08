

```esearch -db pubmed -query "tn3 transposition immunity" | efetch -format medline```

```
esearch -db pubmed -query "opsin gene conversion" | \

elink -related | \
elink -target protein | \
efilter -division rod | \
efetch -format fasta
```

