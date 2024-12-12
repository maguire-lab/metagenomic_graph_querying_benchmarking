// mmseqs module adapted from graphamr

process MMSEQS_DB {
    maxForks 1
    conda "/home/david/dm-lab/graph_searching_sarand/pathracer/pathracer.yml"

    tag "${graphID}"

    input:
    tuple val(graphID), path(fasta)
    
    output:
    tuple val(graphID), path('mmseq_db'), emit: mmseqs_db

    script:
    """
    mmseqs createdb ${fasta} ${graphID}.db --dbtype 2
    mkdir mmseq_db && mv ${graphID}.db* mmseq_db
    """
}

process MMSEQS_EXTRACT_ORFS {
    maxForks 1
    conda "/home/david/dm-lab/graph_searching_sarand/pathracer/pathracer.yml"

    tag "${graphID}"

    input:
    tuple val(graphID), path(mmseqs_db)

    output:
    tuple val(graphID), path('*.fasta'), emit: orfs

    script:
    """
    mmseqs extractorfs ${mmseqs_db}/*.db mmseqs.orf.db
    mmseqs convert2fasta mmseqs.orf.db ${graphID}.fasta
    """
}

process MMSEQS_CLUSTER {
    maxForks 1
    conda "/home/david/dm-lab/graph_searching_sarand/pathracer/pathracer.yml"

    tag "${graphID}"

    input:
    tuple val(graphID), path(orfs)

    output:
    tuple val(graphID), path('orfs_rep_seq.fasta'), emit: orfs_rep_seq

    publishDir "$params.outdir/pathracer_results/$graphID", mode: 'copy'

    script:
    """
    mmseqs easy-linclust ${orfs} orfs tmp --min-seq-id 0.9
    """
}