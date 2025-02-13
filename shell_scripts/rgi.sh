#!/bin/bash

#A script using parallel to run rgi on a set of genomes, must be run in directory with genomes

#ensure rgi is installed with conda
#activate conda env before use

#load CARD data
rgi load --card_json ./card.json --local

# Read in list of genomes from a directory
GENOMES=$(ls /data/raid1_HDD/David/graph_searching_sarand/assemblies_for_analysis/*/*.fasta)

for G in $GENOMES

do
    
    # get the basename of the file
    BASE=$(basename $G)
    echo "rgi main -i $G -o ./final_rgi_contig_results/${BASE%.*}_rgi_results --input_type contig --local --clean"

done > rgi_commands.txt


#run rgi in parallel 
parallel --jobs 8 --bar {} :::: rgi_commands.txt

#remove rgi commands file
rm rgi_commands.txt


