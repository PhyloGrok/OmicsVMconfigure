## Make results directory and transfer fastqc results
mkdir -p results/fastqc_untrimmed_reads/ mv *.zip results/fastqc_untrimmed_reads/ mv *.html results/fastqc_untrimmed_reads/
##--$ ./postqc.sh  ## Moves fastqc results into qcresults/ directory
