#!/usr/bin/env cwl-runner

class: CommandLineTool
id: "BAMStats"
label: "BAMStats tool"
cwlVersion: v1.0
doc: |
    ![build_status](https://quay.io/repository/pvanheus/dockstore-tool-bamstats/status)
    A Docker container for the BAMStats command. See the [BAMStats](http://bamstats.sourceforge.net/) website for more information.

dct:creator:
  "@id": "http://orcid.org/0000-0001-6553-5274"
  foaf:name: Peter van Heusden
  foaf:mbox: "mailto:pvh@sanbi.ac.za"

requirements:
  - class: DockerRequirement
    dockerPull: "quay.io/pvanheus/dockstore-tool-bamstats:1.25-3"

hints:
  - class: ResourceRequirement
    coresMin: 1
    ramMin: 4092 #"the process requires at least 4G of RAM
    outdirMin: 512000

inputs:
  mem_gb:
    type: int
    default: 4
    doc: "The memory, in GB, for the reporting tool"
    inputBinding:
      position: 1

  bam_input:
    type: File
    doc: "The BAM file used as input, it must be sorted."
    format: "http://edamontology.org/format_2572"
    inputBinding:
      position: 2

outputs:
  bamstats_report:
    type: File
    format: "http://edamontology.org/format_3615"
    outputBinding:
      glob: bamstats_report.zip
    doc: "A zip file that contains the HTML report and various graphics."


baseCommand: ["bash", "/usr/local/bin/bamstats"]
