#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 1

## configs 
module purge
module load gcc/7.5.0

## run
Rscript src/bluesINA.R > logs/blues.txt
