#!usr/bin/env bash
#code
 for R1 in ~/proyecto/leugenome/*_R1_001.fastq.gz
 do
 R2=${R1%%_R1_001.fastq.gz}"_R2_001.fastq.gz"
 srr=$(basename $R1 _R1_001.fastq.gz)
  echo $srr 
  
   trimmomatic PE \
  $R1 $R2\
  ~/proyecto/leugenome/trimmed/${srr}_R1_001.trim.fastq.gz  ~/proyecto/leugenome/trimmed/${srr}_R1_001.untrim.fastq.gz
  ~/proyecto/leugenome/trimmed/${srr}_R2_001.trim.fastq.gz  ~/proyecto/leugenome/trimmed/${srr}_R2_001.untrim.fastq.gz             

#SLIDINGWINDOW:4:20 MINLEN:25
done

