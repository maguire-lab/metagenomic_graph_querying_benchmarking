#!/usr/bin/env nextflow
// nextflow pipline to run graphaligner allowing for the nextflow built in measurement of computational resources

// establish input parameters, need the graphs and the card data in .fasta format

params.graph = "/home/david/dm-lab/graph_searching_sarand/graphs/*100*.gfa"
params.card = "/home/david/dm-lab/graph_searching_sarand/card_protein_homolog_with_fam.fasta"

Channel
    .fromPath(params.graph)
    .map { tuple(it.baseName, it) }
    .set { graph }

// establish out directory
params.outdir = "${workflow.launchDir}/final_results"

process graphaligner {
    //maxForks 1
    conda "/home/david/dm-lab/graph_searching_sarand/aligner_graph/graphaligner.yml"

    tag "${graphID}"

    publishDir "$params.outdir/", mode: 'copy', pattern : '*.gaf'

    input:
    tuple val(graphID), path(graph)
    path card

    output:
    path('*.gaf'), emit: align

    script:
    """
    GraphAligner -g $graph -f $card -a ${graphID}_GA_.gaf -x dbg
    """
}

workflow {
    graphaligner(graph, params.card)
}