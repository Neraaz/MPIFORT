PROGRAM safe_exchange
INCLUDE 'mpif.h'
INTEGER myrank, ierr, status(MPI_STATUS_SIZE)
REAL a(100), b(100)
! Initialize MPI:
call MPI_INIT(ierr)
! Get my rank:
call MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)
! Process 0 receives and sends; process 1 sends and receives
if( myrank.eq.0 )then
call MPI_SEND( a, 100, MPI_REAL, 1, 17, MPI_COMM_WORLD, ierr)
call MPI_RECV( b, 100, MPI_REAL, 1, 19, MPI_COMM_WORLD, status,ierr)
else if ( myrank.eq.1 )then
call MPI_SEND( a, 100, MPI_REAL, 0, 19, MPI_COMM_WORLD, ierr )
call MPI_RECV( b, 100, MPI_REAL, 0, 17, MPI_COMM_WORLD, status,ierr)
endif
! Terminate MPI:
call MPI_FINALIZE(ierr)
END
