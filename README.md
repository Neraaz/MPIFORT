Practicing MPI-FORTRAN from tutorial authored by Author: Blaise Barney, Lawrence Livermore National Laboratory 
Website: https://hpc-tutorials.llnl.gov/mpi/

First load mpi program. i.e. If it is already there. Otherwise, We need to install openmpi package.
module load openmpi


do mpif90 --show to find what command should we use. For example, It could give
command=gfortran -I/gpfs/opt/base/openmpi-2.1.1/include -pthread -I/gpfs/opt/base/openmpi-2.1.1/lib -Wl,-rpath -Wl,/gpfs/opt/base/openmpi-2.1.1/lib -Wl,--enable-new-dtags -L/gpfs/opt/base/openmpi-2.1.1/lib -lmpi_usempi -lmpi_mpifh -lmpi


Now do "command hello-world.f90 -o a.out" gives us an executable a.out.

Finally, "mpirun -np 4 a.out" will execute the code in 4 processors.

Take a look inside hello-world.f90.

*****************************************************************
PROGRAM hello
  INCLUDE '/gpfs/opt/base/openmpi-2.1.1/include/mpif.h' ! simply INCLUDE 'mpif.h' should work.
  INTEGER err
  CALL MPI_INIT(err)
  Print *, "Hello world!", err
  CALL MPI_FINALIZE(err)
END
*****************************************************************
