#!/usr/bin/env nextflow
// nextflow pipeline to run bifrost with modified search.tcc to extract unitigs containing the match from the unitig map data structure

// establish input parameters, need the graphs with headers and the card data in .fasta format

params.graph = "/home/david/dm-lab/graph_searching_sarand/graphs/*100*.gfa"
params.card = "/home/david/dm-lab/graph_searching_sarand/card_protein_homolog_with_fam.fasta"

Channel
    .fromPath(params.graph)
    .map { tuple(it.baseName, it) }
    .set { graph }

// establish out directory
params.outdir = "${workflow.launchDir}/final_results"

process bifrost {
    //maxForks 1
    tag "${graphID}"
    
    publishDir "$params.outdir/", mode: 'copy'

    input:
    tuple val(graphID), path(graph)
    path card

    output:
    path('*.csv'), emit: unitigs
    path('*.tsv'), emit: ID

    script:
    """
    Bifrost query -g $graph -q $card -o ${graphID}_bifrost_kmer_ratio -P -v | grep "," | uniq > ${graphID}_bifrost_unitigs.csv
    """
}

workflow {
    bifrost(graph, params.card)
}

    