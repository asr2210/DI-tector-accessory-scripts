# DI-tector-accessory-scripts

[DI-tector](10.1261/rna.066910.118) is a program which identifies defective viral genomes (DVGs) from sequencing data. It takes in fastq input and returns several text files as output. Here, I describe how to run DI-tector, and provide scripts for reformatting output and analyzing it. 

I ran DI-tector in Terminal, using the command below. Detailed explanations of the parameters can be found [here](10.1261/rna.066910.118). The following command is for a negative strand RNA virus, and uses 8 threads. 
```
python DI-tector_06.py -p 1  -x 8 -o [OUTPUT DIR TAG] -t [OUTPUT FILE TAG] -g [FILE PATH FOR HOST GENOME REFERENCE] [FILE PATH FOR VIRAL GENOME REFERENCE] [FASTQ FILE (INPUT)]
```
To run multiple fastqs at once, I collected the individual commands for each fastq into a larger bash script and ran them together.

The session will inevitably crash while running DI-tector; the runtime for any given input file is usually ~30mins. To avoid this, run all commands in a Screen window [(details here)](https://linuxize.com/post/how-to-use-linux-screen/).

Once finished, DI-tector will produce an output directory (the name of which is controlled in the parameters) which contains several text files. From the original paper, 
> “*_summary.txt” recapitulates initial command line parameters and the total number of reads mapping a junction of each type of DI genomes. “*_counts.txt” lists all DI genomes with their respective counts and percentage, type, length, BP, and RI sites. Information concerning the length of the insert/deletion or loops is also mentioned. “*_output_sorted.txt” lists all reads overlapping a junction. For each read, DI genome length, BP, RI, delta position between BP and RI, segmentation of the read, MAPQ, RNAME, CIGAR, MD, POS (for both segments), QNAME values are mentioned. The sequence of the read is printed in upper-case letter before the junction and lower-case letter after. The sequence of each DI genome can be generated and exported as a multifasta file “*_fasta.fa”. Intermediate fastq and sam format files are also generated for potential further manual analyses. “*_Error.txt” and “*_Ali.txt” contain, respectively, error messages and a list of putatively correctly aligned segments that passed previous filters, mostly due to too many mismatches during alignment against the viral genome."

**reformatdata.sh** takes the information from counts.txt and reformats it in a tab-delimited fashion, producing an output file **countsdata.txt** which can be used for further analysis. Additionally, it separates 5' cb, 3' cb, insertion, and deletion DVG counts into separate files (labeled accordingly).

**dvganalysis_sample.R** is an R script which creates plots from the data in **countsdata.txt**. All labels are specific to the Ebola project, so **dvganalysis_sample.R** should only be used as a guide or template, not as-written.

DI-tector only takes in single reads, not paired-end reads. If analyzing paired-end data, one can either run each read file of a pair individually and use the two as replicates, or merge the reads using **merge_reads.sh**. The latter requires downloading BBMerge. 
