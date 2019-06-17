#!usr/bin/env bash
#code
for file in *_R1_001.fastq.gz
 do
   base=$(basename ${file} _R1_001.fastq.gz)
   trimmomatic PE ${file} ${base}_R2_001.fastq.gz \
                ${base}_R1_001.trim.fastq.gz ${base}_R1_001.untrim.fastq.gz \
                ${base}_R2_001.trim.fastq.gz ${base}_R2_001.untrim.fastq.gz \
                SLIDINGWINDOW:4:20 #MINLEN:25 ILLUMINACLIP:NexteraPE-PE.fa:2:40:15 
 done