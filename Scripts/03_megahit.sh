# megahit

#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J megahit_DNA_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user ioannis.alexopoulos.6549@student.uu.se

#identification
cat $0
echo USER=$USER
echo QOS=$SLURM_JOB_QOS
echo JOB=$SLURM_JOBID

#loading
module load bioinfo-tools
module load megahit

#loop
input_dir="/domus/h1/iealexop/meta_omics_iii/data/DNA_trimmed"
output_dir="/domus/h1/iealexop/meta_omics_iii/data/DNA_assemble"

for forward_file in "${input_dir}"/*_1.paired.trimmed.fastq.gz; do
  file_basename=$(basename "$forward_file" _1.paired.trimmed.fastq.gz)
  reverse_file="${input_dir}/${file_basename}_2.paired.trimmed.fastq.gz"
  output_file="${output_dir}/${file_basename}_assemble"
  
  #megahit, paired end
  megahit -1 "${forward_file}" -2 "${reverse_file}" -o "${output_file}" --kmin-1pass
done
