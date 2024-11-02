#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 1

## configs 
module purge
module load gcc/9.3.1 mkl/19.0.5 intel/19.0.5 R/4.2.2

## run
Rscript src/blues.R > logs/blues.txt
