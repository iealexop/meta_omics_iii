# meta_omics_iii
Metagenomic &amp; metatrascriptomic analysis of bacterioplanton samples



### Step-by-step

- FastQC for reading quality control -> https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
- Trimmomatic for Reads preprocessing -> http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf
- Canu / SOAPdenovo / Spades / Megahit (THIS IS FOR LARGE AND COMPLEX METAGONIMICS NGS READS)/ Pilon,, RepatMasker, Trinity... all for DNA assembly -> https://github.com/voutcn/megahit
- QUAST / MUMmerplot for assembly evaluation -> http://quast.sourceforge.net/docs/manual.html
- Metbat for binning -> https://bitbucket.org/berkeleylab/metabat/wiki/Home
- CheckM for binning evaluation -> https://github.com/Ecogenomics/CheckM/wiki/Quick-Start
- Prokka / BRAKER / EggNOGmapper for annotation - https://github.com/Gaius-Augustus/BRAKER#running-braker
- Blastn for homology check -> https://www.ncbi.nlm.nih.gov/books/NBK279690/
- Phylophlan for phylogenetic placement 
- BWA / STAR for Mapping -> http://bio-bwa.sourceforge.net/bwa.shtml
- SAMtools / BCFtools for post-mapping analyses
- HTSeq for read counting -> https://htseq.readthedocs.io/en/release_0.9.1/count.html#count
- DESeq2 for expression analyses -> https://bioc.ism.ac.jp/packages/2.14/bioc/vignettes/DESeq2/inst/doc/beginner.pdf
- IGV / Artemis Comparison Tool (ACT) for visualization of the genomes -> http://software.broadinstitute.org/software/igv/userguide

