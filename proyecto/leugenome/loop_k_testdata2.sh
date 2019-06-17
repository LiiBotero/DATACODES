#!/usr/bin/env bash
# try different values of k for abyss assembly with test data

for k in `seq 9 3 50`; do

abyss-pe k=$k name=test$k in='trimmed/M011_S20_R1_001.trim.fastq.gz trimmed/M011_S20_R2_001.trim.fastq.gz'
done

head -1 test15-stats > kmerleuconostoc
grep 'scaffolds.fa' test*stats >> kmerleuconostoc
