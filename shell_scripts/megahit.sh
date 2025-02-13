#!/bin/bash

fastqs=$(ls /data/raid1_HDD/David/graph_searching_sarand/reads_for_analysis/reads_fastq/SR/*_1.fastq)

for f in $fastqs

do

base=$(basename $f)

megahit -1 $f -2 ${f%_1.fastq}_2.fastq -o ${base%_1.fastq}
megahit_core contig2fastg 141 ${base%_1.fastq}/intermediate_contigs/k141.contigs.fa > ${base%_1.fastq}/${base%_1.fastq}.fastg

done
