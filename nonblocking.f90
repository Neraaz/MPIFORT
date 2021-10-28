PROGRAM simple_deadlock_avoided
INCLUDE 'mpif.h'
INTEGER myrank, ierr, status(MPI_STATUS_SIZE)
INTEGER request
REAL a(100), b(100)

call MPI_INIT(ierr)
! Get my rank:
call MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)
! Process 0 posts a receive, then sends; same for process 1
if ( myrank.eq.0 ) then
 call MPI_IRECV( b, 100, MPI_REAL, 1, 19, MPI_COMM_WORLD, request,ierr)
 call MPI_SEND( a, 100, MPI_REAL, 1, 17, MPI_COMM_WORLD, ierr)
 call MPI_WAIT( request, status, ierr)
else if( myrank.eq.1 ) then
call MPI_IRECV( b, 100, MPI_REAL, 0, 17, MPI_COMM_WORLD, request,ierr)
call MPI_SEND( a, 100, MPI_REAL, 0, 19, MPI_COMM_WORLD, ierr)
call MPI_WAIT( request, status, ierr )
endif
! Terminate MPI:
call MPI_FINALIZE(ierr)
END
