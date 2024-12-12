#!/bin/bash

# Read in list of genomes from a directory
READS=$(ls /data/raid1_HDD/David/graph_searching_sarand/reads_for_analysis/reads_fastq/LR/*.fastq)

for READ in $READS

do

    # get the basename of the file
    BASE=$(basename $READ)

    minimap2 -ax map-ont /home/david/dm-lab/graph_searching_sarand/card_protein_homolog_with_fam.fasta $READ > ./LR_out/${BASE%.fastq}.sam

done
