#!/usr/bin/env bash
#script using bwa mem to align example trimmed reads to  ref_genome for ecoli

bwa mem ~/proyecto/p-genome/GCF_000014445.1_ASM1444v1_genomic.fna \
~/proyecto/leugenome/trimmed/M011_S20_R1_001.trim.fastq.gz \
~/proyecto/leugenome/trimmed/M011_S20_R2_001.trim.fastq.gz > ~/proyecto/leugenome/M011_S20.sam
