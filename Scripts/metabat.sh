# metabat

#!/bin/bash -l
#SBATCH -A uppmax2023-2-8 -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 16:00:00
#SBATCH -J MetaBAT
#SBATCH --mail-user ioannis.alexopoulos.6549@student.uu.se
#SBATCH --mail-type=ALL

cat $0
echo USER = $USER
echo QOS = $SLURM_JOB_QOS
echo JOB = $SLURM_JOBID

module load bioinfo-tools
module load MetaBat/2.12.1

#filepaths
fa_path=/domus/h1/iealexop/meta_omics_iii/data/DNA_assemble/
out_path=/domus/h1/iealexop/meta_omics_iii/analyses/003_binning/bins

# Running metaBAT
for dir in "${fa_path}"*_assemble; do
  input_folder="${dir}"
  output_folder="${out_path}/$(basename ${dir})"
  mkdir -p "${output_folder}"
  for fasta_file in "${input_folder}"/*.fa; do
    metabat2 -i "${fasta_file}" -o "${output_folder}/$(basename ${fasta_file%.*})_bin" -v
  done
done

# $(basename ${fasta_file%.*})_bin - create a new output file name based on the input fasta file's name, while removing the file extension and adding a _bin suffix
