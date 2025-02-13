#!/bin/bash

# script to assemble long reads using shasta

reads=$(ls /data/raid1_HDD/David/graph_searching_sarand/reads_for_analysis/reads_fastq/LR/*.fastq)

for read in $reads

do

base=$(basename $read)

flye --meta --nano-corr $read --out-dir ./runs/${base%.fastq} 

done
