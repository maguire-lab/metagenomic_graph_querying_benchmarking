#!/bin/bash 

# script to cluster amino acid sequences using mmseqs2 at 90% ID

# loop though fastas

for f in *.fasta 

do 

# make mmseqs db

    mmseqs createdb $f ${f%.fasta}_db

# cluster sequences at 90% ID

    mmseqs cluster ${f%.fasta}_db ${f%.fasta}_clust tmp --min-seq-id 0.9

# convert clustered db to sequence 

    mmseqs createseqfiledb ${f%.fasta}_db ${f%.fasta}_clust ${f%.fasta}_clust_seq

# extract sequences from db

    mmseqs unpackdb ${f%.fasta}_clust_seq 0.9_clust_${f%.fasta} --unpack-suffix _clustered_$f

done

