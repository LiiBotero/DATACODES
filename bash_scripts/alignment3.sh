#!/usr/bin/env bash
#script using bwa mem to align example trimmed reads to  ref_genome for ecoli

bwa mem ~/data/ref_genome/GCA_000017985.1_ASM1798v1_genomic.fna \
~/data/trimmed_fastq_small/sub/SRR2589044_1.trim.sub.fastq  \
~/data/trimmed_fastq_small/sub/SRR2589044_2.trim.sub.fastq  > ~/results/alignment/SRR2589044.sam
