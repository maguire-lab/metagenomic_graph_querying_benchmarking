#!/bin/bash

# sort sam files

for sam in ./LR_out/*.sam

do

echo "samtools sort $sam > ${sam%.sam}_sorted.sam"

done > samtools_sort_commands.txt

parallel --jobs 8 --bar {} :::: samtools_sort_commands.txt


# create coverage tsv files from sorted sams

for sorted in ./LR_out/*_sorted.sam

do

echo "samtools coverage $sorted > ${sorted%_sorted.sam}.tsv"

done > samtools_coverage_commants.txt

parallel --jobs 8 --bar {} :::: samtools_coverage_commants.txt

rm samtools_coverage_commants.txt
rm samtools_sort_commands.txt
