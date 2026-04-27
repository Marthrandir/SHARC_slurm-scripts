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
module load ORCA/6.0.0-OpenMPI-4.1.6

module load Python/3
source /home/martin99/Postprocessing_Tools/SHARC_Dependencies/bin/activate

module load sharc4/4.0.1

conda init

conda activate /storage-apps/software/conda-envs/sharc4.0/

USERSCR=`pwd`  ### HOME folder, output
SCRATCH=/scratch/$SLURM_JOB_ACCOUNT/$SLURM_JOB_ID

$SHARC/sharc.x input
