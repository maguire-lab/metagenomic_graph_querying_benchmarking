#!/usr/bin/env nextflow
// This nextflow pipline to run pathracer  

// establish input channels. pathracer needs both the hmm and the graph
// for testing this will be paths directly to the hmm and graph; when done testing this will need to be a list of paths to all hmms 
params.hmm = "/home/david/dm-lab/graph_searching_sarand/hmm/card_phm_family.hmm"
params.graph = "/home/david/dm-lab/graph_searching_sarand/graphs/*100*.gfa"

Channel
    .fromPath(params.hmm)

// establish a value channel for graph ids from graph.baseName
Channel
    .fromPath(params.graph)
    .map { tuple(it.baseName, it) }
    .set { graph }

// establish out directory
params.outdir = "${workflow.launchDir}/final_results"

// set graph.baseName as a value to be used in the publishDir

process PATHRACER {
    maxForks 4
    conda "/home/david/dm-lab/graph_searching_sarand/pathracer/pathracer.yml"
    publishDir "$params.outdir/pathracer_results/$graphID", mode: 'copy', pattern: '*.fasta'
    publishDir "$params.outdir/pathracer_results/$graphID/alignments_pathracer", mode: 'move', pattern: '*.seqs.fa'
    
    tag "${graphID}"

    input:
    path hmm
    tuple val(graphID), path(graph)

    output:
    tuple val(graphID), path('*.seqs.fa'), emit: align 
    tuple val(graphID), path('*.fasta'), emit: fasta

    script:

    """
    pathracer $hmm $graph --output ./ --rescore -m 475
    mv all.edges.fa ${graphID}.fasta
    """

}

include { MMSEQS_DB; MMSEQS_EXTRACT_ORFS; MMSEQS_CLUSTER } from './modules/mmseqs'
include {RGI} from './modules/rgi'
workflow {
    PATHRACER(params.hmm, graph)
    MMSEQS_DB(PATHRACER.out.fasta) | MMSEQS_EXTRACT_ORFS | MMSEQS_CLUSTER
    RGI(MMSEQS_CLUSTER.out.orfs_rep_seq)
}