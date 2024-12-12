#!/bin/bash

#A script using parallel to run rgi bwt on a set of reads

#ensure rgi is installed with conda
#activate conda env before use

#load CARD data
rgi load --card_json ./card.json --local

rgi card_annotation -i ./card.json > card_annotation.log 2>&1

rgi load -i ./card.json --card_annotation card_database_*.fasta --local

# Read in list of genomes from a directory
READS=$(ls /data/raid1_HDD/David/graph_searching_sarand/reads_for_analysis/reads_fastq/SR/*1.fastq)

for READ in $READS

do
    
    # get the basename of the file
    BASE=$(basename $READ)

    rgi bwt -1 $READ -2 ${READ%1.fastq}2.fastq -o SR_out/${BASE%1.fastq} --local --clean -n 4

done 





