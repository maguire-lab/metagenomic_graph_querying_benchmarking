#!/bin/bash

# script to assemble long reads using shasta

reads=$(ls /data/raid1_HDD/David/graph_searching_sarand/reads_for_analysis/reads_fastq/LR/*.fastq)

for read in $reads

do

base=$(basename $read)

shasta --config Nanopore-May2022 --Reads.minReadLength 1000 --input $read --assemblyDirectory ./runs/${base%.fastq} 

done
