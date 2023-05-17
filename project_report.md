# Paper #3 - Genome Analysis - 2023
Note: Throughout all steps, sequences from D1 and D3 were analysed seperately, in parallel.

### Dataset
This analysis uses a subset of the data obtained and analysed in the original study (Thrash et al., 2017). Specifically, it consists of 2 sets of metagenomic sequences, SRR4342129 sampled from D1 (oxic conditions), and SRR4342133 sampled from D3 (hypoxic conditions), as well as 2 sets of metatranscriptomic sequences, SRR4342137 from D1 and SRR4342139 from D3.
DNA sequences had already undergone trimming, RNA sequences were provided untrimmed.
All sequences were generated with Illumina Paired End sequencing methods, using  TruSeq3-PE adapters.

### Quality Control
FastQC was used to assess the quality of sequencing data. Untrimmed RNA reads were expectedly flagged as being low quality, with issues such as the sequencing adapters still being present, which have do be addressed with trimming.
The already trimmed DNA reads scored well overall, deemed acceptable for further analysis.


### Trimming
Trimmomatic was used to trim "raw" sequencing reads, removing adapters, low quality reads  and other elements that would pose problems during this analysis.
After trimming, the metatrascriptomic reads were used as inputs to FastQC, validating that trimming was successful and that the trimmed RNA reads are acceptable for further analysis.

### Metagenomic assembly
Megahit was used to generate contigs out of the trimmed DNA reads, using DeBruijn-graph-based algorithms.
Contigs with lengths less than 200 bases were discarded.

### Binning
MetaBAT was used to group contigs that likely belong to the same taxon, forming bins.
SRR4342129 (D1) produced 27 bins, while SRR4342133 produced 33 bins.

### Bin quality assessment
CheckM was used to assess the quality of the bins, determining the existance of contaminated or incomplete bins, among others.
For D1:
- Bins 8, 15, 20 were of high quality
- Bins 2, 11, 12 were complete but also contaminated
- Bins 7, 13, 21 were marked as incomplete.
- Bin 17 was problematic, with very high contamination value.
For D3:
- Bins 1, 3, 4, 23 were of high quality
- Bins 10, 11, 15, 24 were complete but also contaminated
- Bins 7, 13, 31 were marked as incomplete.
- Bins 6, 8, 16, 17, 20, 26, 33 were problematic, with very high contamination value.

### Annotation
Prokka was used to identify ORFs and annotate gene loci for each bin.

### Phylogeny
Phylophlan was used to construct phylogenetic trees out of metagenomic-assembled genomes, using marker genes from the .faa protein fasta files generated through prokka.

### Mapping
BWA was used to map the RNA reads to the metagenomic-assembled genomes.
Notably, outputs for all bins indicate a very small percentage of total RNAs present for each bin.

### Quantification of expression
HTSeq was used to count how many times each RNA read alignes with each corresponding gene for each bin.
Ideally, this information would be used downstream to answer questions regarding the metabolic contribution of taxa identified during this analysis.
