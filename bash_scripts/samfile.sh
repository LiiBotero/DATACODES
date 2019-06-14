#!/usr/bin/env bash
# variant calling



#Sam to BAM
for file in ~/results/alignmentnew/*.sam
do
#echo ${file}
samtools view -S -b ${file} > ~/results/alignmentnew/$(basename ${file} .sam).bam 
samtools sort -o ~/results/alignmentnew/$(basename ${file} .sam).sorted.bam ~/results/alignmentnew/$(basename ${file} .sam).bam 
#samtools index ~/results/alignmentnew/$(basename ${file} .sam).sorted.bam

