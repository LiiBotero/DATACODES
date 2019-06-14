#!/usr/bin/env bash
#take sam from aligment and call variants

mkdir ~/data/results/alignment_1
for R1 in *_1.trim.sub.fastq
do
R2=${R1%%_1.trim.sub.fastq}"_2.trim.sub.fastq"
srr=$(basename $R1 _1.trim.sub.fastq)

bwa mem ~/data/ref_genome/GCA_000017985.1_ASM1798v1_genomic.fna \
$R1 $R2  \
~/data/trimmed_fastq_small/sub/${srr}_1.trim.sub.fastq  \
~/data/trimmed_fastq_small/sub/${srr}_2.trim.sub.fastq  > ~/results/alignment_1/${srr}.sam

#convert sam to bam 
samtools view -S -b ~/results/alignment/SRR2584863.SAM | \
samtools sort -o ~/results/alignment/SRR2584863.sorted.bam
samtools index ~/results/alignment/SRR2584863.sorted.bam #need index fot tview
bcftools mpileup -O b -o SRR2584863.bcf\
-f ~/data/ref_genome/GCA_000017985.1_ASM1798v1_genomic.fna \ 
~/results/alignment/SRR2584863.sorted.bam

bcftools call --ploidy 1 -m -v -o ~/results/SRR2584863_variants.bcf ~/results/SRR2584863.bcf

