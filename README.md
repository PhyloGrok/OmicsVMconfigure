# OmicsVMconfigure

[![DOI](https://zenodo.org/badge/382447003.svg)](https://zenodo.org/badge/latestdoi/382447003)

PI: Jeffrey Robinson, MS, PhD<br>
UMBC, College of Natural and Mathematical Sciences, Translational Life Science Technology (TLST) BS program

Configure a command-line Linux environment for comparative genomics workflows.  Includes all open-source tools required for searching, downloading, and processing raw NextGen sequencing data and running a genome variant calling workflow.  Build using a Linux Virtual Machine in the NSF Jetstream2 cloud environment.  Web-apps based on this configuation appear in separate repositories.

## [System Setup](/SysConfig/ConfigureSystem.md)
Starting with a base image of Ubuntu 20 LTS*** (GNU/Linux 5.15.0-50-generic x86_64). m3.large, 16 CPU cores, 60 Gb RAM, 60 GB root disk.***

*** Initial testing discovered an Ubuntu 22 has an error with EDirect installation, "curl command failed" that appears due to missing or incompatible library libssl1.1.

Progression of installations: 
   
1. Update system, install curl and dependencies, install Anaconda, Bioconda. 
2. Install NCBI SRA-toolkit, NCBI Edirect, NCBI Datasets APIs.
3. Conda-Bioconda installations for genomics applications fastqc, trimmomatic, bwa, bamtools, vcfutils, samtools.
4. Install base-R, R-Shiny package, and R-ShinyServer.
5. Install igv-reports.


## Funding

This work used Jetstream2 at Indiana University (IU) through research allocation BIO220099 from the Advanced Cyberinfrastructure Coordination Ecosystem: Services & Support (ACCESS) program, which is supported by National Science Foundation grants #2138259, #2138286, #2138307, #2137603, and #2138296.

This work used Jetstream at Indiana Universery/Texas Advanced Computing Center (IU/TACC) through research startup allocation BIO210100 from the Extreme Science and Engineering Discovery Environment (XSEDE), which was supported by National Science Foundation grant number #1548562.

This work used Jetstream at Indiana Universery/Texas Advanced Computing Center (IU/TACC) through educational allocation MCB200044 from the Extreme Science and Engineering Discovery Environment (XSEDE), which was supported by National Science Foundation grant number #1548562.

## Citations

David Y. Hancock, Jeremy Fischer, John Michael Lowe, Winona Snapp-Childs, Marlon Pierce, Suresh Marru, J. Eric Coulter, Matthew Vaughn, Brian Beck, Nirav Merchant, Edwin Skidmore, and Gwen Jacobs. 2021. “Jetstream2: Accelerating cloud computing via Jetstream.” In Practice and Experience in Advanced Research Computing (PEARC ’21). Association for Computing Machinery, New York, NY, USA, Article 11, 1–8. DOI: https://doi.org/10.1145/3437359.3465565

Stewart, C.A., Cockerill, T.M., Foster, I., Hancock, D., Merchant, N., Skidmore, E., Stanzione, D., Taylor, J., Tuecke, S., Turner, G., Vaughn, M., and Gaffney, N.I., “Jetstream: a self-provisioned, scalable science and engineering cloud environment.” 2015, In Proceedings of the 2015 XSEDE Conference: Scientific Advancements Enabled by Enhanced Cyberinfrastructure. St. Louis, Missouri. ACM: 2792774. p. 1-8. DOI: https://dx.doi.org/10.1145/2792745.2792774

Towns, J, and T Cockerill, M Dahan, I Foster, K Gaither, A Grimshaw, V Hazlewood, S Lathrop, D Lifka, GD Peterson, R Roskies, JR Scott. “XSEDE: Accelerating Scientific Discovery”, Computing in Science & Engineering, vol.16, no. 5, pp. 62-74, Sept.-Oct. 2014, doi:10.1109/MCSE.2014.80


