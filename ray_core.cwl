cwlVersion: cwl:v1.0
class: CommandLineTool
hints:
 DockerRequirement:
   dockerImageId: "bioboxes/ray_cwl"
   dockerFile: |
     FROM bioboxes/ray:latest
     ENV TMPDIR ~/tmp
     ENTRYPOINT []
inputs:
 fastq:
   type: File[]
   label: interleaved & gzipped fasta/q paired-end files
   inputBinding:
     prefix: -i
     itemSeparator: ' -i '
baseCommand: mpiexec

arguments:  # many of these could be turned into configurable inputs
 - prefix: Ray
   valueFrom: ''
 - prefix: -o
   valueFrom: $(runtime.outdir)/output
 - prefix: -n
   valueFrom: $(runtime.cores)
 - prefix: -k
   valueFrom: "31"

outputs:
  ray_contigs:
    type: File
    format: edam:format_1929  # FASTA
    outputBinding:
      glob: 'output/Contigs.fasta'
