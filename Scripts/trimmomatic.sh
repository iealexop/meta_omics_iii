#trimmomatic

#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 08:00:00
#SBATCH -J trim_RNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user ioannis.alexopoulos.6549@student.uu.se

#identification
cat $0
echo USER=$USER
echo QOS=$SLURM_JOB_QOS
echo JOB=$SLURM_JOBID

#loading
module load bioinfo-tools
module load java
module load trimmomatic

#loop
input_dir="/domus/h1/iealexop/meta_omics_iii/data/RNA_untrimmed"
output_dir="/domus/h1/iealexop/meta_omics_iii/data/RNA_trimmed"

forward_files=$(find "$input_dir" -type f -name "*1.fastq.gz")

for forward_file in $forward_files; do
  file_basename=$(basename "$forward_file" _1.fastq.gz)
  reverse_file="${input_dir}/${file_basename}_2.fastq.gz"
  
  forward_paired_output="${output_dir}/${file_basename}_1_paired_trimmed.fastq.gz"
  forward_unpaired_output="${output_dir}/${file_basename}_1_unpaired_trimmed.fastq.gz"
  reverse_paired_output="${output_dir}/${file_basename}_2_paired_trimmed.fastq.gz"
  reverse_unpaired_output="${output_dir}/${file_basename}_2_unpaired_trimmed.fastq.gz"

  trimmomatic PE -threads 4 -phred33 \
    "${forward_file}" \
    "${reverse_file}" \
    "${forward_paired_output}" \
    "${forward_unpaired_output}" \
    "${reverse_paired_output}" \
    "${reverse_unpaired_output}" \
    ILLUMINACLIP:/sw/bioinfo/trimmomatic/0.39/snowy/adapters/TruSeq3-PE.fa:2:30:10 \
    LEADING:3 \
    TRAILING:3 \
    SLIDINGWINDOW:4:15 \
    MINLEN:36
done
