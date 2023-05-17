# bwa & samtools

#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 6
#SBATCH -t 16:00:00
#SBATCH -J BWA_mapping
#SBATCH --mail-type=ALL
#SBATCH --mail-user ioannis.alexopoulos.6549@student.uu.se

# Load modules
module load bioinfo-tools
module load bwa/0.7.17
module load samtools/1.14

# Commands
DNA_29="/domus/h1/iealexop/meta_omics_iii/data/bins/SRR4342129_assemble"
DNA_33="/domus/h1/iealexop/meta_omics_iii/data/bins/SRR4342133_assemble"
RNA="/domus/h1/iealexop/meta_omics_iii/data/RNA_trimmed"

# D1
for fasta in $DNA_29/*.fa; do
bname=$(basename $fasta)
bwa index $fasta
bwa mem -t 6 \
$fasta \
$RNA/SRR4342137.1_paired_trimmed.fastq.gz \
$RNA/SRR4342137.2_paired_trimmed.fastq.gz \
| samtools view -b - | samtools sort -o map_D1_bin_$bname.bam -
samtools index map_D1_bin_$bname.bam
samtools idxstats map_D1_bin_$bname.bam > map_D1_bin_$bname.stats

done

# D3
for fasta in $DNA_33/*.fa; do
bname=$(basename $fasta)
bwa index $fasta
bwa mem -t 6 \
$fasta \
$RNA/SRR4342139.1_paired_trimmed.fastq.gz \
$RNA/SRR4342139.2_paired_trimmed.fastq.gz \
| samtools view -b - | samtools sort -o map_D3_bin_$bname.bam -
samtools index map_D3_bin_$bname.bam
samtools idxstats map_D3_bin_$bname.bam > map_D3_bin_$bname.stats

done
