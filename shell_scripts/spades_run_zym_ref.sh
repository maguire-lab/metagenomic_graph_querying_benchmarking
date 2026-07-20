for f in ../isolate_reads/*_1.fastq

do

echo "Assembling the following genome/metagenome:"
echo "$f"
echo "${f%_1.fastq}_2.fastq"

#use --meta for metagenomes, --isolate for single genomes
spades.py \
    --isolate \
    -o metaspades_out/${f%_1.fastq} \
    -1 ${f%} \
    -2 ${f%_1.fastq}_2.fastq

done
