#!/usr/bin/env bash
#take sam from aligment and call variants

#convert sam to bam 
samtools view -S -b ~/results/alignment/SRR2584863.SAM | \
samtools sort -o ~/results/alignment/SRR2584863.sorted.bam
samtools index ~/results/alignment/SRR2584863.sorted.bam #need index fot tview
bcftools mpileup -O b -o SRR2584863.bcf\
-f ~/data/ref_genome/GCA_000017985.1_ASM1798v1_genomic.fna \ 
~/results/alignment/SRR2584863.sorted.bam

bcftools call --ploidy 1 -m -v -o ~/results/SRR2584863_variants.bcf ~/results/SRR2584863.bcf

vcfutils.pl varFilter ~/results/SRR2584863_variants.bcf > ~/results/SRR2584863_final_variants.vcf
#con este archivo obtenemos las variaciones en el archivo final:variants. para buscar las posiciones de dichas variaciones en el bam
