files=$1

# please deal with the damn line endings
dos2unix $files

n=`wc -l $files | cut -d' ' -f1`
d="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/"
sbatch --array=1-${n} ${d}sbatch_swan_die.sh $files
