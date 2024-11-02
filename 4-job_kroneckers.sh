#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 1

## configs 
module purge
module load gcc/9.3.1 mkl/19.0.5 R/4.2.2

## create Kronecker products between environmental and genomic relationship matrices
debug=FALSE
for cv in {0..2}
do 
    echo "CV=${cv}"
    for kinship in additive dominant
    do 
        Rscript src/kronecker.R $cv $debug $kinship > "logs/kronecker_${kinship}_cv${cv}.txt" &&
        echo "[Kronecker] ${kinship}"
    done
done
