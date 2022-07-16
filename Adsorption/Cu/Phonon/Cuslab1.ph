#!/bin/bash
#SBATCH -p long
#SBATCH -C ceph
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=32
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1000


cd "$SLURM_SUBMIT_DIR"

echo running
source /usr/modules/init/bash
module load quantum-espresso
module load openmpi/2.1.6
ulimit -l unlimited
mpirun -np 64 pw.x <Cuslab1.scf.in> Cuslab1.scf.out
mpirun -np 64 ph.x <Cuslab1.ph.in> Cuslab1.ph.out
sleep 30
echo finished
