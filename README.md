# DI-tector-accessory-scripts

[DI-tector](10.1261/rna.066910.118) is a program which identifies defective viral genomes (DVGs) from sequencing data. It takes in fastq input and returns several text files as output. Here, I describe how to run DI-tector, and provide scripts for reformatting output and analyzing it. 

I ran DI-tector in Terminal, using the command below. Detailed explanations of the parameters can be found [here](10.1261/rna.066910.118). The following command is for a negative strand RNA virus, and uses 8 threads. 
```
python DI-tector_06.py -p 1  -x 8 -o [OUTPUT DIR TAG] -t [OUTPUT FILE TAG] -g [FILE PATH FOR HOST GENOME REFERENCE] [FILE PATH FOR VIRAL GENOME REFERENCE] [FASTQ FILE (INPUT)]
```
To run multiple fastqs at once, I collected the individual commands for each fastq into a larger bash script and ran them together.
