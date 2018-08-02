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
  minia:
    run: minia_core.cwl
    in:
      fastq: fastq
    out:
      - minia_contigs
  rename:
    run: move.cwl
    in:
      infile: minia/minia_contigs
      outfile:
        valueFrom: "contigs.fa"
    out:
      - out
