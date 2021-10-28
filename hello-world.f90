! Hello world program

PROGRAM hello
  INCLUDE 'mpif.h'
  INTEGER myrank, mysize, err
  CALL MPI_INIT(err)
  CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, err)
  CALL MPI_COMM_SIZE(MPI_COMM_WORLD, mysize, err)
  PRINT *, "Processor", myrank, "of", mysize, ": Hello world!"
  CALL MPI_FINALIZE(err)
END
