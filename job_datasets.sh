#!/bin/bash

#SBATCH --job-name=data
#SBATCH --output=logs/job_datasets.txt
#SBATCH --partition comp06
#SBATCH --nodes=1
#SBATCH --tasks-per-node=8
#SBATCH --time=06:00:00

## configs 
module purge
module load gcc/9.3.1 mkl/19.0.5 R/4.2.2 vcftools/0.1.15 plink/5.2
module load python/anaconda-3.10
source /share/apps/bin/conda-3.10.sh
conda deactivate
conda activate maize_gxe_prediction

## run
## Create BLUEs:
Rscript src/blues.R > logs/blues.txt

## Create all datasets (each fold for each CV):
./run_cv_datasets.sh

## Create a list of individuals to be used:
python3 -u src/create_individuals.py

## Filter VCF and create kinships matrices (you will need `vcftools` and `plink` here):
./run_vcf_filtering.sh
./run_kinships.sh