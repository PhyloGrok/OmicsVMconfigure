## Make results directory and transfer fastqc results
mkdir -p ../../media/volume/sdb/sra/fastq/fastqcresults/
mkdir -p ../../media/volume/sdb/sra/fastq/fastqcresults/untrimmed
mkdir -p ../../media/volume/sdb/sra/fastq/fastqcresults/trimmed
mv ../../media/volume/sdb/sra/fastq/*.zip ../../media/volume/sdb/sra/fastq/fastqcresults/untrimmed/
mv ../../media/volume/sdb/sra/fastq/*.html ../../media/volume/sdb/sra/fastq/fastqcresults/untrimmed/

#mkdir -p results/fastqc_untrimmed_reads/  mv *.html results/fastqc_untrimmed_reads/
##--$ ./postqc.sh  ## Moves fastqc results into qcresults/ directory
