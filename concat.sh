#/bin/bash

## OUTPUT PROCESSING ##
# create header file

head -n 1 final_rgi_contig_results/HC_SR_25_MS_contigs_rgi_results.txt > header_rgi.txt

#add filename to each line of every text file in ./rgi_results

for t in ./final_rgi_contig_results/*.txt

do

    awk '{print FILENAME (NF?"\t":"") $0}' $t > ${t%.*}_tmp.txt
    #remove header
    sed -i '1d' ${t%.*}_tmp.txt

done

#concantenate all files together including header file
cat header_rgi.txt ./final_rgi_contig_results/*tmp.txt > final_rgi_contig_results.tsv

#remove tmp files
rm ./final_rgi_contig_results/*tmp.txt
