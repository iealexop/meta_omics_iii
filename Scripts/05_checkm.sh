# checkm

#!/bin/bash -l
#SBATCH -A uppmax2023-2-8 -M snowy
#SBATCH -p core
#SBATCH -n 6
#SBATCH -t 16:00:00
#SBATCH -J CheckM
#SBATCH --mail-user ioannis.alexopoulos.6549@student.uu.se
#SBATCH --mail-type=ALL

cat $0
echo USER = $USER
echo QOS = $SLURM_JOB_QOS
echo JOB = $SLURM_JOBID

module load bioinfo-tools
module load CheckM/1.1.3

# Set the CheckM data directory
checkm data setRoot /domus/h1/iealexop/meta_omics_iii/2015_01_16

#filepaths
fa_path="/domus/h1/iealexop/meta_omics_iii/data/bins"
out_path="/domus/h1/iealexop/meta_omics_iii/analyses/003_binning/checkm"

# Running CheckM
dirs_to_process=$(find "${fa_path}" -type d -name "*_assemble")
for dir in ${dirs_to_process}; do
  input_folder="${dir}"
  output_folder="${out_path}/$(basename ${dir})"
  checkm lineage_wf --reduced_tree --threads $SLURM_JOB_CPUS_PER_NODE --tab_table -x fa "${input_folder}" "${output_folder}"
done
