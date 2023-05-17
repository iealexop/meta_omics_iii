# prokka

#!/bin/bash -l
#SBATCH -A uppmax2023-2-8 -M snowy
#SBATCH -p core
#SBATCH -n 6
#SBATCH -t 16:00:00
#SBATCH -J Prokka
#SBATCH --mail-user ioannis.alexopoulos.6549@student.uu.se
#SBATCH --mail-type=ALL

cat $0
echo USER = $USER
echo QOS = $SLURM_JOB_QOS
echo JOB = $SLURM_JOBID

module load bioinfo-tools
module load prokka/1.45-5b58020

#filepaths
fa_path="/domus/h1/iealexop/meta_omics_iii/data/bins"
out_path="/domus/h1/iealexop/meta_omics_iii/data/annotation"

for dir in ${fa_path}/*assemble; do

  dir_name=$(basename ${dir})
  out_dir="${out_path}/${dir_name}"
  mkdir -p ${out_dir}

  for input_file in ${dir}/*.fa; do

    file_basename=$(basename ${input_file} .fa)
    file_out_dir="${out_dir}/${file_basename}"
    mkdir -p ${file_out_dir}
    prokka --force --outdir ${file_out_dir} --prefix ${file_basename}_anno ${input_file}

  done
done
