# Load environment for FHI-AIMS

export OMP_NUM_THREADS=1    # Disable hyperthreading
source /apps/intel2018/compilers_and_libraries/linux/mpi/intel64/bin/mpivars.sh # load intel compiler
source /apps/intel2018/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64 # load intel compiler
ulimit -s unlimited # no restriction on number of files and their sizes

# run FHI-AIMS
mpirun -n 4 /apps/fhi-aims.210226/build/aims.210226.scalapack.mpi.x | tee aims.out

# check convergence in geometry relaxation
grep ' Maximum force component is' aims.out 

