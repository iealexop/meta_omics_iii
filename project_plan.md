# Purpose of the Study

This study aims to understand the metabolic contributions from uncultivated groups in the nGOM during periods characterized by low amounts of Dissolved Oxygen (DO). Data used in this study corresponds to sampling from Oxic (D1) and Hypoxic (D3) environment and consists of both metagenomic and metatranscriptomic data.

## Analysis Summary

1. Quality control: Trimmed DNA sequences.
2. Trimming of RNA sequences.
3. Quality control: Trimmed RNA sequences.
4. Assembly: Trimmed metagenomic (DNA) data into contigs.
5. Binning: Group contigs that likely originate from the same species.
6. Completeness & quality assessment of the assembled genomes.
7. Annotation of the assemblies, identifying functionality of genome loci.
8. Phylogenetic analysis: Construct phylogenety out of the assembled taxa.
9. Mapping of RNAseq reads to the assembled genomes.
10. Expression quantification: Determine the number of reads per gene for each assembled genome.

## Software

- FastQC
- Trimmomatic
- Megahit
- Metabat
- CheckM
- Prokka
- Phylophlan
- BWA
- SAMtools / BCFtools
- HTseq


## Estimated Duration of each step

- FastQC - 15 min
- Trimmomatic - Varies
- Megahit - 8 hrs
- Metabat - 30 min 
- CheckM - 2 hrs
- Prokka - 1 hr
- PhyloPhlan - 8 hrs
- BWA - 4-6 hrs
- Htseq - 1 hr

## Directory Structure

```
meta_omics_iii/
|
|---analyses/
|   |---001_preprocessing/
|   |---002_assembly/
|   |---003_binning/
|   |---004_annotation/
|   |---005_phylogeny/
|   |---006_mapping/
|   |---007_exp_quantification/
|
|---data/
    |---DNA_trimmed -> /proj/genomeanalysis2023/Genome_Analysis/3_Thrash_2017/DNA_trimmed/
    |---RNA_untrimmed ->  /proj/genomeanalysis2023/Genome_Analysis/3_Thrash_2017/RNA_untrimmed/
    |---RNA_trimmed/
    |---DNA_assemble/
    |---bins/
    |---annotation/
```
