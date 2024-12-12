#!/bin/bash
#install spades using conda and activate the environment before running this script

for f in *_1.fastq

do

echo "Assembling the following genome/metagenome:"
echo "$f"
echo "${f%_1.fastq}_2.fastq"

#use --meta for metagenomes, --isolate for single genomes
spades.py \
    --meta \
    -o metaspades_out/${f%_1.fastq} \
    -1 ${f%} \
    -2 ${f%_1.fastq}_2.fastq

done
