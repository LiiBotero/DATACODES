#!/usr/bin/env bash
# try different values of k for abyss assembly with test data

#for k in `seq 15 3 45`; do

#abyss-pe k=$k name=test$k in='test-data/SRR2584863_1.trim.sub.fastq test-data/SRR2584863_2.trim.sub.fastq'
#done

head -1 test15-stats > allteststats1
grep 'scaffolds.fa' test*stats >> allteststats1

#head -1 SRR2584863k15-stats >