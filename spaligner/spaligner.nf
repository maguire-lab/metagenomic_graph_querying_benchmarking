#!/usr/bin/env nextflow
// nextflow pipline to run spaligner allowing for the nextflow built in measurement of computational resources

// establish input parameters, need the graphs and the card data in .fasta format

params.graph = "/home/david/dm-lab/graph_searching_sarand/graphs/*100*.gfa"
params.card = "${workflow.launchDir}/card_protein_homolog_with_fam.fastq"

Channel
    .fromPath(params.graph)
    .map { tuple(it.baseName, it) }
    .set { graph }

// establish out directory
params.outdir = "${workflow.launchDir}/final_results"

process spaligner {
    //maxForks 1
    publishDir "$params.outdir/", mode: 'copy', pattern : '*.tsv'

    tag "${graphID}"

    input:
    tuple val(graphID), path(graph)
    path card

    output:
    path('*.tsv'), emit: align

    script:
    """
    /home/david/dm-lab/graph_searching_sarand/spaligner/spades/assembler/build/bin/spaligner /home/david/dm-lab/graph_searching_sarand/spaligner/spaligner_config.yaml -d nanopore -g $graph -s $card -k 55 -o ./
    mv alignment.tsv ${graphID}_spaligner.tsv
    """
}

workflow {
    spaligner(graph, params.card)
}