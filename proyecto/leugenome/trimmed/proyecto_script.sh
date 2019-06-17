#!usr/bin/env bash
#code
set -e
cd ~/proyecto/leugenome
LG2=~/proyecto/p-genome/GCF_000014445.1_ASM1444v1_genomic.fna
bwa index $LG2
mkdir -p sam bam bcf vcf
for lq1 in *_R1_001.trim.fastq.gz
  do
   echo "working with file $lq1"
   base=$(basename $lq1 _R1_001.trim.fastq.gz)   
   echo "base name is $base"
    lq1=~/proyecto/leugenome/trimmed/${base}_R1_001.trim.fastq.gz
    lq2=~/proyecto/leugenome/trimmed/${base}_R2_001.trim.fastq.gz
    sam=~/proyecto/leugenome/trimmed/sam/${base}.sam
    bam=~/proyecto/leugenome/trimmed/bam/${base}.bam
    sorted_bam=~/proyecto/leugenome/trimmed/bam/${base}.sorted.bam
    raw_bcf=~/proyecto/leugenome/trimmed/bcf/${base}.bcf
    variants=~/proyecto/leugenome/trimmed/bcf/${base}_variants.vcf
    final_variants=~/proyecto/leugenome/trimmed/vcf/${base}_final_variants.vcf
    bwa mem $LG2 $lq1 $lq2 > $sam
    samtools view -S -b $sam > $bam
    samtools sort -o $sorted_bam $bam
    samtools index $sorted_bam
    bcftools mpileup -O b -o $raw_bcf -f $LG2 $sorted_bam
    bcftools call --ploidy 1 -m -v -o $variants $raw_bcf
    vcfutils.pl varFilter $variants > $final_variants

done