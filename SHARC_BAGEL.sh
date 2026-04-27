#!/bin/bash
#SBATCH -J "sharc_test" # name of job in SLURM
#SBATCH --account=p853-24-3 # project number
#SBATCH --partition=testing       # selected partition (short, medium, long)
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=4
#SBATCH -o stdout.%J.out    # standard output
#SBATCH -e stderr.%J.out    # error output

export MODULEPATH=/storage-apps/easybuild-soft/modules/all
#Tu pojde cesta k bagelu
module load intel/2025a
module load Boost/1.88.0-GCC-14.2.0
export BAGEL_NUM_THREADS=8
module load Python/3

source /path/to/the/directory/bin/activate

module load sharc4/4.0.1

## conda init - zistit, ze co robí toto

conda activate /storage-apps/software/conda-envs/sharc4.0/

USERSCR=`pwd`  ### HOME folder, output
SCRATCH=/scratch/$SLURM_JOB_ACCOUNT/$SLURM_JOB_ID

$SHARC/sharc.x input
