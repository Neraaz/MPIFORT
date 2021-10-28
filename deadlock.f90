PROGRAM simple_deadlock
INCLUDE 'mpif.h'
INTEGER myrank, ierr, status(MPI_STATUS_SIZE)
REAL a(100), b(100)
! Initialize MPI:
call MPI_INIT(ierr)
! Get my rank:
call MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)
! Process 0 receives and sends; same for process 1
if( myrank.eq.0 )then
call MPI_RECV( b, 100, MPI_REAL, 1, 19, MPI_COMM_WORLD, status,ierr )
call MPI_SEND( a, 100, MPI_REAL, 1, 17, MPI_COMM_WORLD, ierr)
else if ( myrank.eq.1 )then
call MPI_RECV( b, 100, MPI_REAL, 0, 17, MPI_COMM_WORLD, status,ierr)
call MPI_SEND( a, 100, MPI_REAL, 0, 19, MPI_COMM_WORLD, ierr)
endif
! Terminate MPI:
call MPI_FINALIZE(ierr)
END
