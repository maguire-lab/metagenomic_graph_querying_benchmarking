#!/usr/bin/env nextflow
// nextflow pipline to run bandage_blast allowing for the nextflow built in measurement of computational resources

// establish input parameters, need the graphs and the card data in .fasta format

params.graph = "/home/david/dm-lab/graph_searching_sarand/graphs/*100*.gfa"
params.card = "/home/david/dm-lab/graph_searching_sarand/card_protein_homolog_with_fam.fasta"

Channel
    .fromPath(params.graph)
    .map { tuple(it.baseName, it) }
    .set { graph }

// establish out directory
params.outdir = "${workflow.launchDir}/final_results"

process bandage_blast {
    //maxForks 1
    conda "/home/david/dm-lab/graph_searching_sarand/bandage_blast/bandage.yml"

    tag "${graphID}"

    publishDir "$params.outdir/", mode: 'copy', pattern: '*.tsv'

    input:
    tuple val(graphID), path(graph)
    path card

    output:
    path('*.tsv')

    script:
    """
    Bandage querypaths $graph $card "${graph.baseName}_bandage"
    """
}

workflow {
    bandage_blast(graph, params.card)
}