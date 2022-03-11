#!/bin/bash
#SBATCH --job-name=swan_die
#SBATCH -n 16
#SBATCH -A SEYEDAM_LAB
#SBATCH -o processing/%x.o%A_%a
#SBATCH -e processing/%x.e%A_%a
#SBATCH --partition=standard
#SBATCH --time=7-0
#SBATCH --mail-type=START,END
#SBATCH --mem=64G

# input tab-separated file with 
# swangraph \t column \t cond1 \t cond2 \t test \t ofname
ifile=$1

# extract PBID
i=$SLURM_ARRAY_TASK_ID
sg=`head -${i} $ifile | tail -1 | cut -f1`
col=`head -${i} $ifile | tail -1 | cut -f2`
cond1=`head -${i} $ifile | tail -1 | cut -f3`
cond2=`head -${i} $ifile | tail -1 | cut -f4`
test=`head -${i} $ifile | tail -1 | cut -f5`
fname=`head -${i} $ifile | tail -1 | cut -f6`

# make directories
d=/data/homezvol1/kmcarval/220310_hl60/die/

python ${d}swan_die.py $sg $col $cond1 $cond2 $test $fname
