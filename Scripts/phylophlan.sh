# Phylophlan

#!/bin/bash -l
#SBATCH -A uppmax2023-2-8 -M snowy
#SBATCH -p core
#SBATCH -n 6
#SBATCH -t 16:00:00
#SBATCH -J Phylophlan
#SBATCH --mail-user ioannis.alexopoulos.6549@student.uu.se
#SBATCH --mail-type=ALL

cat $0
echo USER = $USER
echo QOS = $SLURM_JOB_QOS
echo JOB = $SLURM_JOBID

source ~/.bashrc

# Loading modules
module load conda
export CONDA_ENVS_PATH=/domus/h1/iealexop/meta_omics_iii/envs

source activate phylophlan

# Create variables
outdir=/domus/h1/iealexop/meta_omics_iii/analyses/005_phylogeny
configs=/domus/h1/iealexop/meta_omics_iii/envs/configs
annotation=/domus/h1/iealexop/meta_omics_iii/data/annotation

cd $outdir

# Full paths of the assembly directories
assembly1_path=$annotation/SRR4342129_assemble
assembly2_path=$annotation/SRR4342133_assemble

# Base names of the assembly directories
assembly1_basename=$(basename $assembly1_path)
assembly2_basename=$(basename $assembly2_path)

# Symlinks input data files

# Assembly 1
for bin in $assembly1_path/*;
do 
  for file in ${bin}/*.faa; do
    ln -sf $file $outdir/input/metagenome/$assembly1_basename
  done
done

# Assembly 2
for bin in $assembly2_path/*;
do
  for file in ${bin}/*.faa; do
    ln -sf $file $outdir/input/metagenome/$assembly2_basename
  done
done

# Check that the configuration directory exists
if [ -d "/domus/h1/iealexop/meta_omics_iii/envs/phylophlan/lib/python3.11/site-packages/phylophlan/phylophlan_configs/" ]; then
    echo "The configuration directory exists."
else
    echo "The configuration directory does not exist!"
fi

# Run PhyloPhlAn with each temporary directory as input
phylophlan -i input/metagenome/$assembly1_basename -d phylophlan --diversity high -f $configs/supermatrix_aa.cfg -o $outdir/$assembly1_basename
phylophlan -i input/metagenome/$assembly2_basename -d phylophlan --diversity high -f $configs/supermatrix_aa.cfg -o $outdir/$assembly2_basename
