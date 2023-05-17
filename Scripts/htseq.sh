# htseq

#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 6
#SBATCH -t 16:00:00
#SBATCH -J HTSeq
#SBATCH --mail-type=ALL
#SBATCH --mail-user ioannis.alexopoulos.6549@student.uu.se

# Load modules
module load bioinfo-tools
module load htseq/2.0.2

# Input Paths
Annotation_base_27="/domus/h1/iealexop/meta_omics_iii/data/annotation/SRR4342129_assemble/"
Annotation_base_33="/domus/h1/iealexop/meta_omics_iii/data/annotation/SRR4342133_assemble/"
Alignment_27="/domus/h1/iealexop/meta_omics_iii/analyses/006_mapping/D1/"
Alignment_33="/domus/h1/iealexop/meta_omics_iii/analyses/006_mapping/D3/"

# preprocessing
for dir in ${Annotation_base_27}final.contigs_bin.*; do
  for file in $dir/*.gff; do
  newfile="./proc_anno_27/$(basename $file)"
  sed '/^##FASTA/Q' $file > $newfile
  done
done

for dir in ${Annotation_base_33}final.contigs_bin.*; do
  for file in $dir/*.gff; do
  newfile="./proc_anno_33/$(basename $file)"
  sed '/^##FASTA/Q' $file > $newfile
  done
done

# for htseq
output_dir_27="/domus/h1/iealexop/meta_omics_iii/analyses/007_exp_quantification/D1/"
output_dir_33="/domus/h1/iealexop/meta_omics_iii/analyses/007_exp_quantification/D3/"

# Processing of each .bam file with corresponding .gff file
for i in {1..27}; do
  for bamfile in ${Alignment_27}map_D1_bin_final.contigs_bin.${i}.fa.bam; do
    gfffile=./proc_anno_27/final.contigs_bin.${i}_anno.gff
    outputfile=${output_dir_27}$(basename ${bamfile%.bam}_counts.txt)
      htseq-count --format=bam --order=pos --idattr=ID --type=CDS $bamfile $gfffile > $outputfile
  done
done

for i in {1..33}; do
  for bamfile in ${Alignment_33}map_D3_bin_final.contigs_bin.${i}.fa.bam; do
    gfffile=./proc_anno_33/final.contigs_bin.${i}_anno.gff
    outputfile=${output_dir_33}$(basename ${bamfile%.bam}_counts.txt)
      htseq-count --format=bam --order=pos --idattr=ID --type=CDS $bamfile $gfffile > $outputfile
  done
done
