#!/bin/bash

#SBATCH --job-name=kronec
#SBATCH --output=logs/job_kroneckers.txt
#SBATCH --partition comp06
#SBATCH --nodes=1
#SBATCH --tasks-per-node=32
#SBATCH --time=06:00:00

## configs 
module purge
module load gcc/9.3.1 mkl/19.0.5 R/4.2.2

## run
./run_cv_kroneckers.sh
