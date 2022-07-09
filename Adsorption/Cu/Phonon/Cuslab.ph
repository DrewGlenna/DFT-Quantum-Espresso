#!/bin/bash
#SBATCH -p long
#SBATCH -C ceph
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --cpus-per-task=1


cd "$SLURM_SUBMIT_DIR"

echo running
source /usr/modules/init/bash
module load quantum-espresso
module load openmpi/2.1.6
ulimit -l unlimited
mpirun -np 24 pw.x <Cuslab.scf.in> Cuslab.scf.out
mpirun -np 24 ph.x <Cuslab.ph.in> Cuslab.ph.out
sleep 30
echo finished
