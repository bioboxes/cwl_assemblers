cwlVersion: cwl:v1.0
class: CommandLineTool
hints:
    DockerRequirement:
        dockerImageId: "bioboxes/minia_cwl"
        dockerFile: |
            FROM bioboxes/minia:latest
            ENTRYPOINT []
inputs:
    fastq:
        type: File[]
        label: interleaved & gzipped fasta/q paired-end files
        inputBinding:
            position: 1
baseCommand: minia

arguments: # make these configurable?
    - valueFrom: "31"
      position: 2
    - valueFrom: "3"
      position: 3
    - valueFrom: "5000000"
      position: 4
    - valueFrom: $(runtime.outdir)/output
      position: 5

outputs:
    minia_contigs:
        type: File
        format: edam:format_1929
        outputBinding:
            glob: 'output.contigs.fa'
