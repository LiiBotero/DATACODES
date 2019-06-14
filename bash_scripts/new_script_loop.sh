#!usr/bin/env bash
#Script to trim fastq 1st fastq pair  w  trimmomatic
for R1 in *_1.fastq.gz
do
R2=${R1%%_1.fastq.gz}"_2.fastq.gz"
srr=$(basename $R1 _1.fastq.gz)

trimmomatic PE \
$R1 $R2  \
~/data/trimmed_fastq/${srr}_1.trimmed.fastq.gz  ~/data/trimmed_fastq/${srr}_1.untrimmed.fastq.gz  \
~/data/trimmed_fastq/${srr}_2.trimmed.fastq.gz  ~/data/trimmed_fastq/${srr}_2.untrimmed.fastq.gz  \
SLIDINGWINDOW:4:20 # \ 
#ILLUMINACLIP:~/.miniconda3/pkgs/trimmomatic-0.38-0/share/trimmomatic-0.38-0/adapters/NexteraPE-PE.fa 

done
