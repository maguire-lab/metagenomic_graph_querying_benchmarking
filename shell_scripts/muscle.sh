#!/bin/bash

# Muscle alignment

for f in ./aa_clust/*.fasta

do 

muscle -align "$f" -output ./"${f%%.fasta}".msa

done