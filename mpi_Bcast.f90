program scatter
include 'mpif.h'
integer SIZE
parameter (SIZE=4)
integer numtasks, rank, sendcount, source, ierr
integer status(MPI_STATUS_SIZE)
real*4 sendbuf(SIZE,SIZE), recvbf(SIZE,SIZE)
data sendbuf /1.0, 2.0, 3.0, 4.0, &
              5.0, 6.0, 7.0, 8.0, &
              9.0, 10.0, 11.0, 12.0, &
              13.0, 14.0, 15.0, 16.0 /

call MPI_INIT(ierr)
call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)
call MPI_COMM_SIZE(MPI_COMM_WORLD, numtasks, ierr)

if (numtasks .eq. SIZE) then
 source=0
 sendcount=SIZE
  call MPI_BCAST(sendbuf, sendcount, MPI_REAL, source, MPI_COMM_WORLD, ierr)
 print *, 'rank= ', rank, 'Results: ', sendbuf
else
 print *, 'Must specify', SIZE, 'processors. Terminating.'
end if
call MPI_FINALIZE(ierr)
end
