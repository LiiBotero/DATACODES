#!/usr/bin/env bash
#script using bwa mem to align example trimmed reads to  ref_genome for ecoli

#mkdir ~/results/alignment_1
#genome= ~/data/ref_genome/GCA_000017985.1_ASM1798v1_genomic.fna \

#bwa index $genome

for R1 in ~/data/trimmed_fastq_small/sub/*_1.trim.sub.fastq
do

R2=${R1%%_1.trim.sub.fastq}"_2.trim.sub.fastq"
srr=$(basename $R1 _1.trim.sub.fastq)
bwa mem ~/data/ref_genome/GCA_000017985.1_ASM1798v1_genomic.fna \
${R1} \
${R2} > ~/results/alignmentnew/$(basename $R1 _1.trim.sub.fastq).sam \

done
