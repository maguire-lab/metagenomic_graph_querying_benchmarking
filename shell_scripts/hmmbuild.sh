#!/bin/bash 

for m in ./msas_out/msa_aa_clust/*.msa

do 

    hmmbuild ${m%%.msa}.hmm $m

done
