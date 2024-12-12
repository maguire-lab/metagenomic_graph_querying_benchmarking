#!/usr/bin/env nextflow
// nextflow pipline to run minigraph allowing for the nextflow built in measurement of computational resources

// establish input parameters, need the graphs and the card data in .fasta format

// graphs must be redundancy free, note that spades graphs do have redundancy
params.graph = "/home/david/dm-lab/graph_searching_sarand/graphs/*100*.gfa"
params.card = "/home/david/dm-lab/graph_searching_sarand/card_protein_homolog_with_fam.fasta"

Channel
    .fromPath(params.graph)
    .map { tuple(it.baseName, it) }
    .set { graph }

// establish out directory
params.outdir = "${workflow.launchDir}/final_results_testing"

// Trim spades graphs to remove redundancy

process trimGraph {
    //maxForks 1

    tag "${graphID}"

    input:
    tuple val(graphID), path(graph)

    output:
    tuple val(graphID), path('*maybe.gfa'), emit: trimmed_graphs

    script:
    if (graphID.contains("SR")) 
        // remove paths from spades graphs then trim overlaps with unicycler functions
        """
        grep -v "^P" $graph > ${graphID}_no_P.gfa
        python -m unicycler.remove_overlaps ${graphID}_no_P.gfa
        """
    else
        // emit the graph as is
        """
        mv $graph ${graphID}_maybe.gfa
        """
}

process minigraph {
    //maxForks 1

    tag "${graphID}"

    publishDir "$params.outdir/", mode: 'copy', pattern : '*.gaf'

    input:
    tuple val(graphID), path(trimmed_graphs)
    path card

    output:
    path('*.gaf'), emit: align

    script:
    """
    /home/david/dm-lab/graph_searching_sarand/minigraph/minigraph/minigraph $trimmed_graphs $card > ${graphID}_minigraph.gaf
    """
}

workflow {
    trimGraph(graph)
    minigraph(trimGraph.out.trimmed_graphs, params.card)
}