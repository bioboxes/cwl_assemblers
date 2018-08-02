cwlVersion: cwl:v1.0
class: Workflow
requirements:
  - class: StepInputExpressionRequirement
inputs:
  fastq:
    type: File[]
outputs:
  result:
    type: File
    outputSource: rename/out
steps:
  ray:
    run: ray_core.cwl
    in:
      fastq: fastq
    out:
      - ray_contigs
  rename:
    run: move.cwl
    in:
      infile: ray/ray_contigs
      outfile:
        valueFrom: "contigs.fa"
    out:
      - out
