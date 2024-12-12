// module adapted from graphamr


process RGI {
    maxForks 1
    conda "/home/david/dm-lab/graph_searching_sarand/pathracer/pathracer.yml"

    publishDir "$params.outdir/pathracer_results/$graphID/rgi_output", mode: 'move', pattern: '*.txt'

    tag "${graphID}"

    input:
    tuple val(graphID), path(orfs_rep_seq)

    output:
    tuple val(graphID), path('*.json'), emit: json
    tuple val(graphID), path('*.txt'), emit: txt

    script:
    """
    rgi main -i $orfs_rep_seq -o ${graphID} --clean --alignment_tool DIAMOND --input_type contig
    """
}

