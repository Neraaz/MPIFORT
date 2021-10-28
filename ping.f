PROGRAM ping
INCLUDE 'mpif.h'
INTEGER numtasks, rank, dest, source, count, tag, ierr
INTEGER stat(MPI_STATUS_SIZE)
CHARACTER inmsg, outmsg
outmsg = 'x'
tag = 1
CALL MPI_INIT(ierr)
CALL MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)
CALL MPI_COMM_SIZE(MPI_COMM_WORLD, numtasks, ierr)
if (rank .eq. 0) then
 dest=1
 source=1
 CALL MPI_SEND(outmsg, 1, MPI_CHARACTER, dest, tag, MPI_COMM_WORLD,ierr)
 CALL MPI_RECV(inmsg, 1, MPI_CHARACTER, source, tag, MPI_COMM_WORLD, stat,ierr)
else if (rank .eq. 1) then
 dest=0
 source=0
 CALL MPI_RECV(inmsg, 1, MPI_CHARACTER, source, tag, MPI_COMM_WORLD,stat, ierr)
 CALL MPI_SEND(outmsg, 1, MPI_CHARACTER, dest, tag, MPI_COMM_WORLD,ierr)
end if

