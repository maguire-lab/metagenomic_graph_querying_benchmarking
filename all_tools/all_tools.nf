#!/usr/bin/env nextflow

// this nextflow pipline runs all graph querying tools for the set of input graphs. No computational resouce information is collected. 

// establish input parameters, need the graphs and the card data in .fasta and .hmm format
// be sure graphs have headers for bifrost

params.graph = "/home/david/dm-lab/graph_searching_sarand/graphs/*5*.gfa"
params.card = "/home/david/dm-lab/graph_searching_sarand/card_protein_homolog_with_fam.fasta"
params.hmm = "/home/david/dm-lab/graph_searching_sarand/hmm/card_phm_family.hmm"

Channel
    .fromPath(params.graph)
    .map { tuple(it.baseName, it) }
    .set { graph }

// establish out directory

params.outdir = "${workflow.launchDir}/final_results"

// outline workflow

include {bandage_blast} from '../bandage_blast/bandage.nf'
include {bifrost} from '../bifrost/bi-flow/uni-bifrost.nf'
include {graphaligner} from '../aligner_graph/graphaligner.nf'
include {trimGraph; minigraph} from '../minigraph/minigraph.nf'
include {PATHRACER} from '../pathracer/pathracer.nf'
include {MMSEQS_DB; MMSEQS_EXTRACT_ORFS; MMSEQS_CLUSTER} from '../pathracer/modules/mmseqs'
include {RGI} from '../pathracer/modules/rgi'
include {spaliner} from '../spaliner/spaliner.nf'


workflow {
    bandage_blast(graph, params.card)
    bifrost(graph, params.card)
    graphaligner(graph, params.card)
    trimGraph(graph)
    minigraph(trimGraph.out.trimmed_graphs, params.card)
    PATHRACER(params.hmm, graph)
    MMSEQS_DB(PATHRACER.out.fasta) | MMSEQS_EXTRACT_ORFS | MMSEQS_CLUSTER
    RGI(MMSEQS_CLUSTER.out.orfs_rep_seq)
    spaliner(graph, params.card)
}