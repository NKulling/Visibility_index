#!/bin/sh
#SBATCH --job-name=visibility
#SBATCH --error=visibility_error.e%j
#SBATCH --output=visibility_out.o%j
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --partition=public-cpu
#SBATCH --time=01-12:00:00
#SBATCH --mem-per-cpu=5G 

module load GCC/10.2.0  
module load OpenMPI/4.0.5
module load GDAL/3.2.1
module load PROJ/7.2.1
module load R/4.0.4

srun Rscript  $HOME/.../visibility_index.R

