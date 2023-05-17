# fastqc

#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 08:00:00
#SBATCH -J fastqc
#SBATCH --mail-type=ALL
#SBATCH --mail-user ioannis.alexopoulos.6549@student.uu.se

#identification
cat $0
echo USER=$USER
echo QOS=$SLURM_JOB_QOS
echo JOB=$SLURM_JOBID

#loading
module load bioinfo-tools
module load FastQC

# Replace /path/to/directory with the directory containing your reads.
fastqc /path/to/directory/*.fastq
